import sys, os, time
import numpy as np
from coord_util import *
from constants import *
from elph_classes import dm

class anharm_measure(dm):
      """
      ============================
      Anharm Measure Class
      ============================
      This class have all methods to compute anharmonicity measure. Currently only anharmonic measure 
      proposed by Knoop, Purcell, Scheffler, and Carbogno is implemented. 
      
      Citation: Phys. Rev. Mater 4, 083809 (2020)

          **Arguments:**

            **dynmat** = dynamical matrix, a numpy array of 3 *N* x 3 *N*; where *N*
            is the number of atoms. 

            **mass** = mass matrix
            
            **forces** = A (n,3N) matrix: n 3N-dimensional vector containing cartesian forces from 
            n number of MD/MC snapshots
            
            **disp_coords** = (n,3N) matrix: n 3N-dimensional vector containing cartesian coordinates 
            from n number of MD/MC snapshots
            
            **opt_coord** = 3N-dimensional vector of cartesian coordinates of a optimized geometry/structure
            
            **asr** = acoustic sum rule; allowed values are:
            **(1)** *'none'* (Default): asr is **not** applied, 
            OR 
            **(2)** *'crystal'*: For infinite systems / crystals, 
            OR
            **(3)** *'poly'*: For poly-atomic non-linear molecules, 
            **OR** 
            **(4)** *'lin'*: For any linear molecules

            **mode_resolved** = Allowed values are 
            **(1)** *True*: Mode-resolved anharmonic measure is computed, 
            OR
            **(2)** *False*: Mode-resolved anharmonic measure is **not** computed.
      """
      def __init__(self,dynmat, mass, forces, disp_coords, opt_coord, asr='none', \
                   mode_resolved=True, remove_rot_trans=True):
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


          self.apply_asr(opt_coord = opt_coord ,asr = asr)   
          self.dynmatrix = self.refdynmatrix
          self.U = self.refU; self.V = self.refV; self.w2 = self.refw2; self.omega = self.refomega

          self.calc_hessian()
          self.opt_coord_com = self.opt_coord_com.flatten()
          if remove_rot_trans: self._remove_trans_rot(self.opt_coord_com)
          for i in range(len(self.disp)): self.disp[i] -= self.opt_coord_com

          self._measure(mode_resolved = mode_resolved)

          final_time = time.time()
          exec_time = final_time - init_time
          print("anharm_measure: Execution time (s): " + str(exec_time))

      
      def _remove_trans_rot(self,ref_coord):
          """
          This function removes the global translation/rotation from the trajectory

            **Arguments:**

                **ref_coord** = Any refrernce coordinates with respect to which global rotation/translations
                must be removed. 3N-dimensional vector of cartesian coordinates. 

          """
          for i in range(len(self.disp)):
              self.disp[i], self.forces[i] = remove_trans_rot( ref_coord = ref_coord, \
                                          coord = self.disp[i], forces = self.forces[i], mass = self.mass)

      def _measure(self,mode_resolved=True): 
          """
          This function performs the anharmonic measure

            **Arguments:**

                **mode_resolved**= Allowed values are: 
                *True*(Default): calculates mode resolved anharmonic measure
                *False*: does **not** calculate mode-resolved anharmonic measure
          """
          self.cart_anh_var, self.cart_tot_var, self.cart_anh_mes, \
          self.mode_anh_var, self.mode_tot_var, self.mode_anh_mes = self._KPSC_anh_measure(mode_resolved)
          self.atom_anh_var, self.atom_tot_var, self.atom_anh_mes = self._atom_resolved(self.cart_anh_var,self.cart_tot_var)
          self.atom_anh_var_sum, self.atom_tot_var_sum, self.atom_anh_mes_sum = \
                  self._sum_measure(anh_var = self.atom_anh_var, tot_var = self.atom_tot_var)
          if self.mode_anh_mes is not None:        
             self.mode_anh_var_sum, self.mode_tot_var_sum, self.mode_anh_mes_sum = \
                     self._sum_measure(anh_var = self.mode_anh_var, tot_var = self.mode_tot_var)

      def _force_decomp(self,hessian, forces, disp):
          """
          This function does the force_decomposition: returns harmonic and anharmonic forces for a particular frame. 

            **Arguments:** 
                **disp** = A  3-N dimensional vector of displaced co-ordinates,

                **forces** = A 3N-dim cartesian vectors of forces at displaced coordinated
                computed from first-principles, 

                **hessian** = 3N*3N cartesian hessian

          It terurns harmonic and anharmonic forces for a particular frame.   
          """

          harm_forces = np.array(forces)
          for i in range(len(forces)):
              harm_forces[i] = -np.dot(hessian,disp[i])
          anharm_forces = forces - harm_forces
          return anharm_forces, harm_forces

      def _variance(self,vector):
          """
          Args: vector = (n x m) matrice where n is the number of MD/MC snapshot and 
                   m is the dimension of the vector(force,displacement etc)
          """
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
          """
          Sum up the variances for 3 cartesian coordinates of an atom
          """
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
          """
          ----------------------------------------
          Write method 
          ----------------------------------------
          This function writes the anharmonic measure for each mode and atoms.

            **Arguments:**

                **file_path** = path to the output files where anharmonic measure values would be written

                **atoms** = A python list of all atoms

                **vib_freq_unit** = The unit in which vibrational frequency of normal modes would be printed.
                The allowed values are: 
                **(1)** *'cm-1'*(Default), OR
                **(2)** *'THz'*, OR
                **(3)** *'K'*, OR
                **(4)** *'meV'*.
          
            **Returns:**

                In the given **file_path** it will create files with suffix **_atom_res_anh_mes.out** and 
                **_mode_res_anh_mes.out** (if **mode_resolved** = *True*) where anharmonic 
                measure would be printed.
          """
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


