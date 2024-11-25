# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

__all__=["dm","epce_calculator","phonon_calculator", "reorder_dynmat"]

""" This file contains all the classes relavant to frozen phonon calculation """
import sys
import numpy as np
from pyepfd.ipi_file_read import ipi_info
from pyepfd.constants import *


def bose_einstein(omega,omega_unit='Ha',T=0.0):
    """
      This function calculates the Bose Einstein occupation

        **Arguments:**

            **omega** = A *float* number signifying mode-frequencies.

            **omega_unit** = Unit of omega. Options: ``'Ha'`` (default) OR ``'eV'``.

            **T** = Temperature in K

        **Returns:**

            A *float* number. Bose Einstein occupation for the given mode at *T*.
    """

    if T < 1e-8:
       bose_einstein = 0.00000000e+00
    else:
       if omega_unit == 'Ha':
          x = np.abs(omega)*ha2unit['K']/T
       elif omega_unit == 'eV':
          x = np.abs(omega)*ev2unit['K']/T
       else:
          raise ValueError("omega_unit must be Ha or eV")
       bose_einstein = 1.00000e+00/(np.exp(x)-1.0000000e+0)
    return bose_einstein

def coord_com(coord, mass, flatten=True):
    """
    This function retruns coordinates with respect to center of mass (com) 
    and com coordinates.

        **Arguments:**

            **coord** = 3N dimensional cartesian coordinates for N atoms

            **mass** = Numpy array of mass matrix. 
                .. note::
                    This function can accept mass matrix with length *N* or 3 *N* 
    
        **Returns:**

            (1) coord_com = coordinates with respect to c.o.m 
        AND
            (2) com = center of mass coordinate
    """

    natoms = len(coord)//3
    if len(mass) == len(coord):
       mass = np.array([mass[3*i] for i in range(natoms)])
    elif len(mass) == natoms:
       pass
    else:
       raise ValueError("Dimensions of mass and coord are not consistent.")
    coord = np.reshape(coord,(natoms,3))
    mass = np.array(mass)
    com = np.dot(coord.T, mass) / mass.sum()
    if flatten: coord_com = np.reshape(coord - com,3*natoms)
    else: coord_com = coord - com
    return coord_com, com

def write_dynmat(dynmat,out_file_name,header='#\n'):
    """
    This function can write the dynamical matrix row-wise.

        **Arguments:**

            **dynmat** = dynamical matrix, a (3 *N* x 3 *N* ) numpy array; where *N*
            is the number of atoms. 

            **out_file_name** = path to the output file

            **header** = A header string
    """

    outfil = open(out_file_name,'w+')
    outfil.write("######  This output is produced by PyEPFD. #####\n")
    outfil.write(header+'\n')
    for i in range(len(dynmat)):
            outfil.write(" ".join(map(str, dynmat[i])) + "\n")
    outfil.close()        


def reorder_dynmat(dynmat,original_ord,new_ord,mass,atoms):
    """
    ---------------------------------------------------------------
    Function to Reorder Dynamical Matrix According to Atom Sequence
    ---------------------------------------------------------------
    This function reorders a given dynamical matrix by changing its atom sequence.
    This is sometimes necessary if the underlyfing first-principles code such as qbox 
    reorders the atom sequences differently in two different calculations: (i) an MD 
    and (ii) a normal mode calculation. Later, if we want to compare the normal-modes 
    with the MD trajectory, the modes would be inconsistent due to atom-ordering. 
    In that case dynamical matrix may be reordered to the atom-sequence we want. 
    For example, in this case we want the dynamical matrix to be consistent with the 
    sequence of the MD simulation.

        **Arguments**:

            **dynmat** = Dynamical matrix; a numpy array of 3 *N* x 3 *N*; where *N*
            is the number of atoms.

            **original_ord** = A python list of tuples defining the 
            first and last atom index in each block

            **new_order** = A python list of tuples defining the first and 
            last atom index (in terms of original indices) in new block  

            **mass** = Mass matrix in original atom order

            **atoms** = List of atom-symbols in original order

        **Returns:**

            **(1)** New dynamical matrix with desired atom ordering.

            **(2)** New mass matrix with desired atom ordering.

            **(3)** New atom-symbol list with desired atom ordering.
    """
    natom_type = len(original_ord)
    if len(new_ord) != natom_type:
       raise ValueError("len(original_ord) != len(new_order)")
    dynmat = np.array(dynmat)
    block_index = []
    for i in range(natom_type):
        block_index.append(original_ord.index(new_ord[i]))

    if mass is not None:
       mass = np.array(mass)
       mass_block = []
       for i in range(natom_type):
           start_ind = (original_ord[i][0]-1)*3
           end_ind = original_ord[i][1]*3
           mass_block.append( mass[start_ind:end_ind] )
       new_mass = mass_block[ block_index[0] ]
       for i in range(1,natom_type):
           new_mass = np.hstack((new_mass,mass_block[block_index[i]]))
    else:
       new_mass = None

    if atoms is not None:
       atoms = np.array(atoms) 
       atoms_block = []
       for i in range(natom_type):
           start_ind = original_ord[i][0]-1
           end_ind = original_ord[i][1]
           atoms_block.append(atoms[start_ind:end_ind])
       new_atoms = atoms_block[ block_index[0] ]
       for i in range(1,natom_type):
           new_atoms = np.hstack((new_atoms,atoms_block[block_index[i]]))
       new_atoms = np.ndarray.tolist(new_atoms)
    else:
       new_atoms = None

    new_dynmat_vertical = []
    for i in range(natom_type):
        dynmat_blocks = []
        for j in range(natom_type):
            start_row_index = (original_ord[i][0]-1)*3
            end_row_index = original_ord[i][1]*3
            start_col_index = (original_ord[j][0]-1)*3
            end_col_index = original_ord[j][1]*3

            dynmat_blocks.append(\
            dynmat[start_row_index:end_row_index, start_col_index:end_col_index] )
                 
        new_dynmat_vertical.append(dynmat_blocks[block_index[0]])
        for j in range(1,natom_type):
            new_dynmat_vertical[i] = np.hstack(( new_dynmat_vertical[i], dynmat_blocks[block_index[j]] ))

   
    new_dynmat = new_dynmat_vertical[ block_index[0] ]
    for i in range(1,natom_type):
        new_dynmat = np.vstack ( (new_dynmat, new_dynmat_vertical[ block_index[i] ] ))

    return new_dynmat,new_mass, new_atoms 


