import sys, os, re, time
import xml.etree.ElementTree as ET
import numpy as np
from constants import *
from elph_classes import nm_sym_displacements,stoch_displacements, coord_com


def abc2h(abc):
    """
    Returns a lattice vector (in input units) matrix in upper triangular form
    i.e., each columns of the matrix represent the unit vectors
    given a description in terms of the lattice vector lengths
    and the angles(degree) in between.
    """
    a = abc[0]; b = abc[1]; c = abc[2]
    alpha = np.deg2rad(abc[3]); beta = np.deg2rad(abc[4]); gamma = np.deg2rad(abc[5])
    h = np.zeros((3, 3), np.float64)
    h[0, 0] = a
    h[0, 1] = b * np.cos(gamma)
    h[0, 2] = c * np.cos(beta)
    h[1, 1] = b * np.sin(gamma)
    h[1, 2] = (b * c * np.cos(alpha) - h[0, 1] * h[0, 2]) / h[1, 1]
    h[2, 2] = np.sqrt(c**2 - h[0, 2]**2 - h[1, 2]**2)
    return h

def h2abc(h):
    """
    Returns abc(a,b,c,alpha,beta,gamma) when cell vectors (h) in upper triangular matrix are provided.
    Return unit: angles in degree, lengths in supplied unit
    """
    a = float(h[0, 0])
    b = np.sqrt(h[0, 1] ** 2 + h[1, 1] ** 2)
    c = np.sqrt(h[0, 2] ** 2 + h[1, 2] ** 2 + h[2, 2] ** 2)
    gamma = np.acos(h[0, 1] / b) * 180 / np.pi
    beta = np.acos(h[0, 2] / c) * 180 / np.pi
    alpha = np.acos(np.dot(h[:, 1], h[:, 2]) / (b * c)) * 180 / np.pi

    return np.array([a, b, c, alpha, beta, gamma])


def grep(file_path, pattern, cols):
    """
    It greps a line from a file and then reads specic columns from that line
    and returns it as an array.
    Args:
         file_path = A string specifying a path of the file to be read
         pattern = A pattern (string) that we look for
         cols = A tuple of columns that we want to read from the grepped line
    """
    os.system("grep '"+ pattern + "' " + file_path + " > tmp")
    data_array = np.genfromtxt("tmp",usecols = cols,dtype=np.float64)
    os.system("rm -rf tmp")
    return data_array

