__all__=["dm","epce_calculator","phonon_calculator"]

""" This file contains all the classes relavant to frozen phonon calculation """

import numpy as np
from ipi_file_read import ipi_info
from constants import *


def bose_einstein(omega,omega_unit='Ha',T=0.0):
    """
      Function to calculate the Bose Einstein occupation
    """
    if T < 1e-8:
       bose_einstein = 0.00000000e+00
    else:
       if omega_unit == 'Ha':
          x = omega*ha2unit['K']/T
       elif omega_unit == 'eV':
          x = omega*ev2unit['K']/T
       else:
          raise ValueError("omega_unit must be Ha or eV")
       bose_einstein = 1.00000e+00/(np.exp(x)-1.0000000e+0)
    return bose_einstein

def coord_com(coord, mass, flatten=True):
    """
    Retruns coordinates with respect to center of mass (com) and com coordinates
          coord = 3N dimensional cartesian coordinates for N atoms
          mass = N dimensional mass matrix
    Returns: coord_com = coordinates with respect to c.o.m and
             com = center of mass coordinate
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


class central_diff:
      """
      This class calculates the 1st and 2nd order central difference 
      of any energy quantity (Orbital energies or total energies) when displacements are symmetric
      arg: x = column matrix of width of displacement grids. 
           y = column matrix containing values of a function (can be energy or gradient) 
               whose derivatives are to be calculated. this must be clustered in such a way that
               first ngrid contiguous values related to x(0), 
               next ngrid contiguous values related to x(1), and so on and so forth. 
           order = order of central difference
           ngrid = symmetric displacement grid for central difference,allowed values 1,2,3 or 4.
                   actual number of points would be double as we do symmetric displacements.
           decreasing = if True the displacements are in decreasing  order , i.e +2h,+h,-h,-2h        
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
            Arg: x = Array of displacement values
                 y = Array of functional values
                 order = central diff order 
                            1 ==> 1st derivative
                            2 ==> 2nd derivative
                 ngrid = Stencils/ No of symmetric displacements. 
                         Value allowed up to 4.
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
      A class that stores the essentials of a dynamical matrix.
      w2[i] = Eigenvalues in ascending order
      V[:,i] = i-th eigenvector
      It has a method that takes a normal mode displacement as a column vector 
      and converts them into a column vector of cartesian displacements
      dynmatrix is the mass weighted hessian, while hessian is not mass weighted
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
    
      def calc_hessian(self):
          """Hessian matrix without mass weighting"""
          self.hessian = np.copy(self.dynmatrix)
          for imode in range(self.nmodes):
              self.hessian[imode] = self.dynmatrix[imode] / (self.massinv[imode] * self.massinv)

      def nm2cart_disp(self, nm_disp):
          """ nm_disp = A 3N-dim column vector of normal mode displacements,
              returns cart_disp, a 3N-dim column vec containing cartesian displacements.
          """
          if len(nm_disp) != self.nmodes:
             sys.exit("Dimension of NM displacement is not consistent with dynamical matrix.")
          cart_disp = np.zeros(self.nmodes,np.float64)
          for icart in range(3*self.natoms):
              for imode in range(self.nmodes):
                  cart_disp[icart] += self.V[icart,imode] * nm_disp[imode]
          return cart_disp        

      def nm2cart_matrix(self,Mnm):
          """Converts any matrix (Mnm) represented in normal modes to that represented in cartesian(Mcart)"""
          Mcart = np.dot(self.U, np.dot(Mnm, np.transpose(self.U)))
          return Mcart

      def cart2nm_vec(self,cart_v,normed=False,mass_weight=True):
          """Projects a 3N-dim cartesian vector (coordinate or force) into a normal mode and return coeff"""
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
          #print(self.mass)
          if (asr == 'none') | (asr == 'poly') | (asr == 'lin') | (asr == 'crystal'): 
             pass
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

