# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

"""
This module contains methods and classes dealing with atomic coordinates.
"""

import sys, os, re, time
import xml.etree.ElementTree as ET
import numpy as np
from pyepfd.constants import *
from pyepfd.elph_classes import nm_sym_displacements,stoch_displacements, coord_com
from mpi4py import MPI
import pickle
import warnings

comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()


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
    with warnings.catch_warnings():
        warnings.filterwarnings("ignore", message="genfromtxt: Empty input file")
        data_array = np.genfromtxt("tmp",usecols = cols,dtype=np.float64)
    os.system("rm -rf tmp")
    return data_array

def quaternion_fit(ref_coord, coord, mass):
    """
    -----------------------
    Function quaternion_fit
    -----------------------
    This function fits a quaternion that rotates a set of 3N-coordinates into a a set of ref coordinates.
    
        .. seealso ::
           Simon K. Kearsley, Acta Cryst. (1989). A45, 208-210
    
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
            **(1)** *True* (Default): Angular momentum would be removed from **coord** w.r.t **ref_coord**   
            OR       
            **(2)** *False*: Angular momentum would not be removed.

            **forces** (optional) = *None* (Default) OR 
            A 3N-dimensional vector of forces in rotated reference frame.
            If supplied, the forces would be rotated back to ref_coord frame

            **wrt_com** = Do you want to obtain the coordinates with respect to center of mass (c.o.m)?
            Allowed values are:
            **(1)** *True*: Coordinates with respect to c.o.m would be returned   
            OR   
            **(2)** *False* (Default): Coordinates with respect to original refence point 
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

                **append** = If True, then it would append the new configurations if the xyz file exists.
                Valid only for ``io = 'w'`` mode 
 
      """
      def __init__(self, file_path, io='r', atoms=None, xyz_unit='atomic_unit', cell_unit='atomic_unit', \
                   quantity='pos', reorder_seq=None, append=False):
          if rank != 0: return
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
             if append: self.out_xyz = open(file_path,"a")
             else: self.out_xyz = open(file_path,"w+")
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
             if ('x_centeroid{atomic_unit}' in comment) or ('positions{atomic_unit}' in comment) or \
                ('position{atomic_unit}' in comment):
                self.xyz_unit='atomic_unit'
             if ('f_centeroid{atomic_unit}' in comment) or ('forces{atomic_unit}' in comment) or \
                ('force{atomic_unit}' in comment):
                self.xyz_unit='atomic_unit'; self.force=True ; self.pos = False
             if ('p_centeroid{atomic_unit}' in comment) or ('momenta{atomic_unit}' in comment) or \
                ('momentum{atomic_unit}' in comment):
                 self.xyz_unit='atomic_unit'; self.mom=True; self.pos = False
             if ('v_centeroid{atomic_unit}' in comment) or ('velocities{atomic_unit}' in comment) or \
                ('velocity{atomic_unit}' in comment):    
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

      def write(self, cell, coord, append=False):
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
          if rank != 0: return
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

                   .. tip::
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
                          .. seealso :: 
                             Zacharius, M.; Giustino, F. 
                             One-shot calculation of temperature-dependent optical spectra and 
                             phonon-induced band-gap renormalization.
                             *Phys. Rev. B.* **2016**, *94*, 075125
                    OR
                        **(2)** *'OSAP'*: (Default): One-Shot method but with anti-thetic pair.
                    OR
                        **(3)** *'OSR'*: One-shot sampling of random signs as described in the 
                        following reference [1] or thermal line sampling in reference [2] 
                          .. seealso ::
                             [1] Karsai, F.; Engel, M.; Flage-Larsen, E; Kresse, G.
                             Electron-phonon coupling in semiconductors within the GW approximation.
                             *New J. Phys.* **2018**, *20*, 123008.

                             [2] Monserrat, B. Vibrational averages along thermal lines.
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

                **nmode_only** (Optional) = A python-list of normal-mode indices 
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
                If ``algo = OSAP``: only 2 additional displaced coordinates would be created.
                If ``algo = OSR/MC``: ngrid number of additional displaced coordinates would be created.
                If ``algo = OSRAP/MCAP``: 2*ngrid number of additional displaced coordinates 
                would be created.


        .. important ::
           **MPI4Py Parallelization** is available for ``mode = SD`` and ``mode = (E)NMS/(E)NMFD``.  

           (1) When ``mode = SD``, the code is parallelized over ``ngrid``. Therefore the number of 
           employed mpi processes should preferably be a divisor of ``ngrid`` and should not be 
           larger than 1/2 of ``ngrid``. For ``algo=OS/OSAP`` by definition ``ngrid=1``. Therefore,
           mpiprocess should not give any scaling.   
           
           (2) When ``mode = (E)NMS/(E)NMFD``, the code is parallelized over the number of modes 
           to be sampled, defined by either ``nmode_only`` list (see above). If this is not set 
           then all modes are taken into account. Therefor number of employed mpi processes should 
           preferably be a divisor of no. of modes to sample and should not be larger than the 
           half of it. 
           
            
      """
      def __init__(self,atoms,opt_coord,mode,deltax=0.005,deltae=0.001,\
                  dynmat=None,mass=None,ngrid=1,temperature=0,asr='none',algo='osap', nmode_only=None):
          init_time = time.time()
          comm.Barrier()
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
          if rank == 0:
              print("Time spent on ionic_mover class: " + str(exec_time) + " s.")
      
      def _cart_disp(self):
          """ Method to perform cartesian displacement for frequency calculation"""
          idisp = 1
          for icart in range(3*self.natoms):
              for step in self.step_list:
                  self.disp_coord[icart,idisp] += self.deltax*step
                  idisp += 1

      def _nm_disp(self):
          """
	  Method to perform normal-mode displacements for frequency calculation
          
	  ..note:
            This method is parallelized using MPI4Py. The parallelization is over 
            normal mode indices. Therefore the number of mpi processes should not be
            larger than 1/2 of the modes to be sampled to avoid bad load distributions.
            Idally the number of MPI process should be a divisor of the number of normal 
            mode to be sampled.
          """
          comm.Barrier()
          if rank == 0:
             nmfd = nm_sym_displacements( dynmat = self.dynmat, mass = self.mass,\
                                          mode = self.mode, deltax = self.deltax, deltae = self.deltae)
             nmfd_serialized = pickle.dumps(nmfd)
             print(f"ionic_mover._nm_disp() is running with {size} MPI processes.")
          else:
             nmfd_serialized = None
          
          # Broadcast serialized nmfd to all processes
          nmfd_serialized = comm.bcast(nmfd_serialized, root=0)
          # Deserialize nmfd on all processes
          nmfd = pickle.loads(nmfd_serialized)

          if self.nmode_only is None:
             sampled_modes = [i for i in range(len(nmfd.displacements))] 
          else:
             sampled_modes = [i-1 for i in self.nmode_only]

          # Distribute sampled modes among processes
          modes_per_process = len(sampled_modes) // size
          remainder = len(sampled_modes) % size
          start_index = rank * modes_per_process
          end_index = start_index + modes_per_process
          if rank == size - 1:
             end_index += remainder

          disp_per_process = (end_index-start_index)*len(self.step_list)
          disp_coord_partial = np.zeros((len(self.disp_coord),disp_per_process),np.float64)
          
          nmlog = open('nmlog'+str(rank)+'.tmp','w+')

          #counters for tracking mode & displacement indices per process 
          jmode = 0; idisp =0         
          for imode in sampled_modes[start_index:end_index]:
              freq_scaling = np.sqrt(nmfd.omega[imode])
              nmlog.write(
              "#Process-id = %4d Mode = %6d Disp-step(au) = %10.4f Disp-step(Freq-scaled) = %10.4f\n"\
                  %(rank, imode+1, nmfd.displacements[imode],\
                    nmfd.displacements[imode]*freq_scaling))
              nmlog.write("#Config    Disp(au)   Disp(Freq-scaled)\n")

              for step in self.step_list:
                  nm_disp = np.zeros(3*self.natoms,np.float64)
                  nm_disp[imode] = nmfd.displacements[imode]*step
                  disp_coord_partial[:,idisp] = nmfd.nm2cart_disp(nm_disp)
                  idisp += 1
                  nmlog.write(" %d  %12.4f  %12.4f\n"\
                       %(rank*modes_per_process*len(self.step_list) + idisp+1, 
                         nm_disp[imode], nm_disp[imode]*freq_scaling))                  
                  #if rank == 1: print(f"Rank: {rank} j-mode: {jmode} idisp: {idisp}")  # debugging
              jmode += 1

          # Gather and broadcast results
          disp_coord_gathered = comm.gather(disp_coord_partial)
          nmlog.close()
          comm.Barrier()

          if rank == 0:
             disp_coord_gathered = np.column_stack(disp_coord_gathered)
             #print(disp_coord_gathered.shape)
             self.disp_coord[:,1:] += disp_coord_gathered
             #removing .tmp files
             for i in range(size):
                 nmlog = open('nmlog'+str(i)+'.tmp','r').read()
                 print(nmlog)
                 os.remove('nmlog'+str(i)+'.tmp')
          self.disp_coord = comm.bcast(self.disp_coord, root=0)       


      def _stoch_disp(self,algo,ngrid):
          """
          Method to perform stochastic displacements for ZPR/anharmonicity measure etc
          Args: algo = algorithm. Options: (i) 'os'(one-shot) (ii)'osap' (one-shot with antethetic pair)
                                          (iii)'osr' (one-shot with random signs);
                                          (iv) 'osrap' (one-shot with random signs and antethetic pairs for each point);
                                           (v) 'mc' (monte-carlo)
                ngrid = no of samples to be drawn fo 'osr', 'osrap' (2 * ngrid) and 'mc' method explained before.  
          
          ..note:
            This method is parallelized using MPI4Py.

          """
          #print(f"Rank {rank} before barrier")
          comm.Barrier()
          if rank == 0:
             time_now = time.time
             print(f"ionic_mover._stoch_disp({algo},{ngrid}) is running with {size} MPI processes.")

          ngrid_per_process = ngrid // size
          remainder = ngrid % size
          if rank == size - 1:
             ngrid_per_process += remainder
          
          nmmc = stoch_displacements( dynmat = self.dynmat, mass = self.mass,\
                                      asr = self.asr, temperature = self.temperature,\
                                      ngrid = ngrid_per_process, algo = algo, 
                                      nmode_only = self.nmode_only)
          total_iterations = len(nmmc.nmdisp)

          # Initialize the shared array to hold partial results
          disp_coord_partial = np.zeros((len(self.disp_coord), total_iterations), np.float64)
          
          # Compute partial results
          for idisp in range(total_iterations):
              disp_coord_partial[:, idisp] = nmmc.nm2cart_disp(nmmc.nmdisp[idisp])
              if (rank == 0) & (total_iterations >= 10): 
                 if (idisp + 1) % (total_iterations // 10) == 0:
                    progress_percentage = ((idisp + 1) / total_iterations) * 100
                    print(f"Process-id = 0: {progress_percentage:.0f}% of SD iterations completed.")
          comm.Barrier() 

          # Gather partial results from all processes
          disp_coord_gathered = comm.gather(disp_coord_partial, root=0)
 
          if rank == 0:
             disp_coord_gathered = np.column_stack(disp_coord_gathered)
             self.disp_coord += disp_coord_gathered
          
          # Broadcasting final result to all processes
          self.disp_coord = comm.bcast(self.disp_coord, root=0)   

          if algo == 'os':
             self.disp_coord = self.disp_coord[:,:-1]

      #def finalize(self):
      #    MPI.Finalize()

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

            .. caution ::
                Qbox reorders the atom sequence and print the results with reordered
                atom sequence. This creates problem while post-processing the files,
                for example, obtaining normal modes. 
                The next two arguments help to interpret and store
                qbox output data by nullyfying the reordering done by qbox and store them 
                according to the atoms sequence user needs.
            
            **reorder** = This key is valid while ``io = 'r'``. Do you want to reorder the atom sequence?
                options are: 
                    (1) *True* (Default): Reorders according to given sequence. 
                OR  
                    (2) *False*: Stores everything according to qbox output sequence.

            **reorder_seq** = A python list of atom symbols specifying the atom sequence. Only valid 
            if ``reorder = True``.

               .. tip ::
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
             self.forces = self.getv('<force>')   
             self.coords = self.getv('<position>')
             self.dipole_ion = self.getv('<dipole_ion>')
             self.dipole_el = self.getv('<dipole_el>')
             self.dipole_total = self.getv('<dipole_total>')
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

            **Arguments:**

                cell = cell vectors in atomic_unit. A numpy array of length 9.

                coord = coordinates in atomic_unit. A numpy array of length 3*N*.

            **Returns**
                qbox input file(s) at the path specified by ``file_path`` while 
                intitiating the qbox class.

          """
          if len(cell) == 6: cell = abc2h(cell)
          elif len(cell) == 9: pass
          else: raise ValueError("qbox.write: Incorrect cell dimension. Allowed dimensions: 6 or 9") 

          h = np.reshape(cell,(3,3))
          #print("qbox class speaking: begin qbox input writing.")
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
          #print("qbox class speaking: input writing finished.")

      def getv(self, quantity):
          """ 
          --------------------------
          Get Vector(*getv*) Method
          --------------------------
          This method gets the vectors (forces , xyz positions, or dipole") from a a qbox output 
          and returns it as a 2D vector where each rows are 3N (forces, xyz)
          coordinates or 3 dipole moments of a snapshot/configuration. 
          This function is only valid is the qbox class is initiated with
          ``io = 'r'``.

            **Arguments:**

                **quantity** = ``'<force>'`` OR ``'<position>'`` OR ``'<dipole_ion>'`` OR ``'<dipole_el>'`` 
                OR ``'<dipole_total>'``
          """
          if (quantity == '<force>') | (quantity == '<position>'):
              v = grep(file_path = self.file_path, pattern = quantity, cols=(1,2,3))
              v = v.flatten().reshape(self.nframes,3*self.natoms)
          elif (quantity == '<dipole_ion>') | (quantity == '<dipole_el>') | (quantity == '<dipole_total>'):
              v = grep(file_path = self.file_path, pattern = quantity, cols=(1,2,3))
              if len(v) == 0:
                 v = None 
          else:
              raise NotImplementedError("quantity must be '<force>', '<position>', '<dipole_ion>',"+
                      "'<dipole_el>' or '<dipole_total>'")
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