def quaternion_fit(ref_coord, coord, mass):
    """
    This function fits a quaternion that rotates a set of 3N-coordinates into a a set of ref coordinates.
    Citation: SIMON K. KEARSLEY, Acta Cryst. (1989). A45, 208-210
    Args: ref_coord = 3N cartesian coordinates for the reference structure
          coord = 3N cartesian coordinates for the rotated rigid body
          mass = mass-matrix
    Returns rotated_coordinate and rotation matrix
    """
    if len(ref_coord) != len(coord):
       raise ValueError("len(ref_coord) != len(coord)")
    if len(ref_coord) != len(mass):
       raise ValueError("len(ref_coord) != len(mass)")
    natoms = len(coord)//3
    massinv = np.array([1/np.sqrt(mass[i]) for i in range(len(mass))])
    p = (ref_coord + coord) * massinv  #plus combination
    m = (ref_coord - coord) * massinv  #minus combination
    p = p.reshape(natoms,3); m = m.reshape(natoms,3)
    Q = np.zeros((4,4),np.float64)

    Q[0,0] = np.dot(m[:,0],m[:,0]) + np.dot(m[:,1],m[:,1]) + np.dot(m[:,2],m[:,2])
    Q[0,1] = np.dot(p[:,1],m[:,2]) - np.dot(m[:,1],p[:,2])
    Q[0,2] = np.dot(m[:,0],p[:,2]) - np.dot(p[:,0],m[:,2])
    Q[0,3] = np.dot(p[:,0],m[:,1]) - np.dot(m[:,0],p[:,1])
    Q[1,1] = np.dot(m[:,0],m[:,0]) + np.dot(p[:,1],p[:,1]) + np.dot(p[:,2],p[:,2])
    Q[1,2] = np.dot(m[:,0],m[:,1]) - np.dot(p[:,0],p[:,1])
    Q[1,3] = np.dot(m[:,0],m[:,2]) - np.dot(p[:,0],p[:,2])
    Q[2,2] = np.dot(p[:,0],p[:,0]) + np.dot(m[:,1],m[:,1]) + np.dot(p[:,2],p[:,2])
    Q[2,3] = np.dot(m[:,1],m[:,2]) - np.dot(p[:,1],p[:,2])
    Q[3,3] = np.dot(p[:,0],p[:,0]) + np.dot(p[:,1],p[:,1]) + np.dot(m[:,2],m[:,2])

    for i in range(4):
        for j in range(i+1,4):
            Q[j,i] = Q[i,j]


    eigval,eigvec = np.linalg.eigh(Q)
    q = eigvec[:,0]; qnorm = np.linalg.norm(q)
    
    if np.abs(qnorm-1.000000) > 0.000001: 
       q = q/qnorm 

    q = np.insert( q, 0, 0)

    rot_matrix = np.zeros((3,3),np.float64)
    rot_matrix[0,0] = q[1]*q[1] + q[2]*q[2] - q[3]*q[3] - q[4]*q[4]
    rot_matrix[0,1] = 2 * ( q[2]*q[3] + q[1]*q[4] )
    rot_matrix[0,2] = 2 * ( q[2]*q[4] - q[1]*q[3] )
    rot_matrix[1,0] = 2 * ( q[2]*q[3] - q[1]*q[4] )
    rot_matrix[1,1] = q[1]*q[1] - q[2]*q[2] + q[3]*q[3] - q[4]*q[4]
    rot_matrix[1,2] = 2 * ( q[3]*q[4] + q[1]*q[2] )
    rot_matrix[2,0] = 2 * ( q[2]*q[4] + q[1]*q[3] )
    rot_matrix[2,1] = 2 * ( q[3]*q[4] - q[1]*q[2] )
    rot_matrix[2,2] = q[1]*q[1] - q[2]*q[2] - q[3]*q[3] + q[4]*q[4]
    return rot_matrix

def rotate_vector(rot_matrix,vector):
    """Rigid body rotation of a 3N dimensional vector given a rotation matrix"""
    natoms = len(vector)//3; vector = np.reshape(vector,(natoms,3))
    rot_vector = np.array([])
    for i in range(natoms):
        rot_vector = np.append(rot_vector, np.dot(rot_matrix,vector[i]))
    return rot_vector

def remove_trans_rot(ref_coord, coord, mass, rotation=True, forces=None, wrt_com=False):
    """
    Rotates coordinates and forces(optional) so that the coordinates
    superimposed to a reference coordinates by rigid body rotation.
    This is to be used to remove rotation from a trajectory
    Args: ref_coord = 3N cartesian coordinates for the reference structure
          coord = 3N cartesian coordinates for the rotated rigid body
          mass = mass-matrix
          rotation = if True, angular momentum would be removed from coord w.r.t ref_coord
          forces = if supplied then forces would be rotated back to ref_coord frame
          wrt_com = if True, coordinates w.r.t c.o.m would be returned
    """
    #print("removing translational and rotational motion")
    natoms = len(coord)//3
    if len(ref_coord) != len(coord):
       raise ValueError("len(ref_coord) != len(coord)") 
    if len(mass) == len(coord): 
       pass
    elif len(mass) == len(coord)//3: 
       tmp_mass = np.copy(mass)
       mass = np.array([[tmp_mass[i], tmp_mass[i], tmp_mass[i]] for i in range(len(tmp_mass))])
       mass = mass.reshape(3*natoms)
    else: 
       raise ValueError("Dimensions of mass and coord are not consistent.")

    ref_coord, ref_com = coord_com(ref_coord,mass)
    new_coord, com = coord_com(coord,mass)
    if rotation:
       rot_matrix = quaternion_fit(ref_coord, new_coord, mass)
       new_coord = rotate_vector(rot_matrix,new_coord)
    if not wrt_com:
       new_coord = np.reshape( np.reshape(new_coord,(natoms,3)) + ref_com, 3*natoms )
    if forces is None:
       return new_coord
    else:
       rot_forces = rotate_vector(rot_matrix,forces)
       return new_coord, rot_forces   


