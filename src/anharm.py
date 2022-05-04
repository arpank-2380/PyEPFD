import sys, os, time
import numpy as np
from coord_util import *
from constants import *
from elph_classes import dm

class anharm_measure(dm):
      """
      This class have all methods to compute anharmonicity measure
      Args: dynmat = dynamical matrix ; mass = mass matrix
            forces = (n,3N)matrix: n 3N-dimensional vector containing cartesian forces from n MD/MC snapshots
            disp_coords = (n,3N) matrix: n 3N-dimensional vector containing cartesian coordinates from #n MD/MC snapshots
            opt_coord = 3N-dimensional vector of cartesian coordinates of a optimized geometry/structure
            asr = acoustic sum rule; allowed values 'crystal', 'poly', 'lin'
      """
      def __init__(self,dynmat, mass, forces, disp_coords, opt_coord, asr='none', mode_resolved=True):
          super(anharm_measure,self).__init__(dynmat,mass)
          #print("anharm class speaking:")
          init_time = time.time()
          self.forces = np.array(forces); self.disp = np.array(disp_coords)

          if self.forces.shape[0] != self.disp.shape[0]:
             raise ValueError("anharm_measure: Number of MD/MC snapshots in forces and disp_coords are not same!")
          if (self.forces.shape[1] != self.nmodes) | (self.disp.shape[1] != self.nmodes) | (len(opt_coord) != self.nmodes):
             raise ValueError("anharm_measure: Vector dimension of forces/displacement/opt_coord is not consistent with dynmatrix.") 
          if (asr == 'none') | (asr == 'poly') | (asr == 'lin') | (asr == 'crystal'): pass
          else: ValueError("anharm_measure: The allowed values for asr are 'none', 'poly', 'lin', 'crystal")

          for i in range(len(self.disp)):
              self.disp[i] -= opt_coord    
          self.apply_asr(opt_coord = opt_coord ,asr = asr)   
          self.dynmatrix = self.refdynmatrix; self.U = self.refU; self.V = self.refV; self.w2 = self.refw2; self.omega = self.refomega
          self.calc_hessian(); self._measure(mode_resolved = mode_resolved)

          final_time = time.time()
          exec_time = final_time - init_time
          print("anharm_measure: Execution time (s): " + str(exec_time))

      def _measure(self,mode_resolved=True): 
          """if mode_resolved=True it also calculates mode resolved anharmonic measure"""
          self.cart_anh_var, self.cart_tot_var, self.cart_anh_mes, \
          self.mode_anh_var, self.mode_tot_var, self.mode_anh_mes = self._KPSC_anh_measure(mode_resolved)
          self.atom_anh_var, self.atom_tot_var, self.atom_anh_mes = self._atom_resolved(self.cart_anh_var,self.cart_tot_var)
          self.atom_anh_var_sum, self.atom_tot_var_sum, self.atom_anh_mes_sum = \
                  self._sum_measure(anh_var = self.atom_anh_var, tot_var = self.atom_tot_var)
          if self.mode_anh_mes is not None:        
             self.mode_anh_var_sum, self.mode_tot_var_sum, self.mode_anh_mes_sum = \
                     self._sum_measure(anh_var = self.mode_anh_var, tot_var = self.mode_tot_var)

      def _force_decomp(self,hessian, forces, disp):
          """force_decomposition: returns harmonic and anharmonic forces for a particular frame. 
             Args: disp, forces = n rows of 3N-dim cartesian vectors, hess = 3N*3N cartesian hessian"""

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

      def _KPSC_anh_measure(self,mode_resolved=True):
          """Knoop, Purcell, Scheffler, Carbogno Anharmonic Measure
             Cite Paper: Phys. Rev. Mater 4, 083809 (2020)
             Arg: mode_resolved = if True also calculates mode resolved measure,
                                  else calculates only atom resolved measure
             Returns:                      

          """              
          forces = self.forces.copy(); disp = self.disp.copy(); hessian = self.hessian
          anh_forces, harm_forces = self._force_decomp(hessian, forces, disp)
          anh_var = self._variance(anh_forces); tot_var = self._variance(forces)
          anh_measure = np.sqrt(anh_var/tot_var)
          anh_var_mode = None; tot_var_mode = None; anh_measure_mode = None 

          if mode_resolved: 
             anh_forces_mode = np.copy(anh_forces)
             harm_forces_mode = np.copy(harm_forces) 
             forces_mode = np.copy(forces)
             for i in range(len(forces)): 
                 harm_forces_mode[i] = self.cart2nm_vec(harm_forces[i], normed=False, mass_weight=False) 
                 forces_mode[i] = self.cart2nm_vec(forces[i],normed=False, mass_weight=False) 
                 anh_forces[i] = forces[i] - harm_forces[i]
             anh_var_mode = self._variance(anh_forces_mode); tot_var_mode = self._variance(forces_mode)
             anh_measure_mode = np.sqrt(anh_var_mode/tot_var_mode)
          return anh_var,tot_var, anh_measure, anh_var_mode, tot_var_mode, anh_measure_mode

      def _atom_resolved(self,cart_anh_var,cart_tot_var):
          """Sum up the variances for 3 cartesian coordinates of an atom"""
          atom_res_anh_var = np.zeros(self.natoms)
          atom_res_tot_var = np.zeros(self.natoms)
          for iatom in range(self.natoms):
              for icart in range(3):
                  i = 3*iatom + icart
                  atom_res_anh_var[iatom] += cart_anh_var[i]
                  atom_res_tot_var[iatom] += cart_tot_var[i]
          atom_res_anh_var = atom_res_anh_var/3; atom_res_tot_var = atom_res_tot_var/3        
          atom_res_anh_measure = np.sqrt(atom_res_anh_var/atom_res_tot_var)
          return atom_res_anh_var, atom_res_tot_var, atom_res_anh_measure
      
      def _sum_measure(self,anh_var,tot_var):
          if len(anh_var) != len(tot_var):
             raise ValueError("anharm_measure._sum_measure(): len(anh_var) != len(tot_var)") 
          sum_anh_var = np.sum(anh_var) / len(anh_var)
          sum_tot_var = np.sum(tot_var) / len(tot_var)
          sum_anh_mes = np.sqrt(sum_anh_var/sum_tot_var)
          return sum_anh_var, sum_tot_var, sum_anh_mes
      
      def write(self,file_path,atoms,vib_freq_unit='cm-1'):
          if len(atoms) != self.natoms:
              raise ValueError("anharm_measure.write(): len(atoms) != anharm.natoms.")
          if (vib_freq_unit=='cm-1') | (vib_freq_unit=='K') | (vib_freq_unit=='THz') | (vib_freq_unit=='meV'): 
              pass
          else: 
              raise ValueError("anharm.write(): Allowed options for vib_freq_unit are: 'cm-1', 'K', 'THz', 'meV'")
          atom_res_out = open(file_path+'_atom_res_anh_mes.out', 'w+')
          atom_res_out.write("#  Atom         Var(Anh)        Var(Tot)     Anh_Measure \n")
          atom_res_out.write("#--------------------------------------------------------\n")
          for i in range(self.natoms):
              atom_res_out.write("%5d %3s  %14.6g %14.6g %14.6g\n"%(i+1, atoms[i],\
            self.atom_anh_var[i], self.atom_tot_var[i], self.atom_anh_mes[i]))
          atom_res_out.write("#-------------------------------------------------------\n")
          atom_res_out.write("# SUM      %14.6g %14.6g %14.6g\n"\
                  %(self.atom_anh_var_sum, self.atom_tot_var_sum, self.atom_anh_mes_sum))

          if self.mode_anh_mes is not None:
             mode_res_out = open(file_path+'_mode_res_anh_mes.out', 'w+')
             mode_res_out.write("# Mode  Freq(%4s)       Var(Anh)        Var(Tot)     Anh_Measure \n"%(vib_freq_unit))
             mode_res_out.write("#--------------------------------------------------------------\n")
             for i in range(self.nmodes):
                 mode_res_out.write("%5d  %10.4f %14.6g  %14.6g %14.6g \n"\
                    %(i+1, self.omega[i]*ha2unit[vib_freq_unit],\
                    self.mode_anh_var[i], self.mode_tot_var[i], self.mode_anh_mes[i]))
             mode_res_out.write("#--------------------------------------------------------------\n")
             mode_res_out.write("# SUM             %14.6g %14.6g %14.6g\n"\
                  %(self.mode_anh_var_sum, self.mode_tot_var_sum, self.mode_anh_mes_sum))