class central_diff:
      """
      ========================
      Class Central Difference
      ========================
      This class calculates the 1st and 2nd order central difference 
      of any quantity (Orbital energies, total energies, forces) when displacements are symmetric.

        **Arguments:**
            **x** = A numpy column vector containing the width of displacement grids.

            **y** = A numpy column vector containing values of a function (can be energy or forces) 
            whose derivatives are to be calculated. this must be clustered in such a way that
            first ngrid contiguous values related to x(0), 
            next ngrid contiguous values related to x(1), and so on and so forth. 

            **order** = Order of central difference. 
            Allowed values: (1) ``1``: Gradients, OR (2) ``2``: Hessian.

            **ngrid** = Symmetric displacement grid for central difference.
            Allowed values: ``1``, ``2``, ``3`` or ``4``.

                .. note::
                    Actual number of points would be double as we do symmetric displacements.

            **decreasing** = If ``True``: the displacements are in decreasing  order , i.e +2h,+h,-h,-2h.
            ``False``: Otherwise.
      """

      def __init__(self,x,y,order=2,ngrid=4,decreasing=True):    
          #print("Central_diff class speaking")
          self.x = x; self.y = y
          self._sizex = len(x); self._sizey = len(y)
          self.order = order; self.ngrid = ngrid
          if self._sizey//self._sizex != 2*ngrid:
             raise ValueError("Size of x,y and ngrid are not consistent.")

          if (ngrid < 0) | (ngrid > 4):
             raise ValueError("Invalid ngrid. Allowed values are 1,2,3 and 4")

          self.cd = np.zeros(self._sizex,np.float64)

          y_data = 0
          for row in range(self._sizex):
              y_data_start = y_data
              y_data +=  2*self.ngrid
              _x = self.x[row]
              _y = self.y[y_data_start:y_data]
              if decreasing: _y = np.flip(_y)
              #print(_x,_y)
              self.cd[row] = self.__cd__(x=_x, y=_y, order=self.order, ngrid=self.ngrid)
          #print(self.cd)

      @staticmethod
      def __cd__(x,y,order=2,ngrid=1):
          """
            Method to calculate the central difference.

                Arguments: 

                    **x** = Array of displacement values
                
                    **y** = Array of functional values
                    
                    **order** = central diff order. ``1``: 1st derivative
                    ``2`` : 2nd derivative
                 
                    **ngrid** = Stencils/ No of symmetric displacements. 
                    Allowed values: ``1``, ``2``, ``3``, OR ``4``.
          """
          if len(y) != 2*ngrid:
             raise ValueError("Given column of data (y) is not consistent with grid size.")

          _cd=np.zeros(1)

          if order == 1:
             if ngrid == 1:
                _cd = (y[1]-y[0])/(2*x)
             elif ngrid == 2:
                _cd = (y[0]-8*y[1]+8*y[2]-y[3])/(12*x)
             elif ngrid == 3:
                _cd = (-1*y[0]+9*y[1]-45*y[2]+45*y[3]-9*y[4]+y[5])/(60*x)
             elif ngrid == 4:
                _cd = (3*y[0]-32*y[1]+168*y[2]-672*y[3]+672*y[4]-168*y[5]+32*y[6]-3*y[7])/(840*x)
             else: 
                raise NotImplementedError("Allowed grid sizes are 1,2,3 and 4")

          elif order == 2:
             if ngrid == 1:
                _cd = (y[0]+y[1])/(x**2)
             elif ngrid == 2:
                _cd = (-1*y[0]+16*(y[1]+y[2])-y[3])/(12*x**2)
             elif ngrid == 3:
                _cd = (2*y[0]-27*y[1]+270*(y[2]+y[3])-27*y[4]+2*y[5])/(180*x**2)
             elif ngrid == 4:
                _cd = (-9*y[0]+128*y[1]-1008*y[2]+8064*(y[3]+y[4])-1008*y[5]+128*y[6]-9*y[7])/(5040*x**2)
             else:
                raise NotImplementedError("Allowed grid sizes are 1,2,3 and 4")

          else:
             raise NotImplementedError("Only 1st and 2nd order central differences are implemented")
                
          return _cd