class xyz:
      """
         This class contains methods related to xyz file
         Args: file_path = path of the XYZ file
               io = input/output status: Options r= reading a file and storing data; w = writing into an xyz
               atoms = A list containing atom symbols; mandatory in in 'io = w"' mode
               pos_unit, cell_unit --> optional for 'io = w' mode; define unit of given coordinate and cell
      """
      def __init__(self, file_path, io='r', atoms=None, pos_unit='atomic_unit', cell_unit='atomic_unit'):
          init_time = time.time()
          self.io = io
          if self.io == 'r':
             self.__get_xyz_info(file_path)
             self.coords = np.zeros((self.nframes,3*self.natoms),np.float64)
             for i in range(self.nframes): 
                 self.coords[i] = (self.get_frame(frame=i+1))[1]
          elif self.io == 'w':
             self.out_xyz = open(file_path,"w+")
             if atoms is None:
                sys.exit("Cannot initialize xyz class in 'io = w' mode without a list of atoms")
             self.atoms = atoms; self.pos_unit = pos_unit; self.cell_unit = cell_unit; self.natoms = len(atoms)
             self.iconfg = 0
          else:
             raise NotImplementedError("xyz class: io status must be r or w.")

          self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                         for element in self.atoms]).reshape(3*self.natoms)

          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on xyz class: " + str(exec_time) + " s.")

          #### Printing to test global variables:
          #print(self.atoms); print(self.natoms); print(self.pos_unit); print(self.cell_unit)
          

      def __get_xyz_info(self,file_path):
          if self.io == 'w':
             raise NotImplementedError("xyz class: __get_xyz_info not implemented for io = w.") 
          xyz_file = open(file_path)
          self.traj_lines = xyz_file.readlines()
          xyz_file.close()
          self.natoms = int(self.traj_lines[0].split()[0])
          self.nframes = int(len(self.traj_lines)/(self.natoms+2))
          remainder = len(self.traj_lines)%(self.natoms+2)
          if remainder != 0:
             sys.exit("xyz class: File: "+file_path+ " is truncated")
          self.atoms = []
          for iline in range(2,self.natoms+2):
              self.atoms.append(self.traj_lines[iline].split()[0])
          self.cell_tag = None
          comment = self.traj_lines[1].split()
          self.pos_unit = "angstrom"; self.cell_unit = "angstrom"
          ### detecting i-PI style comments
          if 'CELL(abcABC):' in comment:
              self.cell_tag='CELL(abcABC):'
          if self.cell_tag is not None:
             if ('x_centeroid{atomic_unit}' in comment) or ('positions{atomic_unit}' in comment):
                self.pos_unit='atomic_unit'
             if 'cell{atomic_unit}' in comment:
                self.cell_unit='atomic_unit'
          

      def get_frame(self, xyz_lines=None, frame=1):
          """Returns coordinates and cells of a specified frame in atomic_unit"""
          if self.io == 'w':
             raise NotImplementedError("xyz class: getframe is not implemented for io = w.")
          if xyz_lines is None:
             xyz_lines = self.traj_lines
          comment_line = xyz_lines[(frame-1)*(self.natoms+2)+1].split() 
          cell = self.__read_cell(comment_line)
          start_line = (frame-1)*(self.natoms+2)+2
          end_line = frame*(self.natoms+2)
          coord = np.zeros(3*self.natoms,np.float64)
          icoord = 0
          for iline in range(start_line,end_line):
              line_values = xyz_lines[iline].split()
              for value in line_values[1:]:
                  coord[icoord] = value
                  icoord += 1
          cell[0:3] *= unit2bohr[self.cell_unit]; coord *= unit2bohr[self.pos_unit]  ### converting to atomic unit( Bohr)                 
          return cell, coord

      def __read_cell(self, comment_line):
          """Reads i-PI style cell parameters"""
          if self.cell_tag is None:
             return None
          else:
             cell_tag_index = comment_line.index(self.cell_tag) 
             cell = np.zeros(6,np.float64)
             for i in range(6):
                 cell[i] = comment_line[cell_tag_index+i+1]
             return cell    


      def write(self, cell, coord):
          """
          This method writes the atoms & coordinates in an XYZ file with output unit angstrom
          cell parameters would be written in abcABC format
          """
          cell_write=True
          if cell is not None:
             cell = np.array(cell)
             if len(cell) == 6: cell[0:3] *= unit2ang[self.cell_unit]
             elif len(cell) == 9: 
                h = cell*unit2ang[self.cell_unit]; del cell; cell = h2abc(h)
             else: 
                print("xyz.write: Incorrect cell dimension. Allowed dimensions: 6 or 9.")
                cell_write = False
          else:
             cell_write = False

          if self.io == 'r':
             raise NotImplementedError("xyz class: write not implemented for io = r")          
          if len(coord) != 3*self.natoms:
             sys.exit("xyz class: dimensions of atoms and coord supplied to write are not consistent.")
          coord_angstrom = coord * unit2ang[self.pos_unit]   
          coord_angstrom = coord_angstrom.reshape((self.natoms,3))
          self.out_xyz.write("%d\n"%(self.natoms))
          if cell_write:
             self.out_xyz.write("# CELL(abcABC): %10.5f  %10.5f  %10.5f  %10.5f  %10.5f  %10.5f"\
                             %(cell[0],cell[1],cell[2],cell[3],cell[4],cell[5])+\
                          "  PyEPFD-Step: %d positions{angstrom} cell{angstrom}\n"%(self.iconfg))
          else: 
             self.out_xyz.write("#Cell-parameters not understood/supplied PyEPFD-Step: %d\n"%(self.iconfg)) 

          for iatom in range(self.natoms):
              self.out_xyz.write("%s    %15.8g  %15.8g  %15.8g\n"\
                      %(self.atoms[iatom], coord_angstrom[iatom,0], coord_angstrom[iatom,1], coord_angstrom[iatom,2]))
          self.iconfg += 1
          