class stoch_displacements(dm):
      def __init__(self,dynmat,mass,asr=None,temperature=0):
          super(stoch_displacements,self).__init__(dynmat,mass)
          sigma = np.zeros(self.nmodes,np.float64)
          for mode in range(self.nmodes):
              be = bose_einstein(self.omega[mode],omega_unit='Ha',T=temperature)
              sigma[mode] = np.sqrt((be+0.5)/self.omega[mode])

          if asr == 'crystal': nmstart = 3
          elif asr == 'lin':   nmstart = 5
          elif asr == 'poly':  nmstart = 6
          else:                nmstart = 0

          self.nmdisp = np.zeros((2,self.nmodes),np.float64)
          for mode in range(self.nmodes):
              if self.V[0,mode] < 0:
                  self.V[:,mode] *= -1
          for mode in range(nmstart,self.nmodes):       
              if (mode-nmstart)%2 == 0:
                 self.nmdisp[0,mode] += sigma[mode]
                 self.nmdisp[1,mode] -= sigma[mode]
              else:   
                 self.nmdisp[0,mode] -= sigma[mode]
                 self.nmdisp[1,mode] += sigma[mode]
          print(self.nmdisp[0])
          print(self.nmdisp[1])


class nm_sym_displacements(dm):
      """
        This is a daughter class of dm.
        It determines the values of normal mode displacements
        used in i-PI. Only nmfd/enmfd vibrationl modes in i-PI are 
        consistent with this.
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
         This class accepts forces and displacements and computes dynamical matrix as Jacobian of force.
         Arg:
             forces = (2*ngrid, 3*N) 2D-array. Each row represents 3N-force components
                      for a specific displaced struc. There are 2*ngrid such displaced struc.
             mass = mass matrix
             ngrid = symmetric displacement grid for central difference,allowed values 1,2,3 or 4.
                     actual number of points would be double as we do symmetric displacements.
             mode = fd/nmfd/enmfd        
             
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
          
          self.calc_phonon()

      def calc_phonon(self):
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

          self.symmetrize()       

      def symmetrize(self):
          #print("phonon_calculator.symmetrize() speaking:")
          dm = self.dynmat.copy()
          self.dynmat = 0.50 * ( dm + dm.T)
          h = self.hessian.copy()
          self.hessian = 0.50 * ( h + h.T)

class epce_calculator:
      """
        This class calculates the all important electron phonon related properties, e.g.,
        elceton phonon coupling energies (epce) for each phonon mode,
        total zero point renormalization (zpr) of an orbital eigenvalue, 
        or thermal average of eigen values.
        Arg:
           dynmat = A numpy array (3N * 3N) of dynamical matrix, where N number of atoms
           mass = A numpy  array of mass in au (3N)
           energy = An array(6N+1) of Born-Oppenheimer energies of equilibrium geometry (energy[0])
                    and 2 displaced structures along each normal modes, starting from the 1st mode.
           logfile = logfile path
           asr = acoustaic sum rule used in iPI calculation
           mode = vibrational mode used in iPI calculation
           deltax = pos_shift used in iPI calculation
           deltae = energy_shift used in iPI calculation
           vib_freq_unit = Output unit for vibrational frequencies
           epce_unit = Output unit for  EPCE
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
            Calculates renormalized eigenvalues by doing a thermal average using the 
            Bose Einstein factor. Return renormalized eigenvalues in Ha.
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
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("# Normal mode #                          Frequency("+self.vib_freq_unit+")\n")
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          self.logfile.write("#                        From Input dynmat            From NM hessian\n")
          self.logfile.write("#------------------------------------------------------------------------------------------------\n")
          for mode in range(len(self.vib_freq)):
              omega = self.omega[mode] * ha2unit[self.vib_freq_unit]
              vib_freq = self.vib_freq[mode] * ha2unit[self.vib_freq_unit]
              self.logfile.write("    %6d        %18.8g            %18.8g \n"%(mode+1,omega,vib_freq))                                           
     