def xyz2qe(xyzdata_path,pw_opt_path,frames,pw_path):
    """
    This function converts an xyz trajectory files into an 
    Quantum Espresso (QE) input deck. 

    **Arguments:**
        
        **xyzdata_path** = Full path to the xyzdata file

        **pw_opt_path** = Full path to the file containing all pw options 

        **frames** = A tuple or an integer of frame indices. 
        If tuple then indices of (start, end) or (start, end, inc)
        where inc is the increment

        **pw_path** = Path to the directory where pw_inputs would be written 
        and saved

    **Returns:**

        At the given **pw_path**, it creates several files: 
        pw1.in, pw2.in,..., pw<n>.in for each frames in the trajectory


    .. warning ::

       This function will be removed in the later releases.
       Therefore, for converting xyz files to QE input decks,
       it is recommended to use the QE class (see below) as shown in
       Tutorial 2.1.
    """
    xyzdata = xyz(file_path=xyzdata_path, io='r')
    pw_opts = open(pw_opt_path,'r').readlines()

    try:
        ntuple = len(frames)
        if  ntuple == 3:
            start,end,inc = frames
        elif ntuple == 2:
            start,end = frames; inc = 1
        elif ntuple == 1:
            start = frames; end = frames; inc = 1
        else:
            sys.exit("Length of frames tuple is %d."%ntuple+\
                     "Maximum allowed length of frames tuple is 3.")
    except TypeError:
        start = int(frames); end = int(frames); inc = 1

    if start < 1: sys.exit("Start frame index cannot be less than 1")

    for frame in range(start, end+1, inc):
        qe_input = open(pw_path+'/pw'+str(frame)+'.in','w')
        for i in range(len(pw_opts)):
            qe_input.write(pw_opts[i])
        qe_input.write('CELL_PARAMETERS angstrom\n')
        cell = abc2h(xyzdata.cell[frame-1]) * bohr2unit['angstrom']
        for i in range(3):
            qe_input.write("%15.8f %15.8f %15.8f\n"\
                    %(cell[0,i],cell[1,i],cell[2,i]))
        qe_input.write('ATOMIC_POSITIONS angstrom\n')
        coord = np.reshape(xyzdata.coords[frame-1],(xyzdata.natoms,3)) *\
                bohr2unit['angstrom']
        for atom in range(xyzdata.natoms):
            qe_input.write("%s   %15.8f   %15.8f   %15.8f\n"\
            %(xyzdata.atoms[atom], coord[atom,0],coord[atom,1],coord[atom,2]))