class ionic_mover:
      """ 
         This class moves ions according to FD/NMFD/ENMFD/SD stochastic displacements(SD).
         Args:
             atoms = An N-dim character array containing atom Symbols
             opt_coord = 3N-dim column vector of cartesian coordinates of optimized geometry/struc.
             mode = Finite difference mode FD, NMFD, ENMFD or SNMFD
             deltax = displacement in au
             deltae  = energy scaled displacement in au
      """
      def __init__(self,atoms,opt_coord,mode,deltax=0.005,deltae=0.001,dynmat=None,mass=None,ngrid=1,temperature=0):
          init_time = time.time()
          self.atoms = atoms; self.natoms = len(self.atoms);self.opt_coord = np.array(opt_coord)
          if len(self.opt_coord) != 3*self.natoms:
             sys.exit("dimensions of atoms and coordinates supplied to ionic_mover class are not consistent.") 
          self.mode = mode.lower(); self.deltax = deltax; self.deltae = deltae
          self.dynmat = dynmat; self.mass = mass

          self.__define_mass()

          self.disp_coord = np.copy(self.opt_coord)
          if 'fd' in self.mode: 
             ###self.disp_coord = np.copy(self.opt_coord)
             for i in range(6*ngrid*self.natoms):
                 self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             if   ngrid==1 : self.step_list = [1.0,-1.0]
             elif ngrid==2 : self.step_list = [2.0,1.0,-1.0,-2.0]
             elif ngrid==3 : self.step_list = [3.0,2.0,1.0,-1.0,-2.0,-3.0]
             elif ngrid==4 : self.step_list = [4.0,3.0,2.0,1.0,-1.0,-2.0,-3.0,-4.0]
             else: raise ValueError("ionic_mover class: For 'fd' moves allowed values of ngrid are 1,2,3 and 4")

          if self.mode == 'fd':
              self._cart_disp()    

          elif (self.mode == 'nmfd') | (self.mode == 'enmfd'): 
             if self.dynmat is None:
                sys.exit("For nmfd/enmfd/snmfd modes dynamical matrix must be supplied to ionic_mover") 
             self._nm_disp()  

          elif self.mode == 'mc':
             if (dynmat is None) | (temperature is None):
                sys.exit("For mc modes dynamical matrix and a temperature must be supplied to ionic_mover class") 
             self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             #print(self.disp_coord.shape)
             self._mc()

          else:
             raise NotImplementedError("Allowed modes: fd/nmfd/enmfd/snmfd")
          
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on ionic_mover class: " + str(exec_time) + " s.")
      
      def _cart_disp(self):
          """deltax is a scaler"""
          idisp = 1
          for icart in range(3*self.natoms):
              for step in self.step_list:
                  self.disp_coord[icart,idisp] += self.deltax*step
                  idisp += 1

      def _nm_disp(self):
             nmfd = nm_sym_displacements( dynmat = self.dynmat, mass = self.mass,\
                                             mode = self.mode, deltax = self.deltax, deltae = self.deltae)
             idisp = 1
             #print(nmfd.displacements)
             for imode in range(len(nmfd.displacements)):
                 for step in self.step_list:
                     nm_disp = np.zeros(3*self.natoms,np.float64)
                     nm_disp[imode] = nmfd.displacements[imode]*step
                     #print(nmfd.nm2cart_disp(nm_disp).reshape(self.natoms,3))
                     self.disp_coord[:,idisp] +=  nmfd.nm2cart_disp(nm_disp)
                     idisp += 1
                     print("idisp = %d"%idisp)
                     #print(nm_disp)    
      def _mc(self):
          nmmc = stoch_displacements( dynmat = self.dynmat, mass = self.mass,\
                                      asr = 'crystal', temperature = 0)
          for idisp in range(2):
              self.disp_coord[:,idisp] += nmmc.nm2cart_disp(nmmc.nmdisp[idisp])

      def __define_mass(self):
          """Computes mass matrix based on supplied symbols"""
          if self.mass is None:
             self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                         for element in self.atoms]).reshape(3*self.natoms) 

