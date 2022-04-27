import sys, os
import numpy as np
from coord_util import *
from elph_classes import dm

class anharm(dm):
      """
      This class have all methods to compute anharmonicity measure
      Args: dynmat = dynamical matrix ; mass = mass matrix
            forces = (n,3N)matrix: n 3N-dimensional vector containing cartesian forces from n MD/MC snapshots
            disp_coords = (n,3N) matrix: n 3N-dimensional vector containing cartesian coordinates from #n MD/MC snapshots
            opt_coord = 3N-dimensional vector of cartesian coordinates of a optimized geometry/structure
            asr = acoustic sum rule; allowed values 'crystal', 'poly', 'lin'
      """
      def __init__(self,dynmat, mass, forces, disp_coords, opt_coord, asr='none'):
          super(anharm,self).__init__(dynmat,mass)
          self.forces = np.array(forces); self.disp = np.array(disp_coords)

          if self.forces.shape[0] != self.disp.shape[0]:
             raise ValueError("anharm: Number of MD/MC snapshots in forces and disp_coords are not same!")
          if (self.forces.shape[1] != self.nmodes) | (self.disp.shape[1] != self.nmodes) | (len(opt_coord) != self.nmodes):
             raise ValueError("anharm: Vector dimension of forces/displacement/opt_coord is not consistent with dynmatrix.") 
          if (asr == 'none') | (asr == 'poly') | (asr == 'lin') | (asr == 'cry'): pass
          else: ValueError("anharm: The allowed values for asr are 'none', 'poly', 'lin', 'cry'")

          for i in range(len(self.disp)):
              self.disp[i] -= opt_coord
          refdynmatrix = self.apply_asr(opt_coord = opt_coord ,asr = asr)    
          self.dynmatrix = refdynmatrix
          self.calc_hessian()

      def measure(self,resol='both'): 
          """resol = Allowed values 'atom', 'mode', 'both' for atom-resolved, mode-resolved or both"""
          if (resol == 'atom') | (resol == 'mode') | (resol == 'both'): pass
          else: ValueError(\
           "anharm.measure(): The allowed values for resol are:\n\'atom' (atom-resolved),\n or 'mode'(mode-resolved),\n or 'both' (for both atom and mode resolved ")
          if (resol == 'atom') | (resol == 'both'):
             self.atom_res_anh_var, self.atom_res_tot_var, self.atom_res = self._anh_measure('cartesian')
          if (resol == 'mode') | (resol == 'both'):  
             self.mode_res_anh_var, self.mode_res_tot_var, self.mode_res = self._anh_measure('normal')

      def _force_decomp(self,hessian, forces, disp):
          """force_decomposition: returns harmonic and anharmonic forces for a particular frame. 
             Args: disp, forces = n rows of 3N-dim vectors, hess = 3N*3N """
          harm_forces = np.array(forces)
          for i in range(len(forces)):
              harm_forces[i] = -np.dot(hessian,disp[i])
          anharm_forces = forces - harm_forces
          return anharm_forces, harm_forces

      def _variance(self,vector):
          """Args: vector = (n x m) matrice where n is the number of MD/MC snapshot and 
                   m is the dimension of the vector(force,displacement etc)"""
          vector = np.array(vector)
          variance = np.zeros(vector.shape[1],np.float64)
          for i in range(len(vector)):
              variance += np.square(vector[i])
          variance = variance/len(vector)    
          return variance    

      def _anh_measure(self,coordinate='cartesian'):
          if (coordinate == 'cartesian') | (coordinate == 'normal'): pass
          else: raise ValueError(" anharm: value of coordinate must be either 'cartesian' or 'normal'. ")
              
          forces = self.forces.copy(); disp = self.disp.copy(); hessian = self.hessian
          if coordinate == 'normal':
             for i in range(len(forces)): 
                 forces[i] = self.cart2nm_vec(self.forces[i], normed=False)
                 disp[i] = self.cart2nm_vec(self.disp[i], normed=True)
             hessian = self.w2 * np.eye(self.nmodes)
             
          anh_forces, harm_forces = self._force_decomp(hessian, forces, disp)

          print("#--------------------------------Forces are in %s coordinate-------------------------------------"%coordinate)
          print("#Coord   Anh_F   Harm_F    Tot_F")   
          print("#-------------------------------------------------------------------------------------------------")
          for iconfg in range(len(anh_forces)):
              print("#Config = %d"%(iconfg+1))
              for i in range(self.nmodes):
                  if harm_forces[iconfg,i] * forces[iconfg,i] < 0:
                     print("%d  %14.6g %14.6g %14.6g"%(i+1,anh_forces[iconfg,i], harm_forces[iconfg,i], forces[iconfg,i]))
          print("==================================================================================================")
        
          anh_var = self._variance(anh_forces); tot_var = self._variance(forces)
          anh_measure = np.sqrt(anh_var/tot_var)
          if coordinate == 'cartesian':
             anh_var,tot_var, anh_measure = self._atom_resolved(anh_var, tot_var) 
          return anh_var,tot_var, anh_measure

      def _atom_resolved(self,anh_var,tot_var):
          """Sum up the variances for 3 cartesian coordinates of an atom"""
          atom_res_anh_var = np.zeros(self.natoms)
          atom_res_tot_var = np.zeros(self.natoms)
          for iatom in range(self.natoms):
              for icart in range(3):
                  i = 3*iatom + icart
                  atom_res_anh_var[iatom] += anh_var[i]
                  atom_res_tot_var[iatom] += tot_var[i]
          atom_res_anh_var = atom_res_anh_var/3; atom_res_tot_var = atom_res_tot_var/3        
          atom_res_anh_measure = np.sqrt(atom_res_anh_var/atom_res_tot_var)
          return atom_res_anh_var, atom_res_tot_var, atom_res_anh_measure
      
