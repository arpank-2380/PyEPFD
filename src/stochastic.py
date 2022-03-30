
import numpy as np
from epce_classes import bose_einstein, dm
from ipi_file_read import ipi_info
from energy_conv import *

class stoch_disp:
      """Computes the stochastic displacements and transforms it into cartesian"""
      def __init__(self,dynmat,mass,asr=None,temperature=0):
          self.dm = dm(dynmat=dynmat,mass=mass)
          omega = np.sqrt(abs(self.dm.w2))
          self.no_modes = len(omega)
          self.natoms = self.no_modes//3

          sigma = np.zeros(self.no_modes,np.float64)
          for mode in range(self.no_modes):
              be = bose_einstein(omega[mode],omega_unit='Ha',T=temperature)
              sigma[mode] = np.sqrt((be+0.5)/omega[mode])
          

          if asr == 'crystal':
             nmstart = 3
          elif asr == 'lin':
             nmstart = 5
          elif asr == 'poly':
             nmstart = 6
          else:
             nmstart = 0
          
          self.nm_disp = self.dm.V
          for mode in range(self.no_modes):
              if self.nm_disp[0,mode] < 0:
                  self.nm_disp[:,mode] *= -1*sigma[mode]
              else:
                  self.nm_disp[:,mode] *= sigma[mode]
          
          self.cart_disp_plus = np.zeros(3*self.natoms,np.float64)
          self.cart_disp_minus = np.zeros(3*self.natoms,np.float64)

          for icart in range(3*self.natoms):
              for mode in range(nmstart,self.no_modes):
                  if (mode-nmstart)%2 == 0:
                     self.cart_disp_plus[icart] += self.nm_disp[icart,mode]
                     self.cart_disp_minus[icart] -= self.nm_disp[icart,mode]
                  else:
                     self.cart_disp_plus[icart] -= self.nm_disp[icart,mode] 
                     self.cart_disp_minus[icart] += self.nm_disp[icart,mode]
          #print(self.cart_disp_plus)           

class stochastic:
      """ Currently outputs a XYZ file of geo opt, and meab-value structure"""
      def __init__(self, ipi_restart_file_path, temperature = 0, out_xyz="stoch.xyz"):
          self.ipi = ipi_info(file_path=ipi_restart_file_path)
          self.stoch_disp = stoch_disp( dynmat = self.ipi.dynmatrix, mass = self.ipi.mass,\
                                        asr = self.ipi.asr, temperature = temperature)
          self.natoms=self.stoch_disp.natoms
          self.out_xyz = open(out_xyz,"w+")
          self.confx_xyz = 0
          self.write_coordinates(self.ipi.coord)
          displaced_coord_plus = self.ipi.coord + self.stoch_disp.cart_disp_plus
          displaced_coord_minus = self.ipi.coord + self.stoch_disp.cart_disp_minus

          self.write_coordinates(displaced_coord_plus)
          self.write_coordinates(displaced_coord_minus)

      def write_coordinates(self,coordinates):
          """This method writes the coordinates in an XYZ file or Qbox input files"""
          self.confx_xyz += 1
          coord_angstrom = coordinates/1.88973   #(angstrom to au)
          coord_angstrom = coord_angstrom.reshape((self.natoms,3))
          self.out_xyz.write("%5d\n"%(self.natoms))
          self.out_xyz.write("#Iteration %6d\n"%(self.confx_xyz))
          for atom in range(self.natoms):
              self.out_xyz.write("%s    %13.8g  %13.8g  %13.8g\n"\
                      %(self.ipi.symbols[atom], coord_angstrom[atom,0], coord_angstrom[atom,1], coord_angstrom[atom,2])) 