class qbox:
      """
      This class has methods related to qbox inputs and outputs 

      """
      def __init__(self,file_path,io='w', atoms=None, run_cmd = None, reorder=True):
          """
          Args: file_path = path of the qbox input or output file
          io = input/output status: Options r= reading from a qbox output and storing data; 
                                            w = writing a qbox input file
          atoms = A list containing atom symbols; mandatory in in 'io = w' mode
          internal length units are Bohr and angle units are degrees. 
          """
          init_time = time.time()
          self.io = io; self.file_path = file_path
          if self.io == 'r':
             self.cellabc, self.atoms, self.input_indices = self.__getsystem__(self.file_path);   
             self.natoms = len(self.atoms) ; self.etotals = self.getenergy();  
             try: self.nframes = self.etotals.shape[0]
             except IndexError: self.nframes = self.etotals.size
             self.forces = self.getv('<force>');   self.coords = self.getv('<position>')
             if reorder: self._reorder()
          elif self.io == 'w':
             self.qbfil = open(file_path,"w+")
             if atoms is None:
                sys.exit("Cannot initialize qbox class in 'io = w' mode without a list of atoms")
             if run_cmd is None:
                sys.exit("Cannot initialize qbox class in 'io = w' mode without a run_cmd") 

             self.atoms = atoms; self.natoms = len(atoms); self.run_cmd = run_cmd
             self.atom_symbols = [atoms[i]+str(i+1).zfill(len(str(self.natoms))) for i in range(self.natoms)]
             self._iconfg = 0
          else:
             raise NotImplementedError("qbox class: io status must be r or w.")
          
          self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                         for element in self.atoms]).reshape(3*self.natoms)
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on qbox class: " + str(exec_time) + " s.")

      def write(self, cell, coord):
          """
          This method writes the atoms & coordinates in an XYZ file with output unit angstrom 
          Arg: cell and coord in atomic_unit
          """
          #if len[cell] == 6: h = abc2h(cell)
          #elif len[cell] == 9: pass
          #else: raise ValueError("qbox.write: Incorrect cell dimension. Allowed dimensions: 6 or 9") 

          h = abc2h(cell)
          if self.io == 'r':
             raise NotImplementedError("qbox class: write is not implemented for io = r")
          if len(coord) != 3*self.natoms:
             sys.exit("qbox class: dimensions of atoms and coord supplied to write are not consistent.")

          coord = coord.reshape(self.natoms,3)
          self.qbfil.write("# input for iteration: %d\n" %(self._iconfg+1))

          for i in range(self.natoms):
              self.qbfil.write(" move %6s to %12.6f %12.6f %12.6f\n"\
                  %(self.atom_symbols[i], coord[i,0], coord[i,1], coord[i,2]))

          self.qbfil.write(" set cell ")
          for i in range(3):
              for j in range(3):
                  self.qbfil.write("%12.6f " %(h[j,i]))
          self.qbfil.write("\n")
          self.qbfil.write(" %s \n" %(self.run_cmd))
          self._iconfg += 1

      def getv(self, quantity):
          """ get vectors (forces or xyz positions") and returns it as a 2D vectors where
              each rows are 3N coordinates of a snapshot/configuration
          """
          if (quantity == '<force>') | (quantity == '<position>'): pass
          else: raise NotImplementedError("quantity must be '<force>' or '<position>'")
          v = grep(file_path = self.file_path, pattern = quantity, cols=(1,2,3))
          v = v.flatten().reshape(self.nframes,3*self.natoms)
          return v

      def getenergy(self):
          etotals = np.array( grep(file_path = self.file_path, pattern = "<etotal>", cols=(1)) )
          try: len(etotals)
          except TypeError: etotals = np.array([etotals])
          return etotals

      def _reorder(self):
          """Reorders the forces and coordinates according to input indices"""
          if self.input_indices == [i+1 for i in range(self.natoms)]:
             return
          else:
              print("Reording atoms, forces, and coordinates according to input sequence.")
              input_cart_ind = []
              atoms = self.atoms.copy()
              for i in range(self.natoms):
                  self.atoms[self.input_indices[i]-1] = atoms[i]
                  input_cart_ind.append((self.input_indices[i]-1)*3)
                  input_cart_ind.append((self.input_indices[i]-1)*3+1)
                  input_cart_ind.append((self.input_indices[i]-1)*3+2)
              #print(input_cart_ind)    
              for i in range(self.nframes):
                  self.coords[i,:] = self._reorder_vec(input_cart_ind, self.coords[i,:])
                  self.forces[i,:] = self._reorder_vec(input_cart_ind, self.forces[i,:])

      def _reorder_vec(self,input_cart_ind,vec):
          """reorders a vector according to input indices"""
          reord_vec = np.copy(vec)
          for i in range(len(vec)):
              #print(i, input_cart_ind[i])
              reord_vec[input_cart_ind[i]] = vec[i]
          return reord_vec    
          

      @staticmethod
      def __getsystem__(file_path):
          qbout = open(file_path, 'r')
          read = True
          store_xml = False
          xml_str = ''
          while read:
             line = qbout.readline()
             if '<iteration' in line: store_xml = True
             if store_xml: xml_str += line
             if '<iteration' in line: store_xml = True
             if 'iteration>' in line: read = False
          qbout.close()
          root = ET.fromstring(xml_str)
          atoms = []; input_atom_index = []
          for atom in root.findall('./atomset/atom'):
              atoms.append(re.sub( r"\d+", "", atom.attrib['name']))
              input_atom_index.append(int(re.sub( r"[a-zA-Z]", "", atom.attrib['name'])))
          cell = np.zeros(6,np.float64)
          cell_addresses = ['./unit_cell_a_norm','./unit_cell_b_norm', 'unit_cell_c_norm',\
                            'unit_cell_alpha', 'unit_cell_beta', 'unit_cell_gamma']
          for i in range(6): cell[i] = float(root.find(cell_addresses[i]).text)
          return cell, atoms, input_atom_index