class boltzmann_reweighting(dm):
      """
      =========================================================================
      Boltzmann Reweighting Class
      =========================================================================
      .. warning:: 
         This class is experimental and not recommended for use.
      
      This class uses a Boltzmann reweighting technique at a finite T to include 
      anharmonicity. T cannot be small or 0. 
     
        **Arguments:**
            
            **dynmat** = dynamical matrix 

            **mass** = mass matrix
            
            **disp_coords** = (n,3N) matrix: n 3N-dimensional vector containing cartesian coordinates 
            from n number of MD/MC snapshots
           
            **opt_coord** = 3N-dimensional vector of cartesian coordinates of a optimized geometry/structure
           
            **opt_energy** = A *float* representing energy (atomic_unit) of the optimized coordinates

            **temperature** = A *float* representing Temperature (in K)

            **asr** = acoustic sum rule; allowed values are:
            **(1)** *'none'* (Default): asr is **not** applied, 
            OR 
            **(2)** *'crystal'*: For infinite systems / crystals, 
            OR
            **(3)** *'poly'*: For poly-atomic non-linear molecules, 
            OR 
            **(4)** *'lin'*: For any linear molecules

            **remove_rot_trans** = Allowed values are:
            **(1)** *True*: removes global translations and rotations, 
            OR
            **(2)** *False*: does not remove global translations and rotations, from the **disp_coords** 

        **Returns:**

            The modified weights for new configurations as an object **anharm.boltzmann_reweighting.weights**.
      """
      def __init__(self,dynmat, mass, \
                   disp_energy, disp_coords, opt_energy, opt_coord, temperature, \
                   asr='none', remove_rot_trans=True):
          super(boltzmann_reweighting,self).__init__(dynmat,mass)
          init_time = time.time()
          self.energy = np.array(disp_energy)-opt_energy
          self.disp = np.array(disp_coords)
          self.temperature = temperature

          if self.energy.shape[0] != self.disp.shape[0]:
             raise ValueError("anharm_reweighting: Number of MD/MC snapshots in energy and disp_coords are not same!")
          if ((self.disp.shape[1] != self.nmodes) | (len(opt_coord) != self.nmodes)):
             raise ValueError("anharm_reweighting: Vector dimension of forces/displacement/opt_coord is not consistent with dynmatrix.")
          if (asr == 'none') | (asr == 'poly') | (asr == 'lin') | (asr == 'crystal'): pass
          else: ValueError("anharm_reweighting: The allowed values for asr are 'none', 'poly', 'lin', 'crystal")
          if temperature < 1.0: 
             raise ValueError("boltzmann_reweighting: Does not work for small or near-zero temperature")  

          self.apply_asr(opt_coord = opt_coord ,asr = asr)
          self.dynmatrix = self.refdynmatrix
          self.U = self.refU; self.V = self.refV; self.w2 = self.refw2; self.omega = self.refomega

          self.calc_hessian()
          self.opt_coord_com = self.opt_coord_com.flatten()
          if remove_rot_trans: self._remove_trans_rot(self.opt_coord_com)
          self.nconfig = len(self.disp)
          for i in range(self.nconfig): self.disp[i] -= self.opt_coord_com

          self._energy_decomp()
          self._calc_weights()
          self._anharm_measure()

      def _energy_decomp(self):
          """energy_decomposition: returns harmonic and anharmonic contribution of energy for a particular frame. 
             Args: disp= n rows of 3N-dim cartesian vectors, 
                   hessian = 3N*3N cartesian hessian
                   energy = ab-initio total energy energy (scaler) of m-snapshots
          """
          self.harm_energy = np.copy(self.energy)
          #print(len(self.harm_energy))
          for i in range(len(self.energy)):
              self.harm_energy[i] = 0.5 * np.dot(self.disp[i],np.dot(self.hessian,self.disp[i]))
          self.anharm_energy = self.energy - self.harm_energy

      def _anharm_measure(self):
          """It is an anharm measure analogous to KPSC measure but based on energies.
             Here it is defined as the ratio of standard deviation of anharmonic energy and total energy.
          """
          anh_var = np.var(self.anharm_energy); tot_var = np.var(self.energy)
          self.anharm_measure = np.sqrt(anh_var/tot_var)

      def _calc_weights(self):
          """
          Calculates Boltzmann weights based on anharmonic energy
          """
          self.weights = np.ones(self.nconfig, np.float128)
          for i in range(self.nconfig):
              self.weights[i] = np.exp(-self.anharm_energy[i] * ha2unit['K'] / self.temperature)
          norm_fac = self.nconfig / np.sum(self.weights)
          self.weights *= norm_fac
   
      def _remove_trans_rot(self,ref_coord):
          """ Removes translation of com and angular momentum  """
          for i in range(len(self.disp)):
              self.disp[i], self.forces[i] = remove_trans_rot( ref_coord = ref_coord, \
                                          coord = self.disp[i], forces = self.forces[i], mass = self.mass)   
