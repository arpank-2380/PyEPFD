# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

import sys, os, re, time
import xml.etree.ElementTree as ET
import numpy as np
from pyepfd.constants import *
from pyepfd.elph_classes import nm_sym_displacements,stoch_displacements, coord_com


def abc2h(abc):
    """
    --------------
    Function abc2h
    --------------
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
    --------------
    Function h2abc
    --------------
    Returns abc(a,b,c,alpha,beta,gamma) when cell vectors (h) in upper triangular matrix are provided.
    Return unit: angles in degree, lengths in supplied unit
    """
    a = float(h[0, 0])
    b = np.sqrt(h[0, 1] ** 2 + h[1, 1] ** 2)
    c = np.sqrt(h[0, 2] ** 2 + h[1, 2] ** 2 + h[2, 2] ** 2)
    gamma = np.arccos(h[0, 1] / b) * 180 / np.pi
    beta = np.arccos(h[0, 2] / c) * 180 / np.pi
    alpha = np.arccos(np.dot(h[:, 1], h[:, 2]) / (b * c)) * 180 / np.pi

    return np.array([a, b, c, alpha, beta, gamma])


def grep(file_path, pattern, cols):
    """
    ----------------------
    Function Grep
    ----------------------
    It greps a line from a file and then reads specic columns from that line
    and returns it as an array.
    
        **Arguments:**

            **file_path** = A string specifying a path of the file to be read
    
            **pattern** = A pattern (string) that we look for

            **cols** = A tuple of columns that we want to read from the grepped line
    """
    os.system("grep '"+ pattern + "' " + file_path + " > tmp")
    data_array = np.genfromtxt("tmp",usecols = cols,dtype=np.float64)
    os.system("rm -rf tmp")
    return data_array