def write_nmode(atoms, cell_v, opt_coord, mode_v, mode_freq, file_path='dynmat',fmt = 'axsf'):
    """
    It takes atoms, cell vectors, their positions (optimized)
    and normal mode (mass scaled) coordinates and normal mode frequencies as arguments
    and writes them into (i)   animated xsf (axsf) file or 
                         (ii)  VMD normal mode file (nmd) or
                         (iii) molden file
    """
    nmodes = len(mode_v)
    natoms = len(atoms)
    if nmodes != 3*natoms:
       raise ValueError("Dimensions of atoms and mode_v are not consistent") 
    if len(opt_coord) != 3*natoms:
       raise ValueError("Dimensions of atoms and opt_coord are not consistent") 
    opt_coord = np.array(opt_coord * bohr2unit["angstrom"]).reshape(natoms,3)
    #print(opt_coord[0,2])
    cell_v = cell_v * bohr2unit["angstrom"]
    mode_freq = mode_freq * ha2unit["cm-1"]
    outfil = open(file_path+'.'+fmt,'w+')
 
    if fmt == 'axsf':
       outfil.write("ANIMSTEPS %d\n CRYSTAL\n PRIMVEC\n"%(nmodes));
       for i in range(len(cell_v)):
           outfil.write(" %15.9f %15.9f %15.9f\n"%(cell_v[0,i], cell_v[1,i], cell_v[2,i]))
       for imode in range(nmodes):
           outfil.write("PRIMCOORD  %d\n   %d  1\n"%(imode+1,natoms))
           mode_v_tmp = np.array(mode_v[:,imode]).reshape(natoms,3)
           for i in range(natoms):
               outfil.write("     " + atoms[i] + "   ")
               outfil.write(" %14.6g %14.6g %14.6g"%(opt_coord[i,0], opt_coord[i,1], opt_coord[i,2]))
               outfil.write(" %14.6g %14.6g %14.6g\n"%(mode_v_tmp[i,0], mode_v_tmp[i,1], mode_v_tmp[i,2]))
               #print(i, opt_coord[i,0], opt_coord[i,1], opt_coord[i,2])

    elif fmt == 'nmd':
       outfil.write("title PyEPFD-nmodes \nnames ")
       for i in range(natoms): outfil.write(atoms[i] + " ")
       outfil.write("\ncoordinates ")
       for i in range(natoms): 
           outfil.write( str(opt_coord[i,0]) +" "+str(opt_coord[i,1])+" "+str(opt_coord[i,2])+" " )
       for imode in range(nmodes):
           outfil.write("\nmode %d %14.6g "%(imode+1, 1.0/mode_freq[imode]))
           for i in range(3*natoms): outfil.write( "%14.6g "%(mode_v[i,imode]) )

    elif fmt == 'molden':
       outfil.write("[Molden Format]\n[FREQ]\n")
       for imode in range(nmodes):  outfil.write("  %10.4f \n"%mode_freq[imode])
       outfil.write("[FR-COORD]\n")
       for i in range(natoms): 
           outfil.write( "  %s  %14.6g %14.6g %14.6g \n"\
                        %(atoms[i],opt_coord[i,0], opt_coord[i,1], opt_coord[i,2]) )
       outfil.write("[FR-NORM-COORD]\n")    
       for imode in range(nmodes): 
           outfil.write(" vibration    %d\n"%(imode+1))
           mode_v_tmp = np.array(mode_v[:,imode]).reshape(natoms,3)
           for i in range(natoms):
               outfil.write(" %14.6g %14.6g %14.6g\n"%(mode_v_tmp[i,0], mode_v_tmp[i,1], mode_v_tmp[i,2]))