class qe:
      """
      ===========================
      Class QE(Quantum Espresso)
      ===========================
      This class has methods to convert xyz files to quantum espresso inputs
      and parse quantum espresso outputs

      **Arguments:**

          **io** = input/output status. 
                Options are:
                    **(1)** *'r'*: In this mode the class would read series of quantum espresso
                    output files (from single-point calculations) and store the data;
                OR
                    **(2)** *'w'* = In this mode the class would write a series of 
                    quantum espresso input files each performing single-point calculations

          **path** = (1) For ``io = 'w'`` mode, this is the path to the xyz file containing displaced 
                     configurations (FD/ENMFD/SD etc)
                OR
                     (2) For ``io = 'r'`` mode, this should be the root directory path where qe single-
                     point calculations will be performed.

          **frames** = A tuple or an integer of frame indices. 
                 If tuple then indices of (start, end) or (start, end, inc)
                 where inc is the increment. Same for both ``io = 'w'/'r'``.

          **pw_opt_path** = Full path to the file containing all pw input options
                            needed for ``io='w'`` mode.

          **pw_path** = Path to the directory, required for ``io = 'w'`` mode.
                        Here pw input files would be written and saved.

          **frame_prefix** = Active for ``io = 'r'`` mode.
                             A string defining the prefix of the directories where QE single
                             point calculations are performed. The default value is ``'frame'``,
                             meaning within the root directory defined by ``path`` variable,
                             there would be directories frame-1, frame-2,..., frame-n, where
                             actual QE calculation and their outputs exist. 


          **bands** = An integrer or a tuple of integers specifying the frame
                      indices. If tuple then indices of (start, end) or (start, end, inc)
                      where inc is the increment. It is an optional argument for ``io='r'``
                      mode. If used, the band energies will be extracted and written to a 
                      .dat file. For example, the name of the .dat file will be 
                       is_0_orb-2-5.dat, if 
                      ``spin = 0`` (see below), and ``bands = (2,5,1)`` are chosen.

          **spin** = An integer specifying the spin. It is an optional argument for 
                     ``io='r'`` mode to decide band energies for which spin would be 
                     written to the .dat file.
                     Options are: 0 = Spin-up (default), 1 = Spin-down (spin-polarized only),
                     2 = Both spins (spin-polarized only).

          **pw_prefix** = A string that is used as quantum espresso prefix in a calculation.
                          This would create a file with name pw_prefix.xml, which will pe 
                          parsed by the class. The default value is ``'pwscf'``. This 
                          argument is active only for ``io='r'`` mode.


      """
      def __init__(self, path, frames, io='r', pw_opt_path = None, pw_path = 'PWINPs', 
                   frame_prefix='frame', pw_prefix='pwscf',bands=None, spin=0):
          if rank != 0: return
          init_time = time.time()
          self.io = io;   self.path = path;   self.spin = spin; self.bands = bands
          self.frame_prefix = frame_prefix;    self.pw_prefix=pw_prefix
          self.pw_opt_path = pw_opt_path;     self.pw_path = pw_path
          try:
              frame_ntuple = len(frames)
              if  frame_ntuple == 3:
                  self.frame_start, self.frame_end, self.frame_inc = frames
              elif frame_ntuple == 2:
                  self.frame_start, self.frame_end = frames; self.frame_inc = 1
              elif frame_ntuple == 1:
                  self.frame_start = frames; self.frame_end = frames; self.frame_inc = 1
              else:
                  sys.exit(f"Length of frames tuple is {frame_ntuple}. "+\
                           "Maximum allowed length of frames tuple is 3.")
          except TypeError:
              self.frame_start = int(frames); self.frame_end = int(frames); self.frame_inc = 1
          
          self.nframes = (self.frame_end - self.frame_start)//self.frame_inc + 1

          if bands is not None:
             try:
                 band_ntuple = len(bands)
                 if  band_ntuple == 3:
                     self.band_start, self.band_end, self.band_inc = bands
                 elif band_ntuple == 2:
                     self.band_start, self.band_end = bands; self.band_inc = 1
                 elif band_ntuple == 1:
                     self.band_start = bands; self.band_end = bands; self.band_inc = 1
                 else:
                     sys.exit(f"Length of bands tuple is {band_ntuple}. "+\
                              "Maximum allowed length of bands tuple is 3.")
             except TypeError:
                 self.band_start = int(bands); self.band_end = int(bands); self.band_inc = 1
             if self.band_start < 1: sys.exit(f"Band index cannot be less than 1")   
       

          if self.io == 'w':
             if pw_opt_path is None: 
                 raise ValueError("pw_opt_path is required containing a file with all PW "+\
                          "options except the cell parameter and atomic coordinates.")
             xyz2qe(self.path, self.pw_opt_path, frames, self.pw_path)
          elif self.io == 'r':
               self._parse_xml()                
          else:
             raise NotImplementedError("qe class: io status must be r or w.")    
        
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on qe class: " + str(exec_time) + " s.")


      def _parse_xml(self):
          for self.iframe in range(self.frame_start, self.frame_end+1, self.frame_inc):
              xml_file_path = f"{self.path}/{self.frame_prefix}-{self.iframe}" +\
                              f"/{self.pw_prefix}.xml"
              self.tree = ET.parse(xml_file_path)
              self.root = self.tree.getroot()
              if self.iframe == self.frame_start:
                 self.__getsystem__()
                 self.forces = self._getv('force')
                 self.coords =  self._getv('position')
                 self.etotals = float(self.root.findall("output/total_energy/etot")[-1].text)
              else:
                 self.forces = np.vstack((self.forces, self._getv('force')))
                 self.coords = np.vstack((self.coords, self._getv('position')))
                 self.etotals = np.append(self.etotals,\
                                float(self.root.findall("output/total_energy/etot")[-1].text)) 
              if self.bands is not None:
                 self._write_eigval()       

      def _getv(self,quantity):
          """
          Get coordinate or forces vector
          Args: 
              
              **quantity** = A string. Options are
                             (1) force ( or <force>) and
                             (2) position(or <position>) 

          Returns a numpuy array of length 3*natoms    
          """
          if   (quantity == 'position') | (quantity == '<position>'):
               v_string = []
               for atom in self.tree.findall('./output/atomic_structure/atomic_positions/atom'):
                   for pos_string in atom.text.split():
                       v_string.append(pos_string)
          elif (quantity == 'force') | (quantity == '<force>'):
               try: 
                  v_string = self.root.find("output/forces").text.replace("\n", " ").split() 
               except AttributeError:
                  v_string = []
                  print("Forces are not found in the qe output(s).")
          else:
               raise ValueError("Supplied value of quantity should be either force or position")
          v = np.array(v_string,np.float64)
          return v

      def _write_eigval(self):
          if self.spin == 0:   spin_range = (0,1)
          elif self.spin == 1: spin_range = (1,2)
          elif self.spin == 2: spin_range = (0,2)
          else: raise ValueError("The allowed values of spin are 0 (up), 1(down) and 2(both).")

          if self.iframe == self.frame_start:
             self.eigvalfile = [] 
             for isp in range(spin_range[0],spin_range[1]):
                 self.eigvalfile.append(
                 open(f"is_{isp}_orb-{self.band_start}-{self.band_end}.dat", 'w+'))
          ### printing header
                 for ibnd in range(self.band_start, self.band_end+1, self.band_inc):
                     self.eigvalfile[isp].write("#Orbital-"+str(ibnd)+"  ")
                 self.eigvalfile[isp].write("\n ")

          ### collecting and printing eigenvalues
          eigvals = self._get_eigval()
          for isp in range(spin_range[0],spin_range[1]):
              for ibnd in range(eigvals.shape[0]):
                  self.eigvalfile[isp].write("%14.8f  "%eigvals[ibnd,isp])
              self.eigvalfile[isp].write("\n ")
     
      def _get_eigval(self):
          """
          This method extracts Kohn-Sham eigenvalues from a quantum espresso
          calculation. It parse the XML output file within the directory


          Returns:

             A numpy array of order (n,m), with n rows containing the eigenvalues 
             of orbitals. The value of m=1 for spin = 0,1, but for for spin = 2, 
             value of m = 2 with first colum containing eigenvalues with up spin and
             lowest column with down spin.
          """

          all_eigenvalues = [float(value) for value in \
                  self.root.find(".//eigenvalues").text.split()]

          nband = int(self.root.find(".//bands/nbnd").text)

          spin_polarized = bool(self.root.find(".//spin/lsda").text)
          if not spin_polarized:
              if self.spin > 0:
                  print("This is not a spin polarized calculations. Setting Spin = 0")

          eigenvalues = []
          if self.spin < 2:
              for band in range(self.spin*nband+self.band_start, \
                      self.spin*nband+self.band_end+1, self.band_inc):
                  eigenvalues.append(all_eigenvalues[band-1])
          else:
              for ispin in range(2):
                  for band in range(ispin*nband+self.band_start, ispin*nband+self.band_end+1, self.band_inc):
                      eigenvalues.append(all_eigenvalues[band-1])
          eigenvalues = np.array(eigenvalues)
          eigenvalues *= ha2unit['eV']

          eigval_len = len(eigenvalues)
          if self.spin == 2:
             eigenvalues = np.reshape(eigenvalues, (eigval_len//2,2), order = 'F')
          else:
             eigenvalues = np.reshape(eigenvalues, (eigval_len,1))
          return eigenvalues

      def __getsystem__(self):
          atomic_structure = self.root.find("input/atomic_structure")
          self.natoms = int(atomic_structure.attrib["nat"]) 
          self.atoms = []
          for atom in atomic_structure.findall('./atomic_positions/atom'):
              self.atoms.append(atom.attrib['name'])
          cell_v = np.zeros((3,3),np.float64)
          cell_addresses = ['./cell/a1', './cell/a2', './cell/a3']
          for i in range(3):
              cell_v[i] = np.array( [float(x) for x in \
                          atomic_structure.find(cell_addresses[i]).text.split()] )
          self.cell = h2abc( np.transpose(cell_v) ) # Transpose to make it upper triangular form
          self.mass = np.array([[masses[element]*amu,masses[element]*amu,masses[element]*amu]\
                      for element in self.atoms]).reshape(3*self.natoms)
          