def quaternion_fit(ref_coord, coord, mass):
    """
    -----------------------
    Function quaternion_fit
    -----------------------
    This function fits a quaternion that rotates a set of 3N-coordinates into a a set of ref coordinates.

    Citation: SIMON K. KEARSLEY, Acta Cryst. (1989). A45, 208-210
    
        **Arguments:**

            **ref_coord** = A vector of 3N cartesian coordinates for the reference structure

            **coord** = A vector of 3N cartesian coordinates for the rotated rigid body

            **mass** = A (3 *N* ) numpy array of mass

        **Returns:** 

            A (3 x 3) rigid-body rotation matrix
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
    """
    ----------------------
    Function rotate_vector
    ----------------------
    Performs a rigid body rotation of a 3N dimensional vector given a rotation matrix, 
    and returns resultant 3N dimensional vector.

        **Arguments:**

            rot_matrix = A (3 x 3) rigid-body rotation matrix

            vector = A 3N dimensional vector
            
    """
    natoms = len(vector)//3; vector = np.reshape(vector,(natoms,3))
    rot_vector = np.array([])
    for i in range(natoms):
        rot_vector = np.append(rot_vector, np.dot(rot_matrix,vector[i]))
    return rot_vector

def remove_trans_rot(ref_coord, coord, mass, rotation=True, forces=None, wrt_com=False):
    """
    -------------------------
    Function remove_trans_rot
    -------------------------
    Rotates coordinates and forces(optional) so that the coordinates
    superimposed to a reference coordinates by rigid body rotation.
    This is to be used to remove rotation from a trajectory.

        **Arguments:**

            **ref_coord** = A 3N-dimensional vector of cartesian coordinates defining the 
            reference configuration of the rigid body

            **coord** = A 3N-dimensional vector of cartesian coordinates defining the
            rotated rigid body

            **mass** = A (3N x 3N) matrix of mass of 3N particles.

            **rotation** = Do you want to remove angular momentum/rotation?
            Allowed values are:
            **(1)** *True*(Default): Angular momentum would be removed from **coord** w.r.t **ref_coord**
            OR
            **(2)** *False*: Angular momentum would not be removed.

            **forces** (optional) = *None* (Default) OR 
            A 3N-dimensional vector of forces in rotated reference frame
            if supplied then forces would be rotated back to ref_coord frame

            **wrt_com** = Do you want to obtain the coordinates with tespect to center of mass (c.o.m)?
            Allowed values are:
            **(1)** *True*: Coordinates with respect to c.o.m would be returned
            OR
            **(2)** *False*(Default): Coordinates with respect to original refence point 
            would be returned.

        **Returns:**

            (1) A 3N-dimensional vector of Cartesian coordinates after back-rotation

            (2) A 3N-dimensional vector of Cartesian forces after back-rotation if **forces** is **not None**
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
      ===========
      Class XYZ
      ===========
         This class contains methods related to xyz file. It can read a given xyz file or 
         given atoms and coordinates it can create an xyz file.

            **Arguments:** 

                **file_path** = path of the XYZ file

                **io** = input/output status. Allowed values are:
                **(1)** *'r'*: In this mode the class would read an xyz file and store data;
                OR
                **(2)** *'w'* = In this mode the class would write an xyz file.

                **atoms** = A python list containing atom symbols. 
                This is mandatory while ``io = 'w'``.

                **xyz_unit** = Position unit. Allowed values are:
                **(1)** *'atomic_unit'* (default), OR
                **(2)** *'angstrom'*.
                This argument is optional for **io** = *'w'* mode; 
                while in ``io = 'r'`` mode this argument is not used. 

                **cell_unit** = Cell parameter unit. Allowed values are:
                **(1)** *'atomic_unit'* (default), OR
                **(2)** *'angstrom'*.
                This argument is optional for ``io = 'w'`` mode; 
                while in ``io = 'r'`` mode this argument is not used.

                **quantity** = Allowed values are:
                **(1)** *'pos'* (default): positions, OR
                **(2)** *'mom'*: momentums, OR
                **(3)** *'force'*: forces, OR
                **(4)** *'vel'*: velocities
                This is only valid for ``io = 'r'`` mode.

                **reorder_seq** (optional) = A python list of atom symbols defining the order in which the information
                read from an xyz file would be saved. Only valid for ``io = 'r'`` mode. 
      """
      def __init__(self, file_path, io='r', atoms=None, xyz_unit='atomic_unit', cell_unit='atomic_unit', \
                   quantity='pos', reorder_seq=None):
          init_time = time.time()
          self.io = io
          if self.io == 'r':
             if quantity == 'pos': self.pos = True
             elif quantity == 'mom': self.mom = True
             elif quantity == 'force': self.force = True
             elif quantity == 'vel': self.vel = True
             else: raise ValueError("Allowed values for quantity = 'pos', 'mom', 'force', 'vel'")
             if not self.pos: print("Warning! mom, force or velocities must be in atomic_unit")
             self.__get_xyz_info(file_path)
             self.coords = np.zeros((self.nframes,3*self.natoms),np.float64)
             self.cell = np.zeros((self.nframes,6),np.float64)
             for i in range(self.nframes): 
                 self.cell[i], self.coords[i] = self.get_frame(frame=i+1)
             if reorder_seq is not None:
                self.reorder_seq = reorder_seq
                self._reorder()
          elif self.io == 'w':
             self.out_xyz = open(file_path,"w+")
             if atoms is None:
                sys.exit("Cannot initialize xyz class in 'io = w' mode without a list of atoms")
             self.atoms = atoms; self.xyz_unit = xyz_unit; self.cell_unit = cell_unit; self.natoms = len(atoms)
             self.iconfg = 0
          else:
             raise NotImplementedError("xyz class: io status must be r or w.")

          self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                         for element in self.atoms]).reshape(3*self.natoms)

          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on xyz class: " + str(exec_time) + " s.")

          #### Printing to test global variables:
          #print(self.atoms); print(self.natoms); print(self.xyz_unit); print(self.cell_unit)
          

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
          self.xyz_unit = "angstrom"; self.cell_unit = "angstrom"
          ### detecting i-PI style comments
          if 'CELL(abcABC):' in comment:
              self.cell_tag='CELL(abcABC):'
          if self.cell_tag is not None:
             if ('x_centeroid{atomic_unit}' in comment) or ('positions{atomic_unit}' in comment):
                self.xyz_unit='atomic_unit'
             if ('f_centeroid{atomic_unit}' in comment) or ('forces{atomic_unit}' in comment):
                self.xyz_unit='atomic_unit'; self.force=True ; self.pos = False
             if ('p_centeroid{atomic_unit}' in comment) or ('momenta{atomic_unit}' in comment):
                 self.xyz_unit='atomic_unit'; self.mom=True; self.pos = False
             if ('v_centeroid{atomic_unit}' in comment) or ('velocities{atomic_unit}' in comment):    
                 self.xyz_unit='atomic_unit'; self.vel=True; self.pos = False
             if 'cell{atomic_unit}' in comment:
                self.cell_unit='atomic_unit'
          

      def get_frame(self, xyz_lines=None, frame=1):
          """
          ----------------
          Get Frame Method 
          ----------------
          This method returns coordinates and cells of a specified frame in atomic_unit

            **Arguments:**

                **xyz_lines** = A python list containing lines from an xyz file. 
                Default value is *None* in which case all lines of the given xyz file
                is included.

                **frame** = An *integer* defining the frame number from the given xyz 
                trajectory which we would like to save.
          """
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
          cell[0:3] *= unit2bohr[self.cell_unit]; 
          if self.pos: coord *= unit2bohr[self.xyz_unit]  ### converting to atomic unit( Bohr)                 
          return cell, coord

      def __read_cell(self, comment_line):
          """
          Reads i-PI style cell parameters
          """
          if self.cell_tag is None:
             return None
          else:
             cell_tag_index = comment_line.index(self.cell_tag) 
             cell = np.zeros(6,np.float64)
             for i in range(6):
                 cell[i] = comment_line[cell_tag_index+i+1]
             return cell    

      def _reorder(self):
          """
          Reorders atoms and coordinates according to the supplied
          reorder_seq.
          """
          print("reording atoms and x,y,z coordinates")
          reord_indices = []
          for atom in self.reorder_seq:
              for i, x in enumerate(self.atoms):
                  if x == atom:
                     reord_indices.append(i)
          cart_ind = []
          atoms = self.atoms.copy()
          for i in range(self.natoms):
              j = reord_indices[i]
              self.atoms[i] = atoms[j]
              cart_ind.append(j*3); cart_ind.append(j*3+1); cart_ind.append(j*3+2)

          for i in range(self.nframes):
                 vec = np.copy(self.coords[i,:])
                 for j in range(len(vec)):
                     self.coords[i,j] = vec[cart_ind[j]] 

      def write(self, cell, coord):
          """
          --------------
          Write Method
          --------------
          This method writes the atoms & coordinates in an XYZ file with output unit angstrom
          cell parameters would be written in abcABC format.

            **Arguments:**

                **cell** = A *numpy array* of length **6** or **9** containing the
                cell-parameters. If the length of the array is 6, it will assume
                that the supplied format is abcABC (lengths and angles). Otherwise, 
                it will assume that all three cell vectors are supplied.
                
                **coord** = A 3N-dimensional vector of cartesian coordinates.

          """
          cell_write=True
          if cell is not None:
             cell = np.array(cell)
             if len(cell) == 6: cell[0:3] *= unit2ang[self.cell_unit]
             elif len(cell) == 9: 
                h = cell*unit2ang[self.cell_unit]; del cell; cell = h2abc(h.reshape(3,3))
             else: 
                print("xyz.write: Incorrect cell dimension. Allowed dimensions: 6 or 9.")
                cell_write = False
          else:
             cell_write = False

          if self.io == 'r':
             raise NotImplementedError("xyz class: write not implemented for io = r")          
          if len(coord) != 3*self.natoms:
             sys.exit("xyz class: dimensions of atoms and coord supplied to write are not consistent.")
          coord_angstrom = coord * unit2ang[self.xyz_unit]   
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
      ========================
      Class ionic_mover
      ========================
         This class moves the ions(nuclei) according to 
         **FD**: Finite Displacement in Cartesian, OR 
         **NMFD**: Normal Mode Finite Displacement, OR 
         **ENMFD**: Energy-scaled Normal Mode Finite Displacement, OR 
         **SD**: Stochastic Displacement.

            **Arguments**:

                **atoms** = An N-dimensional character array containing atom Symbols

                **opt_coord** = 3N-dim column vector of cartesian coordinates of optimized geometry/struc.

                **mode** = Finite displacement mode. 
                    Options are:
                        **(1)** *'FD'*: Finite Displacement in Cartesian , 
                    OR
                        **(2)** *'NMFD'*: Normal Mode Finite Displacement, 
                    OR 
                        **(3)** *'ENMFD'*: Energy-scaled Normal Mode Finite Displacement, 
                    OR
                        **(4)** *'SD'*: Stochastic Displacement, 
                    OR
                        **(5)** *'NMS'*: Normal Mode Sampling, 
                    OR 
                        **(6)** *'ENMS'*: Energy-scaled Normal Mode Sampling

                   More Information
                    FD must be used for computing Cartesian normal-mode frequencies.
                    The dynamical matrix obtained in this way, can be used for 
                    NMFD/ENMFD/SD/NMS/ENMS calculations. NMFD/ENMFD can be used to refine
                    Cartesian frequencies or electron-phonon renormalizations. SD can be 
                    used to compute zero-point energy, vibrational energy including 
                    nuclear-quantum effects or electronic properties at a finite *T*.
                    NMS/ENMS can be used to scan/sample a few specific normal modes and
                    plot how energies/band gaps/ HOMO / LUMO changes along these few 
                    normal modes.

                    .. note::
                        For **FD/NMFD/ENMFD/NMS/ENMS** symmetric displacement is used.


                **deltax** = A displacement (*float*) in atomic unit (Bohr)

                **deltae**  = Energy scaled displacement (*float*) in atomic_unit (Hartree)

                **dynmat** = 3N x 3N dynamical matrix. Must be supplied for all modes except
                ``mode=FD``.

                **mass** = Mass-matrix

                **asr** = acoustic sum rule. 
                    Options are:
                        **(1)** *'none'* (Default): asr is **not** applied,
                    OR
                        **(2)** *'crystal'*: For infinite systems / crystals,
                    OR
                        **(3)** *'poly'*: For poly-atomic non-linear molecules,
                    OR
                        **(4)** *'lin'*: For any linear molecules

                **temperature** = A *float*. Default value is 0. It is only used for ``mode = SD``.
              
                **algo** = Algorithms to use for ``mode = SD``. 
                    Options are:
                        **(1)** *'OS'*: One-Shot method proposed by Zacharius and Giustino,
                        see Zacharius, M.; Giustino, F. 
                        One-shot calculation of temperature-dependent optical spectra and 
                        phonon-induced band-gap renormalization.
                        *Phys. Rev. B.* **2016**, *94*, 075125
                    OR
                        **(2)** *'OSAP'*: (Default): One-Shot method but with anti-thetic pair.
                    OR
                        **(3)** *'OSR'*: One-shot sampling of random signs as described in the 
                        paper: Karsai, F.; Engel, M.; Flage-Larsen, E; Kresse, G.
                        Electron-phonon coupling in semiconductors within the GW approximation.
                        *New J. Phys.* **2018**, *20*, 123008.
                        This is essentiatially same as the thermal line sampling proposed by 
                        Monserrat, see 
                        Monserrat, B. Vibrational averages along thermal lines.
                        *Phys. Rev. B* **2016**, *93*, 014302.
                    OR
                        **(4)** *'OSRAP'*: Same as OSR but including the antithetic-pairs.
                    OR
                        **(5)** *'MC'*: Monte-Carlo sampling along normal modes assuming harmonic
                        probability density
                    OR
                        **(6)** *'MCAP'*: Same as MC but including the antithetic pairs.

                **ngrid** = The number of displacement grid points.
                    Allowed values:
                        **(A)** *1-4* for ``mode = FD/NMFD/ENMFD``. Default value is 1.

                        **(B)** *Any positive integer* is allowed for ``mode = NMS/ENMS``.

                        **(C)** *1* for ``mode = SD`` and ``algo = OS/OSAP``.

                        **(D)** *Any positive integer* for ``mode = SD`` and 
                        ``algo = OSR/OSRAP/MC/MCAP``.

                **mode_only** (Optional) = A python-list of normal-mode indices 
                along which displacements are performed.
                
        **Returns**:
            *None*. Stores the displaced coordinates within the object 
            **coord_util.ionic_mover.disp_coord**

            .. note::
                In the set of displaced coordinates, undistorted structure is always included.
                Since FD/NMFD/NMS/ENMS employes symmetric displacement, for each normal mode
                additional 2*ngrid number of displaced coordinates would ve created. 
                
                For ``mode = SD``, 
                if ``algo = OS``: only 1 additional displaced coordinate would be created.
                If ``algo = OSAP``: only 1 additional displaced coordinates would be created.
                If ``algo = OSR/MC``: ngrid number of additional displaced coordinates would be created.
                If ``algo = OSRAP/MCAP``: 2*ngrid number of additional displaced coordinates 
                would be created.
            
      """
      def __init__(self,atoms,opt_coord,mode,deltax=0.005,deltae=0.001,\
                  dynmat=None,mass=None,ngrid=1,temperature=0,asr='none',algo='osap', nmode_only=None):
          init_time = time.time()
          self.atoms = atoms; self.natoms = len(self.atoms);self.opt_coord = np.array(opt_coord)          
          if len(self.opt_coord) != 3*self.natoms:
             sys.exit("dimensions of atoms and coordinates supplied to ionic_mover class are not consistent.") 
          self.mode = mode.lower(); self.deltax = deltax; self.deltae = deltae
          self.dynmat = dynmat; self.mass = mass; self.asr = asr; self.nmode_only = nmode_only

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
          
          if 'ms' in self.mode:
             for i in range(2*ngrid*len(nmode_only)):
                 self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             pos_steps = []; neg_steps = []
             for i in range(ngrid,0,-1): 
                 pos_steps.append(i*1.0)
             for i in range(1,ngrid+1): 
                 neg_steps.append(-1.0*i)
             self.step_list = pos_steps + neg_steps
             if self.mode == 'nms': self.mode = 'nmfd'
             if self.mode == 'enms': self.mode = 'enmfd'

          if self.mode == 'fd':
              self._cart_disp()    

          elif (self.mode == 'nmfd') | (self.mode == 'enmfd'): 
             if self.dynmat is None:
                sys.exit("For nmfd/enmfd/sd/nms/enms modes dynamical matrix must be supplied to ionic_mover") 
             self._nm_disp()  

          elif self.mode == 'sd':
             algo = algo.lower()
             if (dynmat is None) | (temperature is None):
                sys.exit("For sd modes dynamical matrix and a temperature must be supplied to ionic_mover class") 
             self.temperature = temperature
             if (algo == 'osr') | (algo == 'mc'):
                for i in range(ngrid-1): 
                    self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             elif (algo == 'osrap') | (algo == 'mcap'):
                for i in range(2*ngrid-1):
                    self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             elif (algo == 'os') | (algo == 'osap'):
                self.disp_coord = np.column_stack((self.disp_coord,self.opt_coord))
             else:
                raise NotImplementedError("Allowed values for algo are: 'os', 'osap', 'osr', 'osrap', 'mc' or 'mcap'")
             #print(self.disp_coord.shape)
             self._stoch_disp(algo = algo, ngrid = ngrid)

          else:
             raise NotImplementedError("Allowed modes: fd/nmfd/enmfd/sd")
          
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on ionic_mover class: " + str(exec_time) + " s.")
      
      def _cart_disp(self):
          """ Method to perform cartesian displacement for frequency calculation"""
          idisp = 1
          for icart in range(3*self.natoms):
              for step in self.step_list:
                  self.disp_coord[icart,idisp] += self.deltax*step
                  idisp += 1

      def _nm_disp(self):
          """Method to perform normal-mode displacements for frequency calculation"""        
          nmfd = nm_sym_displacements( dynmat = self.dynmat, mass = self.mass,\
                                          mode = self.mode, deltax = self.deltax, deltae = self.deltae)
          idisp = 1
          #print(nmfd.displacements)
          if self.nmode_only is None:
             sampled_modes = [i for i in range(len(nmfd.displacements))] 
          else:
             sampled_modes = [i-1 for i in self.nmode_only]
          #print("#Mode-index        Disp(au)   Disp(Freq-scaled)") 
          for imode in sampled_modes:
              freq_scaling = np.sqrt(nmfd.omega[imode])
              print("#Mode = %6d Disp-step(au) = %10.4f Disp-step(Freq-scaled) = %10.4f"\
                  %(imode+1, nmfd.displacements[imode],\
                    nmfd.displacements[imode]*freq_scaling))
              print("#Config    Disp(au)   Disp(Freq-scaled)")
              """
              .. note::
                The below loop will be parallelized using MPI4Py in next version.
              """
              for step in self.step_list:
                  nm_disp = np.zeros(3*self.natoms,np.float64)
                  nm_disp[imode] = nmfd.displacements[imode]*step
                  #print(nmfd.nm2cart_disp(nm_disp).reshape(self.natoms,3))
                  self.disp_coord[:,idisp] +=  nmfd.nm2cart_disp(nm_disp)
                  idisp += 1
                  print(" %d  %12.4f  %12.4f"\
                       %(idisp,nm_disp[imode],nm_disp[imode]*freq_scaling))
                  #print(nm_disp)    

      def _stoch_disp(self,algo,ngrid):
          """
          Method to perform stochastic displacements for ZPR/anharmonicity measure etc
          Args: algo = algorithm. Options: (i) 'os'(one-shot) (ii)'osap' (one-shot with antethetic pair)
                                          (iii)'osr' (one-shot with random signs);
                                          (iv) 'osrap' (one-shot with random signs and antethetic pairs for each point);
                                           (v) 'mc' (monte-carlo)
                ngrid = no of samples to be drawn fo 'osr', 'osrap' (2 * ngrid) and 'mc' method explained before.  
          """
          nmmc = stoch_displacements( dynmat = self.dynmat, mass = self.mass,\
                                      asr = self.asr, temperature = self.temperature,\
                                      ngrid = ngrid, algo = algo, nmode_only = self.nmode_only)
          """
          .. note::
            The below loop will be parallellized using mpi4py in the next version.
          """
          for idisp in range(len(nmmc.nmdisp)):
              self.disp_coord[:,idisp] += nmmc.nm2cart_disp(nmmc.nmdisp[idisp])

      def __define_mass(self):
          """Computes mass matrix based on supplied symbols"""
          if self.mass is None:
             self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                         for element in self.atoms]).reshape(3*self.natoms) 

