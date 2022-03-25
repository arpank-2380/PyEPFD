__all__=["epce_calculator"]

import numpy as np
from ipi_file_read import ipi_info
from energy_conv import *


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
      """
      def __init__(self,x,y,order=2,ngrid=4):    
          self.x = x
          self.y = y
          self._sizex = len(x)
          self._sizey = len(y)
          self.order = order
          self.ngrid = ngrid
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
      A class that stores the essentials of a dynamical matrix
      """
      def __init__(self,dynmat,mass):
          if len(dynmat) != len(mass):
             sys.exit("Dynamical matrix and mass matrix are not consistent.")
          self.dynmatrix = dynmat
          self.w2, self.U = np.linalg.eigh(self.dynmatrix)
          self.V = self.U.copy()

          self.massinv = np.array([1/np.sqrt(mass[i]) for i in range(len(mass))])

          for i in range(len(self.V)):
            self.V[:, i] *= self.massinv


class nm_sym_displacements:
      """
        A class that determines the values of normal mode displacements
        used in i-PI. Only nmfd/enmfd vibrationl modes in i-PI are 
        consistent with this.
      """
      def __init__(self,dynmat,mass,mode,deltax,deltae): 
          self.mode = mode
          if (self.mode == 'enmfd') | (self.mode == 'nmfd'): 
             pass
          else:
             raise NotImplementedError("Allowed modes: nmfd/enmfd")
          self.deltax = deltax
          self.deltae = deltae
          self.dm = dm(dynmat=dynmat,mass=mass)
          self.displacements = np.zeros(len(self.dm.V),np.float64)
          self.omega = np.sqrt(abs(self.dm.w2)) 

          #print("nm_sym_displacements class speaking")
        
          for step in range(len(self.dm.V)):
              #print("#Mode= %5d Freq (cm-1) = %10.2f" %(step+1,self.omega[step]*ha2unit['cm-1']))
              vknorm = np.sqrt(np.dot(self.dm.V[:, step], self.dm.V[:, step]))
              if self.mode == 'nmfd':
                 self.displacements[step] = self.deltax / vknorm
              elif self.mode == 'enmfd':
                 edelta = vknorm * np.sqrt(self.deltae * 2.0 / abs(self.dm.w2[step]))
                 if edelta > 100 * self.deltax:
                    edelta = 100 * self.deltax
                 self.displacements[step] = edelta / vknorm
          self.displacement2 = self.displacements*np.sqrt(abs(self.dm.w2[step]))
          #print(self.displacement2)                       

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

          self.logfile = logfile

          self.epce_unit = epce_unit
       
          nm_disp_object = nm_sym_displacements(dynmat=dynmat,mass=mass,mode=mode,deltax=deltax,deltae=deltae)
          self.nm_disp = nm_disp_object.displacements
          self.nm_disp2 = nm_disp_object.displacement2
          self.omega = nm_disp_object.omega
          self.etotal = energy
          self.eigval = eigval*ev2unit["Ha"]

          self.no_of_orbitals = self.eigval.size // len(self.eigval)


          if asr == 'crystal':
             self.nmstart = 3
          elif asr == 'lin':
             self.nmstart = 5
          elif asr == 'poly':
             self.nmstart = 6
          else:
             self.nmstart = 0

          self.vib_freq, self.force_const = self.__vib_freq__()
          self.__write__omega__vib_freq()             
          self.epce = self.__epce__()

          self.vib_freq, self.epce = self.__apply_asr__()
          self.epce_sum = np.sum(self.epce,axis=0)
          self.zpr = 0.5000*self.epce_sum
      
          #### printing by changing units
          #print("Displacement Vectors")

          #print(self.nm_disp)
          ##print("Vibrational freq ( "+ self.vib_freq_unit + " )" ) 
          ##print(self.vib_freq*ha2unit[self.vib_freq_unit])
          #print("Force constant ( "+ self.epce_unit + " )" )
          #print(self.force_const*ha2unit[self.epce_unit])
          ##print("EPCE ( "+ self.epce_unit + " )" )
          ##print(self.epce*ha2unit[self.epce_unit])
          ##print("EPCE SUM ( "+ self.epce_unit + " )" )
          ##print(self.epce_sum*ha2unit[self.epce_unit])
          #print("ZPR ("+ self.epce_unit + ")" )
          #print(self.zpr*ha2unit[self.epce_unit])

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
          #epce_gap = np.zeros(len(self.nm_disp),np.float64)
          #gap = self.eigval[:,1]-self.eigval[:,0]

          for orbital in range(self.no_of_orbitals):
              try:
                  self.logfile.write("#------------------------------------------------------------------------------------------------\n")
                  self.logfile.write("#Derivative of orbital energy, column %4d unit: au\n" %(orbital+1))
                  epce[:,orbital] =  self.__nm_hessian__(self.nm_disp,self.eigval[:,orbital])/(2.0*self.vib_freq[:])
              except IndexError:
                  self.logfile.write("#------------------------------------------------------------------------------------------------\n")
                  self.logfile.write("#Derivative of orbital energy, column 1  unit: au\n")
                  epce = self.__nm_hessian__(self.nm_disp,self.eigval)/(2.0*self.vib_freq)
              #epce_gap = self.__nm_hessian__(self.nm_disp,gap)/(2.0*self.vib_freq)
          return epce
          #return epce_gap

      def renorm_eigval_at_temp(self,T):
          """
            Calculates renormalized eigenvalues by doing a thermal average using the 
            Bose Einstein factor. Return renormalized eigenvalues in Ha.
          """
          #be_factor = np.array([1.0+bose_einstein(omega=self.omega[i],omega_unit='Ha',T=T) for i in range(self.nmstart,len(self.nm_disp))])
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
     