class dm:
      """
      =====================================
      Class Dynamical Matrix
      =====================================
      This class stores the essential informations of a dynamical matrix.
      It also diagonalizes the dynamical matrix and stores the
      normal mode vectors as objects. This is class is used as a base class for many 
      classes in PyEPFD. It has methods to transform from normal mode cordinates
      to Cartesian coordinates and *vice versa*.
      
        **Arguments:**

            **dynmat** = dynamical matrix, a numpy array of 3 *N* x 3 *N*; where *N*
            is the number of atoms.

            **mass** = (3 *N* x 3 *N* ) mass matrix
            
        **Objects:**    

            **dynmatrix** = Here the input dynamical matrix object is saved.
            This is mass-weighted Hessian matrix.

            **w2** = 1-D numpy array of Eigenvalues in ascending order

            **V[:,i]** = i-th eigenvector

            **omega** = array of normal mode frequencies (atomic unit).

            **natoms** = Number of atoms

            **massinv** = A 1-D array of inverse mass i.e., (1/sqrt(mass))

            **hessian** = Hessian matrix without mass-weighting

      """

      def __init__(self,dynmat,mass):
          if len(dynmat) != len(mass):
             sys.exit("Dynamical matrix and mass matrix are not consistent.")
          self.dynmatrix = dynmat
          self.w2, self.U = np.linalg.eigh(self.dynmatrix)
          self.V = self.U.copy()
          self.omega = np.sqrt(abs(self.w2))*np.sign(self.w2); self.nmodes = len(dynmat)
          self.natoms = self.nmodes//3
          self.mass = np.array([mass[3*i] for i in range(len(mass)//3)])
          self.massinv = np.array([1/np.sqrt(mass[i]) for i in range(len(mass))])
          #print(self.massinv)
          for i in range(len(self.V)):
            self.V[:, i] *= self.massinv
          #print(self.V)
          self.asr = None
    
      def calc_hessian(self):
          """
          ------------------------
          Calculate Hessian Method
          ------------------------
          This method calculates Hessian matrix without mass weighting and
          stores them into an object name **hessian**. 

            .. note::
                While dynamical matrix object **dynmatrix** is Mass-weighted Hessian, 
                here **hessian** object is not mass weighted.
          """

          self.hessian = np.copy(self.dynmatrix)
          for imode in range(self.nmodes):
              self.hessian[imode] = self.dynmatrix[imode] / (self.massinv[imode] * self.massinv)

      def nm2cart_disp(self, nm_disp):
          """
          -------------------------------------------------------------------------
          Method to Transform Normal Mode Displacement into Cartesian Displacements
          -------------------------------------------------------------------------
          This method take a a 3N-dim column vector of normal mode displacements, ``nm_disp``,
          and transforms it into  a 3N-dim column vec containing cartesian displacements, *cart_disp*.
          """
          if len(nm_disp) != self.nmodes:
             sys.exit("Dimension of NM displacement is not consistent with dynamical matrix.")
          cart_disp = np.zeros(self.nmodes,np.float64)
          for icart in range(3*self.natoms):
              for imode in range(self.nmodes):
                  cart_disp[icart] += self.V[icart,imode] * nm_disp[imode]
          return cart_disp        

      def nm2cart_matrix(self,Mnm):
          """
          --------------------------------------------------------------
          Method for Normal Mode to Cartesian Transformation of a Matrix
          --------------------------------------------------------------
            Argument:
                **Mnm** =  Any 3 *N* x 3 *N* matrix represented in normal modes 

            Returns:  
                **Mcart** = **Mnm** represented in cartesian
          """

          Mcart = np.dot(self.U, np.dot(Mnm, np.transpose(self.U)))
          return Mcart

      def cart2nm_vec(self,cart_v,normed=False,mass_weight=True):
          """
          --------------------------------------------------------------------
          Method for Transforming a Cartesian Vector into a Normal Mode Vector
          --------------------------------------------------------------------
          This function projects a 3 *N* dimensional cartesian vector (coordinate or force) 
          into normal modes and return the coefficients along the normal modes
          as a numpy array of length 3 *N*.

            **Arguments:**

                **cart_v** = A numpy array of length 3 *N* containing a 3 *N* dimensional 
                Cartesian Vector (coordinates or forces of atoms of a particular configuration).

                **normed** =  Should the normal-mode vector be normalized to 1?
                Allowed values: (1) ``True`` OR (2) ``False`` (Default).

                **mass_weight** = Should the considered normal modes be mass-weighted?
                Allowed values: (1) ``True`` (Default) OR (2) ``False``
          """

          nm_v = np.zeros(len(self.V), np.float64)
          if mass_weight:
             for mode_no in range(len(self.V)):
                 if normed:
                    nm_v[mode_no] = np.dot(cart_v,self.V[:,mode_no])/np.dot(self.V[:,mode_no],self.V[:,mode_no])
                 else:
                    nm_v[mode_no]  = np.dot(cart_v,self.V[:,mode_no]) 
          else:
             for mode_no in range(len(self.V)):
                 if normed:
                    nm_v[mode_no] = np.dot(cart_v,self.U[:,mode_no])/np.dot(self.U[:,mode_no],self.U[:,mode_no])
                 else:
                    nm_v[mode_no]  = np.dot(cart_v,self.U[:,mode_no])
          return nm_v

      def apply_asr(self,opt_coord,asr='none'):
          """
          ----------------------------------------------------------------------
          Method For Applying Acoustic Sum Rule (ASR) 
          ----------------------------------------------------------------------
          This method can be used to apply acoustic sum rule to a dynamical matrix to project out the
          global rotation and/or translation from the dynamical matrix. After applying this method, 
          two several new objects would be created within the ``dm`` class containing the refined 
          dynamical matrix, eigenvectors, frequencies.

            **Arguments:**

                **opt_coord** = 3N-dimensional vector of cartesian coordinates of a optimized geometry/structure

                **asr** = acoustic sum rule; Options are:
                **(1)** ``'none'`` (Default): asr is **not** applied,
                OR
                **(2)** ``'crystal'`` : For infinite systems / crystals,
                OR
                **(3)** ``'poly'`` : For poly-atomic non-linear molecules,
                **OR**
                **(4)** ``'lin'``: For any linear molecules

            **Returns:**

            New objects within ``dm`` class.

                **refdynmat** = Refined dynamical matrix after applying ASR    

                **refw2** =  Refined eigen values in increasing order.
                
                **refV** = Refined eigen vectors. A (3 *N* x 3 *N* ) numpy array.

                **refomega** = Refined mode-frequencies. A numpy array of length 3 *N*.

          """
          #print(self.mass)
          if (asr == 'none') | (asr == 'poly') | (asr == 'lin') | (asr == 'crystal'): 
             self.asr = asr
          else:
             raise ValueError("The allowed values for asr are 'none', 'poly', 'lin', 'crystal'") 

          if len(opt_coord) != self.nmodes:
             raise ValueError("Dimension of opt_coord is not consistent with dynmatrix") 
          #center of mass coordinates (com) and coordinates wrt com
          self.opt_coord_com, self.opt_com = coord_com(opt_coord,self.mass,flatten=False)  

          if asr == 'none':
             self.refdynmatrix = self.dynmatrix.copy(); self.refU = self.U.copy(); self.refw2 = self.w2.copy();
             self.refV = self.V.copy(); self.refomega = self.omega.copy()
             return

          #coord = np.array(opt_coord).reshape(self.natoms,3)
          #self.opt_com = np.dot(np.transpose(coord), self.mass) / self.mass.sum()   #center of mass coordinates (com)
          #coord_com = coord - self.opt_com    # coordinate with respect to com of optimized geometry
          #self.opt_coord_com, self.opt_com = coord_com(opt_coord,self.mass)

          moi = np.zeros((3, 3), np.float64)     #moment of inertia
          for i in range(self.natoms):
              moi -= np.dot(np.cross(self.opt_coord_com[i], np.identity(3)), \
                      np.cross(self.opt_coord_com[i], np.identity(3))) * self.mass[i]

          U = (np.linalg.eig(moi))[1]       ## eigenvectors of moi
          R = np.dot(self.opt_coord_com, U)
          D = np.zeros((3, 3 * self.natoms), np.float64)
          #print("U:"); print(U); print("R:"); print(R)

          ### Vectors along translations
          D[0] = np.tile([1, 0, 0], self.natoms) / self.massinv
          D[1] = np.tile([0, 1, 0], self.natoms) / self.massinv
          D[2] = np.tile([0, 0, 1], self.natoms) / self.massinv

          ### Vectors along rotations
          if asr != 'crystal':
             DR = np.zeros((3, 3 * self.natoms), np.float64)
             for iatom in range(self.natoms):
                 for icart in range(3):
                     i = 3*iatom + icart
                     DR[0, i] = (R[iatom, 1] * U[icart, 2] - R[iatom, 2] * U[icart, 1]) / self.massinv[i]
                     DR[1, i] = (R[iatom, 2] * U[icart, 0] - R[iatom, 0] * U[icart, 2]) / self.massinv[i]
                     DR[2, i] = (R[iatom, 0] * U[icart, 1] - R[iatom, 1] * U[icart, 0]) / self.massinv[i]
             if asr == 'lin':
                DRnorm = np.zeros(3, np.float64) 
                for i in range(3):  DRnorm[i] = np.linalg.norm(DR[i])
                DR = np.delete(DR,np.argmin(DRnorm),axis=0)

             D = np.vstack ((D,DR))
    
          for i in range(len(D)): D[i] = D[i] / np.linalg.norm(D[i])  ### normalizing the vectors

          #transformation matrix to project out translation and rotation
          TM = np.eye(3 * self.natoms) - np.dot(D.T, D)
          #print("TM:"); print(TM)
          self.refdynmatrix = np.dot(TM.T, np.dot(self.dynmatrix, TM))   #refined dynamical matrix
          self.refw2, self.refU = np.linalg.eigh(self.refdynmatrix)
          self.refV = self.refU.copy()
          self.refomega = np.sqrt(abs(self.refw2))*np.sign(self.refw2)
          for i in range(len(self.V)):
            self.refV[:, i] *= self.massinv
          return

      def write_dynmat(self,prefix):
          """Prefix of the output file name"""
          if self.asr is not None:
             header = "# Dynamical matrix (in au) after refinement with asr = " + self.asr + ":"
             write_dynmat(self.refdynmatrix, prefix+'.refdynmat', header) 
          header = "# Dynamical matrix (in au):" 
          write_dynmat(self.dynmatrix, prefix+'.dynmat') 

      def calc_free_en(self,T=0.0,unit='Ha'):
          """
            Returns Helmholtz Free Energy of vibration (A = U - TS) in chosen unit.

            .. note::
                  If T = 0; it returns the zero-point vibrational energy.
                  Electronic energy is not included here. Must be added if needed.
            
            Arg:

                **T** = Temperature in K

                **unit** = Unit of output (Helmholz Free Energy).
          """
          if (unit == 'Ha') | (unit == 'cm-1') | (unit == 'eV') | (unit == 'meV') |\
             (unit == 'kcal/mol') | (unit == 'kJ/mol') | (unit == 'K') | (unit == 'THz'):
             pass
          else:
             raise ValueError("Unit not understood in dm.calc_free_en().")

          if self.asr is None:
             sys.exit("Before applying dm.calc_free_en(), apply dm.apply_asr() once.\n\
 Exiting dm class.") 
          if self.asr == 'crystal': nmstart = 3
          elif self.asr == 'lin':   nmstart = 5
          elif self.asr == 'poly':  nmstart = 6
          else:                nmstart = 0
          A = 0.0 
          for i in range(nmstart,self.nmodes):
              A += 0.5* self.refomega[i]  \
              - T * np.log(1+bose_einstein(omega=self.refomega[i], T=T)) / ha2unit['K']
          A *= ha2unit[unit]
          return A 
 

class stoch_displacements(dm):
      """
      ========================================================
      Class Stochastic Displacements
      ========================================================
      This class calculates the stochastic displacements along normal modes given an algorithm.
        **Arguments:** 
            **dynmat** = Dynamical matrix

            **mass** = mass matrix

            **asr** = Acoustic sum rule; 
            allowed values: ``'none'``, ``'crystal'``, ``'lin'``, ``'poly'``
            
            **temperature** = Temperature for which displacements are chosen. A *float*.

            **algo** = algorithm 
                Options:
                    **(1)** ``'os'`` : one-shot,
                OR
                    **(2)** ``'osap'`` : one-shot with anthetic pair
                OR
                    **(3)** ``'osr'`` : oneshot where displacement signs chosen at random
                OR
                    **(4)** ``'osrap'`` : Same as ``'osr'`` but for each sampled point it's 
                    antethetic pair would be included.
                OR
                    **(5)** ``'mc'`` : Monte Carlo where displacements are chosen at random from a Gaussian
                OR
                    **(6)** ``'mcap'`` : The same as ``'mc'`` but for each sampled point it's 
                    antethetic pair would be included

            **ngrid** = number of integration grid (sample points); 
                .. note::
                    with antethetic pairs ('ap') actual number of
                    single point calculation (sample points) will be 2 x ngrid.

            **nmode_only** = A python list of normal modes over which only 
            the displacements would be performed.         

        **Returns:**

            A new object **nmdisp** would be created containing the displacements in normal 
            modes.
      """

      def __init__(self,dynmat,mass,asr='none',temperature=0,algo='osap',ngrid=1,nmode_only=None):
          super(stoch_displacements,self).__init__(dynmat,mass)
          self.algo = algo.lower(); self.ngrid = ngrid 
          if (self.algo == 'os')|(self.algo == 'osap')|(self.algo == 'osr')|\
             (self.algo == 'osrap')|(self.algo == 'mc')|(self.algo == 'mcap'):
             pass
          else:
             raise NotImplementedError("Allowed values for algo are: 'os', 'osap', 'osr', 'osrap', 'mc' or 'mcap'")
          sigma = np.zeros(self.nmodes,np.float64)
          #print(temperature)
          if nmode_only is None:
             for mode in range(self.nmodes):
                 be = bose_einstein(self.omega[mode],omega_unit='Ha',T=temperature)
                 sigma[mode] = np.sqrt(np.abs((be+0.5)/self.omega[mode]))  ## negative frequencies converted to +ve
          else:
            for mode in nmode_only:
                mode -= 1
                be = bose_einstein(self.omega[mode],omega_unit='Ha',T=temperature)
                sigma[mode] = np.sqrt(np.abs((be+0.5)/self.omega[mode]))

          if asr == 'crystal': self.nmstart = 3
          elif asr == 'lin':   self.nmstart = 5
          elif asr == 'poly':  self.nmstart = 6
          else:                self.nmstart = 0
          for mode in range(self.nmodes):
              if self.V[0,mode] < 0:
                  self.V[:,mode] *= -1

          if 'os' in self.algo:
             signs = self._gen_signs()
             self.nmdisp = np.zeros((len(signs),self.nmodes),np.float64)
             #print(self.nmdisp.shape)
             for mode in range(self.nmstart,self.nmodes):
                 for idisp in range(len(signs)): 
                    self.nmdisp[idisp,mode] += sigma[mode]*signs[idisp,mode]
          else:
             self.nmdisp = np.zeros((self.ngrid,self.nmodes),np.float64)
             for mode in range(self.nmstart,self.nmodes):
                 rng = np.random.default_rng()
                 self.nmdisp[:,mode] += rng.normal(0.0,sigma[mode],self.ngrid)
             if 'ap' in self.algo:
                 ap_nmdisp = -1.0 * self.nmdisp   #Antethetic pairs of sample points
                 interleaved = [elem for pair in zip(self.nmdisp, ap_nmdisp) for elem in pair]
                 self.nmdisp = np.vstack((interleaved))

      def _gen_signs(self):
          """
          This method would generate random signs
          """
          if 'r' in self.algo:
             #print("r ")
             options = np.array([-1,1],np.int64)
             rng = np.random.default_rng()
             signs = rng.choice(options, size=(self.ngrid,self.nmodes))
             if 'ap' in self.algo:
                apsigns = -1 * signs              #Antethetic pairs of sample points
                interleaved = [elem for pair in zip(signs, apsigns) for elem in pair]
                signs = np.vstack(interleaved)
          else:
             #print('no r')
             signs = np.ones((2,self.nmodes),np.int64)
             for mode in range(self.nmstart,self.nmodes):
                 if (mode-self.nmstart)%2 == 0: signs[0,mode] *= +1
                 else: signs[0,mode] *= -1
             signs[1,self.nmstart:self.nmodes] = -1 * signs[0,self.nmstart:self.nmodes]
          #print(signs)   
          return signs
         

class nm_sym_displacements(dm):
      """
      ======================================================
      Class Normal Mode Symmetric Displacements
      ======================================================
      This class computes the values of normal mode displacements
      (consistent with i-PI code). 
      
        **Arguments**:

            **dynmat** = dynamical matrix, a numpy array of 3 *N* x 3 *N*; where *N*
            is the number of atoms. 

            **mass** = mass matrix

            **mode** = Finite displacement mode.
                Options are:
                    **(1)** ``'nmfd'`` : Normal Mode Finite Displacement,
                OR
                    **(2)** ``'enmfd'`` : Energy-scaled Normal Mode Finite Displacement.

                    .. warning:: 
                        Unlike **ionic_mover_class** other modes: NMS/ENMS/SD etc are not allowed.

            **deltax** = A displacement (*float*) in atomic unit (Bohr)

            **deltae**  = Energy scaled displacement (*float*) in atomic_unit (Hartree)

        **Returns:**
            Creates a new object **displacements**, a numply *float* array of length 3 *N* 
            containing displacement grid-width for each normal mode.
      """

      def __init__(self,dynmat,mass,mode,deltax,deltae): 
          self.mode = mode
          if (self.mode == 'enmfd') | (self.mode == 'nmfd'): 
             pass
          else:
             raise NotImplementedError("Allowed modes: nmfd/enmfd")
          self.deltax = deltax; self.deltae = deltae

          super(nm_sym_displacements,self).__init__(dynmat,mass)

          self.displacements = np.zeros(len(self.V),np.float64)

          #print("nm_sym_displacements class speaking")
          #print(dynmat); print(mass); print(mode); print(deltax); print(deltae)

          self.vknorm = np.zeros(len(self.V),np.float64)
          for step in range(len(self.V)):
              #print("#Mode= %5d Freq (cm-1) = %10.2f" %(step+1,self.omega[step]*ha2unit['cm-1']))
              vknorm = np.sqrt(np.dot(self.V[:, step], self.V[:, step]))
              self.vknorm[step] = vknorm
              if self.mode == 'nmfd':
                 self.displacements[step] = self.deltax / vknorm
              elif self.mode == 'enmfd':
                 edelta = vknorm * np.sqrt(self.deltae * 2.0 / abs(self.w2[step]))
                 if edelta > 100 * self.deltax:
                    edelta = 100 * self.deltax
                 self.displacements[step] = edelta / vknorm
          self.displacement2 = self.displacements*np.sqrt(abs(self.w2[step]))
          #print(self.displacements)                       

class phonon_calculator:
      """
      ============================================
      Phonon Calculator Class
      ============================================
      This class accepts forces and displacements and computes dynamical matrix as Jacobian of force.

        **Arguments:**

            **ngrid** = Number of displacement grid points for central difference,
            allowed values: ``1``, ``2``, ``3`` or ``4``.

                ..note::
                    Actual number of points would be double as we do symmetric displacements.

            **forces** = A (2 x ``ngrid``, 3 x *N*) numpy array. Each row represents 3N-force components 
            for a specific displaced struc.

            **mass** = mass matrix

            **mode** = Options: (1) ``'fd'``, (2) ``'nmfd'`` OR (3) ``'enmfd```.

            **deltax** = A displacement (*float*) in atomic unit (Bohr)

            **deltae**  = Energy scaled displacement (*float*) in atomic_unit (Hartree)

                .. note::
                    Use same value for the ``mode``, ``deltax`` and ``deltae``
                    that was used for creating the displacements using **ionic_mover_class**.

            **dynmat** = 3N x 3N dynamical matrix. Must be supplied for all modes except
            ``mode=FD``.

        **Returns:**

            It creates two new objects:
                
                (1) **dynmat** = Dynamical Matrix
            AND
                (2) **hessian** = Hessian Matrix           
      """

      def __init__(self,forces,mass,ngrid=1, mode = 'fd', deltax = 0.005, dynmat = None, deltae =0.001):
          #print("phonon_calculator class speaking:")
          self.nconfg = forces.shape[0]; self.nmode = forces.shape[1]   ## no of config and no of modes (degrees of freedom)
          self.forces = forces ; self.ngrid = ngrid 
          mode = mode.lower()
          if self.nconfg != 2*self.ngrid*self.nmode + 1: 
             #print(self.nconfg) 
             raise ValueError("phonon_calculator: No of configurations in forces matrix does not match with ngrid/nmode")

          self.dynmat = np.zeros((self.nmode, self.nmode),np.float64)
          self.hessian = np.zeros((self.nmode, self.nmode),np.float64)
        
          #print(self.forces)
      
          if mode == 'fd':
             self.cartdisp = True     ### True if the displacements made are along cartesian  
             self.massinv = np.array([1/np.sqrt(mass[i]) for i in range(len(mass))])
             self.displacements = np.ones(self.nmode)*deltax
          elif (mode == 'nmfd') | (mode == 'enmfd'):
             if dynmat is None: 
                raise ValueError("phonon_calculator: dynmat must be supplied for nmfd/enmfd")
             if (dynmat.shape[0] != self.nmode) | (dynmat.shape[1] != self.nmode):
                raise ValueError("phonon_calculator: dimension of dynmat is not consistent with forces") 
             self.cartdisp = False 
             self.nmdisp = nm_sym_displacements(dynmat = dynmat, mass = mass, mode = mode, deltax = deltax, deltae = deltae )
             self.massinv = self.nmdisp.massinv
             self.displacements = self.nmdisp.displacements
          else: 
             raise NotImplementedError("Allowed modes: nmfd/enmfd")   

          #print("phonon_calculator class speaking:")
          #print(self.displacements)
          
          self._calc_phonon()

      def _calc_phonon(self):
          """
          This method calculates phonon
          """
          #print("phonon_calculator.calc_phonon speaking:")
          for imode in range(self.nmode):
              istart = 2*self.ngrid * imode + 1; iend =  2*self.ngrid*(imode+1)+1
              tmp_forces = -self.forces[istart:iend].transpose().flatten()

              if self.cartdisp: 
                 displacements = self.displacements 
                 self.hessian[imode] = central_diff(displacements, tmp_forces, order = 1, ngrid = self.ngrid).cd
                 self.dynmat[imode] = self.hessian[imode] * self.massinv[imode] * self.massinv
              else:
                 displacements =  self.displacements[imode] * np.ones(self.nmode)
                 dm_row = central_diff(displacements, tmp_forces, order = 1, ngrid = self.ngrid).cd 
                 #print("refdm_row:"); print(refdm_row)
                 self.dynmat[imode] = np.dot(self.nmdisp.V.T,dm_row) 
         
          if not self.cartdisp: 
             self.dynmat = self.nmdisp.nm2cart_matrix(self.dynmat)
             for imode in range(self.nmode): 
                 self.hessian[imode] = self.dynmat[imode] / (self.massinv[imode] * self.massinv)

          self._symmetrize()       

      def _symmetrize(self):
          """
          This method symmetrizes the dynamical matrix
          """
          #print("phonon_calculator.symmetrize() speaking:")
          dm = self.dynmat.copy()
          self.dynmat = 0.50 * ( dm + dm.T)
          h = self.hessian.copy()
          self.hessian = 0.50 * ( h + h.T)

class epce_calculator:
      """
      ==================================================
      Electron Phonon Coupling Energy Calculator Class
      ==================================================
      This class calculates the all important electron phonon related properties, e.g.,
      elceton phonon coupling energies (epce) for each phonon mode,
      total zero point renormalization (zpr) of an orbital eigenvalue, 
      or thermal average of eigen values.

        .. warning::
            Currently, stencils are not implemented for this class. 
            To compute EPCEs and ZPR, one must choose ``ngrid=1`` during 
            finite displacements using **ionic_mover_class** and phonon calculations
            using **phonon_claculator** class.

        Arguments:

            **dynmat** = A numpy *float* array (3 *N* x 3 *N* ) of dynamical matrix, 
            where *N* is the number of atoms

            **mass** = A numpy *float* array of mass in atomic unit (length = 3 *N* )

            **energy** = An *float* array of length (6 *N* + 1) of Born-Oppenheimer energies. The first array element
            (energy[0]) should be the energy of the equilibrium geometry. Later array elements correspond 
            to the 2 displaced structures along each normal modes, starting from the 1st mode.

            **eigval** = A (6 *N* + 1 x *n*) numpy *float* array where *n* denotes the number of orbitals. 

            **logfile** = logfile path; a *string*.
            
            **asr** = acoustaic sum rule. A *string*. 
                Options are:
                        **(1)** *'none'* (Default): asr is **not** applied,
                    OR
                        **(2)** *'crystal'*: For infinite systems / crystals,
                    OR
                        **(3)** *'poly'*: For poly-atomic non-linear molecules,
                    OR
                        **(4)** *'lin'*: For any linear molecules

            **mode** = Finite displacement mode used for displacements. 
            Options: ``'nmfd'`` or ``'enmfd'``

            **deltax** = Displacement (in Bohr) used while displacing the ions. A *float* number.

            **deltae** = Energy scaled displacement (*float*) in atomic_unit (Hartree) 
            used while displacing the ions.

            **vib_freq_unit** = Output unit for vibrational frequencies.
            Options are: 
            **(1)** ``'Ha'`` , **(2)** ``'cm-1'``, **(3)** ``'eV'``, **(4)** ``'meV'``,
            **(5)** ``'kcal/mol'``, **(6)** ``'kJ/mol'``, **(7)** ``'K'``, **(8)** ``'THz'``.
            Default: ``'cm-1'``

            **epce_unit** = Output unit for  EPCE. Options are same as **vib_freq_unit**
            Default: ``'meV'``

        **Returns:**

            Creates the following objects within the class:

                **vib_freq** = A numpy *float* array of length 3 *N* containing vibrational 
                frequencies computed from Normal Mode Hessian.

                **epce** = A (3 *N* -m , n ) numpy *float* array containing EPCEs of *n* orbitals
                m = 0/3/5/6 depending on ``asr = 'none'``, ``asr = 'crystal'``, ``asr = 'lin'`` and 
                ``asr = 'poly'``, respectively.
                
                **zpr** = A numpy *float* array of length *n* containing zero-point renormalizations
                of *n* orbitals.

      """

      def __init__(self, dynmat, mass,energy, eigval, logfile,\
                         asr= None, mode='enmfd', deltax=0.001, deltae=0.001, \
                         vib_freq_unit='cm-1',epce_unit='meV'):          

          if (vib_freq_unit == 'Ha') | (vib_freq_unit == 'cm-1') | (vib_freq_unit == 'eV') | (vib_freq_unit == 'meV') |\
             (vib_freq_unit == 'kcal/mol') | (vib_freq_unit == 'kJ/mol') | (vib_freq_unit == 'K') | (vib_freq_unit == 'THz'):
             pass
          else:
             raise ValueError("vib_freq_unit is not understood")
          self.vib_freq_unit = vib_freq_unit

          if (epce_unit == 'Ha') | (epce_unit == 'cm-1') | (epce_unit == 'eV') | (epce_unit == 'meV') |\
             (epce_unit == 'kcal/mol') | (epce_unit == 'kJ/mol') | (epce_unit == 'K') | (epce_unit == 'THz'):
             pass
          else:
             raise ValueError("vib_freq_unit is not understood") 

          self.logfile = logfile; self.epce_unit = epce_unit
       
          nm_disp_object = nm_sym_displacements(dynmat=dynmat,mass=mass,mode=mode,deltax=deltax,deltae=deltae)
          self.nm_disp = nm_disp_object.displacements
          self.nm_disp2 = nm_disp_object.displacement2
          self.omega = nm_disp_object.omega
          self.etotal = energy
          self.eigval = eigval*ev2unit["Ha"]

          self.no_of_orbitals = self.eigval.size // len(self.eigval)


          if asr == 'crystal': self.nmstart = 3
          elif asr == 'lin':   self.nmstart = 5
          elif asr == 'poly':  self.nmstart = 6
          else:                self.nmstart = 0

          self.vib_freq, self.force_const = self.__vib_freq__()
          self.__write__omega__vib_freq()             
          self.epce = self.__epce__()

          self.vib_freq, self.epce = self.__apply_asr__()
          self.epce_sum = np.sum(self.epce,axis=0)
          self.zpr = 0.5000*self.epce_sum
      

      def __nm_hessian__(self,displacements,energies):
          """
            This method calculates hessian (2nd derivative) of energies along each normal mode
            Energy can be BO energy or KS eigenvalue of any orbitals.
          """
          energy = energies[1:]-energies[0]
          hessian = central_diff(displacements,energy,order=2,ngrid=1).cd
          gradient = central_diff(displacements,energy,order=1,ngrid=1).cd
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("#Mode      Displacement          Energy(-1)        Energy(+1)         gradient          hessian\n" )
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          for i in range(self.nmstart, len(displacements)):
              self.logfile.write("%5d  %16.10g  %16.10g  %16.10g  %16.10g  %16.10g\n"\
                    %(i+1,displacements[i],energy[2*i],energy[2*i+1],gradient[i],hessian[i]))
          return hessian

      def __vib_freq__(self):
          """
             Calculates vibrational frequencies from hessian of BO energies.
             Returns frequency in Ha
          """
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("#Deravitevs of BO energy, unit: au\n")
          vib_freq = self.__nm_hessian__(self.nm_disp, self.etotal)
          force_const = vib_freq
          for nmode in range(len(self.nm_disp)):
              vib_freq[nmode] = np.sqrt(abs(vib_freq[nmode]))
          return vib_freq, force_const

      def __apply_asr__(self):
          """
             Acoustic Sum Rule
             Removes unnecessary degrees of freedom based on supplied asr
          """
          real_nmodes = len(self.nm_disp)-self.nmstart
          refined_freq = np.zeros(real_nmodes,np.float64)
          refined_epce = np.zeros((real_nmodes,self.no_of_orbitals),np.float64)
          imode=0
          for nmode in range(self.nmstart,len(self.nm_disp)):
              refined_freq[imode] = self.vib_freq[nmode]
              try:
                  refined_epce[imode,:] = self.epce[nmode,:]
              except IndexError:
                  refined_epce[imode] = self.epce[nmode] 
              #refined_epce[imode] = self.epce[nmode]
              imode += 1
          return refined_freq, refined_epce
          
          
      def __epce__(self):
          """
             Calculates epce as hessian of eigenvalues
             Returns epce in Ha
          """          
          epce = np.zeros((len(self.nm_disp),self.no_of_orbitals),np.float64)

          for orbital in range(self.no_of_orbitals):
              try:
                  self.logfile.write("#------------------------------------------------------------------------------------------------\n")
                  self.logfile.write("#Derivative of orbital energy, column %4d unit: au\n" %(orbital+1))
                  epce[:,orbital] =  self.__nm_hessian__(self.nm_disp,self.eigval[:,orbital])/(2.0*self.vib_freq[:])
              except IndexError:
                  self.logfile.write("#------------------------------------------------------------------------------------------------\n")
                  self.logfile.write("#Derivative of orbital energy, column 1  unit: au\n")
                  epce = self.__nm_hessian__(self.nm_disp,self.eigval)/(2.0*self.vib_freq)
          return epce

      def renorm_eigval_at_temp(self,T):
          """
          --------------------------------------------------------------------
          Method to Calculate Renormalized Band Energy At a Finite Temperature
          --------------------------------------------------------------------
          This method calculates renormalized band energy, for example Kohn-Sham eigenvalues 
          by performing a thermal average using the Bose Einstein factor. It returns renormalized 
          eigenvalues in Ha.

            **Argument:** **T** = Temperatute (a *float*) in K

            **Returns:** A numpy *float* array of length *n* containing renormalized
            band energies for *n* bands/orbitals at temperature *T*. 
          """
          be_factor = np.array([1.0+2*bose_einstein(omega=self.omega[i],omega_unit='Ha',T=T) for i in range(self.nmstart,len(self.nm_disp))])
          renorm = np.zeros(self.no_of_orbitals,np.float64)
          #print(be_factor)
          for orbital in range(self.no_of_orbitals):
              try:
                 renorm[orbital] =  np.sum(self.epce[:,orbital]*be_factor*0.5,axis=0)  
              except IndexError:
                 renorm =  np.sum(self.epce*be_factor*0.5,axis=0)  
          try:
             renorm_eigval = self.eigval[0,:] + renorm 
          except IndexError:
             renorm_eigval = self.eigval[0] + renorm
          renorm_eigval.sort()
          #print("Renormalization at "+str(T)+" K in " + self.epce_unit + " = " + str(renorm) )
          return renorm_eigval

      def __write__omega__vib_freq(self):
          """
          Writes the vibrational frequencies obtained from Normal Mode Hessian as well as
          from input dynamical matrix.
          """
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("# Normal mode #                          Frequency("+self.vib_freq_unit+")\n")
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("#                        From Input dynmat            From NM hessian\n")
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          for mode in range(len(self.vib_freq)):
              omega = self.omega[mode] * ha2unit[self.vib_freq_unit]
              vib_freq = self.vib_freq[mode] * ha2unit[self.vib_freq_unit]
              self.logfile.write("    %6d        %18.8g            %18.8g \n"%(mode+1,omega,vib_freq))                                           
     