class qbox:
      """
      ===================
      Class qbox
      ===================
      This class has methods related to qbox inputs and outputs 
        
        **Arguments:**

            **file_path** = Path to the qbox output/input file.
            
            **io** = input/output status. 
                Options are:
                    **(1)** *'r'*: In this mode the class would read a qbox output file
                    and store the data;
                OR
                    **(2)** *'w'* = In this mode the class would write a qbox input file.

            **atoms** = A list of atom symbols needed for ``io = 'w'`` mode

            **run_cmd** = A list of qbox run commands

            .. warning::
                Currently, ``io='w'`` is experimental and not recomended to be used. 
                Any keys such as ``atoms``, ``run_cmd``, that is associated with 
                ``io = 'w'`` mode should not be used as well.

            .. note::
                Qbox reorders the atom sequence and print the results with reordered
                atom sequence. This creates problem while post-processing the files to compute
                for example, normal modes. The next two arguments help to interpret and store
                qbox output data by nullyfying the reordering done by qbox and store them 
                according to the atoms sequence user needs.
            
            **reorder** = This key is valid while ``io = 'r'``. Do you want to reorder the atom sequence?
                options are: 
                    (1) *True* (Default): Reorders according to given sequence. 
                OR  
                    (2) *False*: Stores everything according to qbox output sequence.

            **reorder_seq** = A python list of atom symbols specifying the atom sequence. Only valid 
            if ``reorder = True``.

                **More Information on how to use.**
                For example ``reorder_seq = ['C','H','O','N']`` would store all informations on 
                Carbon, Hydrogen, Oxygen and Nitrogen atoms sequentially. 
                For the default value *None*, atoms would be
                ordered according to the input sequence.


      """
      def __init__(self,file_path,io='w', atoms=None, run_cmd = None, reorder=True, reorder_seq=None):
          init_time = time.time()
          self.io = io; self.file_path = file_path
          if self.io == 'r':
             self.cell, self.atoms, self.input_indices = self.__getsystem__(self.file_path);   
             self.natoms = len(self.atoms) ; self.etotals = self.getenergy();  
             try: self.nframes = self.etotals.shape[0]
             except IndexError: self.nframes = self.etotals.size
             self.forces = self.getv('<force>');   self.coords = self.getv('<position>')
             self.reorder_seq = reorder_seq
             if reorder_seq is not None: reorder = True
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
          --------------------
          Write Method
          --------------------
          This method writes the atoms & coordinates in a qbox input file. 
          This method can be used only if qbox class is initiated with ``io = 'w'``.

            .. warning::
                For future use. Currently not recommended.

            **Arguments:**

                cell = cell vectors in atomic_unit. A numpy array of length 9.

                coord = coordinates in atomic_unit. A numpy array of length 3*N*.

            **Returns**
                qbox input file(s) at the path specified by ``file_path`` while 
                intitiating the qbox class.

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
          """ 
          --------------------------
          Get Vector(*getv*) Method
          --------------------------
          This method gets the vectors (forces or xyz positions") from a a qbox output 
          and returns it as a 2D vector where each rows are 3N 
          coordinates of a snapshot/configuration. 
          This function is only valid is the qbox class is initiated with
          ``io = 'r'``.

            **Arguments:**

                **quantity** = ``'<force>'`` OR ``'<position>'``
          """
          if (quantity == '<force>') | (quantity == '<position>'): pass
          else: raise NotImplementedError("quantity must be '<force>' or '<position>'")
          v = grep(file_path = self.file_path, pattern = quantity, cols=(1,2,3))
          v = v.flatten().reshape(self.nframes,3*self.natoms)
          return v

      def getenergy(self):
          """
          -------------------
          Get Energy Method
          -------------------
          This method gets the energies from a a qbox output and returns it as a numpy array.
          """
          etotals = np.array( grep(file_path = self.file_path, pattern = "<etotal>", cols=(1)) )
          try: len(etotals)
          except TypeError: etotals = np.array([etotals])
          return etotals

      def _reorder(self):
          """Reorders the forces and coordinates according to input indices"""
          if self.reorder_seq is None:
             reord_indices = [i+1 for i in range(self.natoms)]
          else:
             reord_indices = [] 
             for atom in self.reorder_seq: 
                 for i, x in enumerate(self.atoms):
                     if x == atom:
                        reord_indices.append(self.input_indices[i]) 

          if self.input_indices == reord_indices: 
             return
          else:
             print("Reording atoms, forces, and coordinates.")
             cart_ind = []
             atoms = self.atoms.copy()
             for i in range(self.natoms):
                 j = reord_indices.index(self.input_indices[i]) 
                 self.atoms[j] = atoms[i]
                 cart_ind.append(j*3); cart_ind.append(j*3+1); cart_ind.append(j*3+2)
                 #self.atoms[self.input_indices[i]-1] = atoms[i]
                 #cart_ind.append((self.input_indices[j]-1)*3)
                 #cart_ind.append((self.input_indices[j]-1)*3+1)
                 #cart_ind.append((self.input_indices[j]-1)*3+2)
             for i in range(self.nframes):
                 self.coords[i,:] = self._reorder_vec(cart_ind, self.coords[i,:])
                 self.forces[i,:] = self._reorder_vec(cart_ind, self.forces[i,:])

      def _reorder_vec(self,cart_ind,vec):
          """reorders a vector according to given cartesian indices"""
          reord_vec = np.copy(vec)
          for i in range(len(vec)):
              #print(i, cart_ind[i])
              reord_vec[cart_ind[i]] = vec[i]
          return reord_vec

      @staticmethod
      def __getsystem__(file_path):
          """
          --------------------------
          Get System Method
          --------------------------
          This method collects atoms, cell-parameters from the qbox output
          and stores them.
          """
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
    ---------------------------------
    Function for Writing Normal Modes
    ---------------------------------
    It takes atoms, cell vectors, their positions (optimized)
    and normal mode (mass scaled) coordinates and normal mode frequencies as arguments
    and writes them into either an
    **(i) animated xsf (.axsf) file** that can be visualized with Xcrysden program
    OR
    **(ii) An normal mode file (.nmd)** that can be visualized with VMD program
    OR
    **(iii) molden file (.molden)** that can be visualized with molden program.

        **Arguments:**

            **atoms** = A list of atom-symbols. An character array with length *N*, where
            *N* is the number of atoms.

            **cell_v** = Cell vectors in atomic_unit. A numpy *float* array with length 9.

            **opt_coord** = Cartesian coordinates of optimized geometry in atomic units.
            A numpy array with length 3*N*.

            **mode_v** = Normal mode vectors. A 3*N* x 3*N* dimensional numpy array.

            **mode_freq** = A numpy array (len = *N*) of mode frequencies (in atomic unit).

            **file_path** = Full directory path + file prefix of the file where normal mode 
            info would be written

            **fmt** = A format of the normal mode file. 
            Options are: **(1)** ``'axsf'``, OR **(2)** ``'nmd'``, OR (3) ``'molden'`` 

        **Returns:**

            An .axsf/.nmd/.molden file with the specified directory path + file prefix.

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
