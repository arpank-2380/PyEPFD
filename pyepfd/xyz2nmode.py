# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

__all__=["prob_dist_on_nm"]

import sys,os,time
import numpy as np
import scipy
import scipy.stats
from pyepfd.pyepfd_io import *
from pyepfd.ipi_file_read import ipi_info
from pyepfd.elph_classes import dm
from pyepfd.constants import *
from pyepfd.coord_util import * 


class nm_info:
      def __init__(self,phonon_info_file):
          ph_file = open(phonon_info_file,'r+')
          root_tag = ph_file.readline()
          ph_file.close()
          if "<simulation" in root_tag:
             ipi = ipi_info(file_path=phonon_info_file)
             dyn_mat = dm(dynmat=ipi.dynmatrix, mass = ipi.mass)
             asr = ipi.asr
          elif "<pyepfd" in root_tag:
             pyepfd = read_pyepfd_info(file_path = phonon_info_file)
             if pyepfd.ref_dynmatrix is not None:
                dyn_mat = dm(dynmat=pyepfd.ref_dynmatrix, mass= pyepfd.mass)
             elif pyepfd.dynmatrix:
                dyn_mat = dm(dynmat=pyepfd.dynmatrix, mass= pyepfd.mass) 
             else:
                raise ValueError("Dynamical matrix not found in " + phonon_info_file) 
             asr = pyepfd.asr
          self.mass = dyn_mat.mass
          self.mode_vectors = dyn_mat.V
          self.omega = np.sqrt(abs(dyn_mat.w2))
          self.total_modes = len(self.mode_vectors)

          if asr is None:
             self.nmstart = 0
          elif asr == 'crystal':
             self.nmstart = 3
          elif asr == 'lin':
             self.nmstart = 5
          elif asr == 'poly':
             self.nmstart = 6
          else:
             self.nmstart = 0

class xyz2nmode:
      """
         This class reads a XYZ trajectory, saves it and also save the normal mode information.
         This class has all the methods to project a snapshot into normal mode and get the coefficients.
      """
      def __init__(self, ref_struc, traj_file, nm_info):
          ref_natoms, ref_nframes, ref_traj_lines, ref_pos_unit = self.get_xyz_info(ref_struc)
          self.natoms, self.nframes, self.traj_lines, self.pos_unit = self.get_xyz_info(traj_file)
          if ref_natoms != self.natoms:
             sys.exit("Number of atoms are not consistent in reference and trajectory.")
          self.ref_coord = self.getcoord(xyz_lines=ref_traj_lines,pos_unit=ref_pos_unit)          
          self.mode_vectors = nm_info.mode_vectors
          self.omega = nm_info.omega
          self.nmstart = nm_info.nmstart
          self.mass = nm_info.mass


      def getcoord(self, xyz_lines=None, frame_no=1, pos_unit="angstrom"):
          if xyz_lines is None:
             xyz_lines = self.traj_lines
          start_line = (frame_no-1)*(self.natoms+2)+2
          end_line = frame_no*(self.natoms+2)
          coord = np.zeros(3*self.natoms,np.float64)
          icoord = 0
          for iline in range(start_line,end_line):
              line_values = xyz_lines[iline].split()
              for value in line_values[1:]:
                  coord[icoord] = value
                  icoord += 1
          if pos_unit == "angstrom":
             coord *= 1.88973       ### converting angstrom into atomic unit                 
          return coord    
              
      def get_xyz_info(self,file_path):
          xyz_file = open(file_path)
          file_lines = xyz_file.readlines()
          xyz_file.close()
          natoms = int(file_lines[0].split()[0]) 
          nframes = int(len(file_lines)/(natoms+2))
          remainder = len(file_lines)%(natoms+2)
          if remainder != 0:
              sys.exit("File: "+file_path+ " is truncated")

          cell_tag = None
          comment = file_lines[1].split()
          pos_unit = "angstrom"
          cell_unit = "angstrom"
          ### detecting i-PI style comments
          if 'CELL(abcABC):' in comment:
              cell_tag='CELL(abcABC):'
          if cell_tag is not None:
             if ('x_centeroid{atomic_unit}' in comment) or ('positions{atomic_unit}' in comment):
                pos_unit='atomic_unit'
             if 'cell{atomic_unit}' in comment:
                cell_unit='atomic_unit'
      
          #print(pos_unit,cell_unit)
          return natoms, nframes, file_lines, pos_unit   #, cell_unit 
      
      def get_nm_coeff(self,frame_no,mode_list=None,freq_scaled = True, remove_rot_trans=True):
          if mode_list is None:
             mode_list = [i+1 for i in range(self.nmstart,len(self.omega))]
             #header = "#Coefficients along all modes printed in column."
          #else :
             #header = "#coefficients along modes: "+ str(mode_list) + "printed in columns."
         
          cart_disp = self.getcoord(self.traj_lines,frame_no,self.pos_unit)
          if remove_rot_trans:
             cart_disp = remove_trans_rot( ref_coord = self.ref_coord, \
                         coord = cart_disp, mass = self.mass)
          cart_disp -= self.ref_coord
          mode_coeff = np.zeros(len(mode_list),np.float64)
          imode = 0
          for modes in mode_list:
              mode_coeff[imode] = self.__proj_on_nm(cart_disp,modes-1)
              imode += 1
          if (freq_scaled):
              mode_omega = np.array([self.omega[mode-1] for mode in mode_list])
              mode_coeff = mode_coeff * np.sqrt(mode_omega)
          return mode_coeff

      def __proj_on_nm(self,cart_disp,mode_no):
          coeff = np.dot(cart_disp,self.mode_vectors[:,mode_no])/np.dot(self.mode_vectors[:,mode_no],self.mode_vectors[:,mode_no])
          return coeff

class prob_dist_on_nm:
      """
      ========================================================
      Class Normal Mode Probability Distribution
      ========================================================
      This class projects a whole trajectory into normal modes and computes
      probability distribution.
      This can be done either with serial or parallel (using MPI4Py) execution.

        **Arguments:**

            **phonon_info_file** = A *string.* Path to the ipi-restart file of the 
            phonon calculation or phonon file generated by pyepfd.

            **ref_struc** = A *string.* Path to the geometry optimized xyz file.

            **traj_file** = A *string.*. Path to the actual trajectory (XYZ) file.

            **prefix** = A *string*. Prefix for the output files.

            **start_frame** = An *intiger*. Starting frame of the trajectory. Default ``1``.

            **end_frame** = An *intiger*. End frame of the trajectory up to which is considered 
            for the statistics. Default: *index* of the last frame in the trajectory.

            **par_exec** = A *boolean.* If ``true`` parallel execution would be preferred provided 
            MPI4PY is available.

            **mode_list** = A list of *integers.* Supplied modes on which projection must be made. 
            Default all active modes based on the acoustic sum rule in the **phonon_info_file**.  

            **freq_scaled** = A *Boolean.* If ``True`` then the output would be in frequency scaled unit. 
            If frequency scaled then correspondig result would be equivalent to V(x) = 0.5*x**2.

            **nmode_traj** = A *Boolean.* If ``True`` it would write the whole trajectory in 
            normal mode coordinates.

            **hist_start** = A *float.* Grid points from where histogram of probability density 
            would begin. Default ``-5.0``.

            **hist_end** = A *float.* Grid points from where histogram of probability density would end.

            **hist_nbin** = An *integer.* Number of bins on the probability density histogram
      """
      def __init__(self, phonon_info_file, ref_struc, traj_file, prefix,
                   start_frame = 1, end_frame = None, remove_rot_trans=True, 
                   par_exec = True,mode_list = None, freq_scaled = True, 
                   nmode_traj = True, hist_start = -5.0, hist_end = 5.0, hist_nbin = 1001):
          
          init_time = time.time()
          global MPI, mpi
          mpi = par_exec
          if mpi:
             try:
                 from mpi4py import MPI 
                 mpi = True 
             except ImportError:
                 mpi = False
                 print("Package mpi4Py not found. Reverting to serial execution.")
          #global MPI, mpi
          
          self.remove_rot_trans = remove_rot_trans
          nmode = nm_info(phonon_info_file=phonon_info_file)
          self.traj = xyz2nmode(ref_struc=ref_struc, traj_file=traj_file, nm_info=nmode)
          self.frame_start = start_frame
          if end_frame is None:
             self.frame_end = self.traj.nframes
          else:
             self.frame_end = end_frame
          self.no_frame = self.frame_end - self.frame_start + 1

          if mode_list is None:
             self.mode_list = [i+1 for i in range(self.traj.nmstart,len(self.traj.omega))]
          else:
             self.mode_list = mode_list

          self.nm_traj_fn = prefix + ".nmode-coeff.dat"
          self.hist_fn = prefix + ".prob-density.dat"
          self.stat_fn = prefix + ".stat.dat"

          self.freq_scaled = freq_scaled
          self.nmode_traj = nmode_traj
          self.histogram_bins = np.linspace(hist_start,hist_end,hist_nbin)

          self.__get_prob_density()
          final_time = time.time()
          exec_time = final_time - init_time
          print("Total execution time (s): "+ str(exec_time))

      def __get_prob_density(self):
          if mpi:
             self.__get_prob_density_par()
          else:
             self.__get_prob_density_ser()

      def __write_nm_traj(self,mode_list,mode_coeff):
          if self.nmode_traj:
             nm_traj_file = open(self.nm_traj_fn,"w+")
             nm_traj_file.write("#Included Modes: ")
             nm_traj_file.write(" ".join(map(str, mode_list)) + "\n")
             nm_traj_file.write("#Each row represent a snapshot with NM-coefficients ")
             if self.freq_scaled:
                nm_traj_file.write("(Freq Scaled)")
             nm_traj_file.write("\n")
             for i in range(self.no_frame):
                 nm_traj_file.write("  ".join(map(str, mode_coeff[i])) + "\n")             
          else:
             pass

      def __write_prob_density(self, mode_list, hist_bins, hist_weights):
          hist_file = open(self.hist_fn,"w+")
          hist_file.write("#Column-1 => Grid points")
          if self.freq_scaled:
             hist_file.write("(Freq Scaled)") 
          hist_file.write("\n#Other columns => probability densities for Modes:")
          hist_file.write(" ".join(map(str, mode_list)) + "\n")   
          for i in range(len(hist_weights)):
              bin_center = ( hist_bins[i] + hist_bins[i+1] ) / 2.0
              hist_file.write("%s  "%(str(bin_center)))
              hist_file.write("  ".join(map(str, hist_weights[i])) + "\n") 

      def __write_statistics(self, mode_list,mean, median, std, skewness, skewtest):
          stat_file = open(self.stat_fn, "w+")
          stat_file.write("#-----------------------------------------Information-----------------------------------\n")
          stat_file.write("#        Skewness = Fischer - Pearson coefficient of skewness (moment based)         \n")
          stat_file.write("#       Skew-Test Null Hypothesis: The distribution is drawn from a Gaussian         \n")
          stat_file.write("#   Therefore if p-value is less than 0.05 that means the distribution is skewed     \n")
          stat_file.write("#                      with (1 - 0.05)*100 = 95% confidence                          \n")
          if self.freq_scaled:
             stat_file.write("#               Mean, Median and Stdev are in Freq scaled coordinate                 \n")
          stat_file.write("#---------------------------------------------------------------------------------------\n")
          stat_file.write("# Mode No      Mean          Median          Stdev        Skewness    Skew-Test(p-value)\n")
          stat_file.write("#---------------------------------------------------------------------------------------\n")
          for i in range(len(mode_list)):
              stat_file.write(" %6d  %13.6g  %13.6g  %13.6g  %13.6g  %13.6g\n"\
                             %(mode_list[i], mean[i], median[i], std[i], skewness[i], skewtest[i])) 
             

      def __get_prob_density_par(self): 
          """
             mpi parallelized version of the code
          """
          comm = MPI.COMM_WORLD
          size = comm.Get_size()
          rank = comm.Get_rank()
   
          if self.no_frame % size == 0:
             frame_per_process = self.no_frame // size
          else:
             frame_per_process = self.no_frame // size + 1
   
          if rank == 0:
             nmode_coeff = np.zeros((size,frame_per_process,len(self.mode_list)),np.float64)
             frame_range = np.zeros((size,2),np.int)
             for pid in range(size):
                 frame_range[pid,0] = pid * frame_per_process + self.frame_start
                 if pid != size -1:
                    frame_range[pid,1] = (pid+1) * frame_per_process + self.frame_start
                 else:
                    frame_range[pid,1] = self.frame_end + 1
                 #print("Process id = %d"%pid)
                 #print(frame_range[pid,0], frame_range[pid,1])        
          else:
             frame_range = None
             nmode_coeff = None
         
          frame_range = comm.scatter(frame_range, root = 0)
          nmode_coeff = comm.scatter(nmode_coeff, root = 0)
         
          iframe = 0
          #print(self.mode_list)
          for frame in range(frame_range[0],frame_range[1]):
              nmode_coeff[iframe,:] = self.traj.get_nm_coeff(frame,self.mode_list,self.freq_scaled,self.remove_rot_trans)
              iframe += 1
         #print(nmode_coeff)
         
          nmode_coeff_gathered = comm.gather(nmode_coeff) #.reshape(((size+1)*frame_per_process,len(mode_list)))
   
          if rank == 0:
             nmode_coeff = np.concatenate(nmode_coeff_gathered, axis = 0)
         #   print("Gathered data")
         #   print(nmode_coeff)
             self.__write_nm_traj(self.mode_list, nmode_coeff) 
             if len(self.mode_list) % size == 0:
                mode_per_process = len(self.mode_list) // size
             else:
                mode_per_process = len(self.mode_list) // size + 1
             i_range = np.zeros((size,2),np.int)
             for pid in range(size):
                 i_range[pid,0] = pid*mode_per_process
                 if pid != size -1:
                    i_range[pid,1] = (pid+1)*mode_per_process
                 else:
                    i_range[pid,1] = len(self.mode_list) 
          else:
             nmode_coeff = None
             i_range = None
         
          del nmode_coeff_gathered
          del self.traj
         
          nmode_coeff = comm.bcast(nmode_coeff, root=0)
          i_range = comm.scatter(i_range, root=0)
         
         
          histogram_list = []
          for i in range(i_range[0],i_range[1]):
              hist, hist_bins = np.histogram(nmode_coeff[:,i],bins = self.histogram_bins, density=True)
              histogram_list = np.append(histogram_list,hist, axis=0)
         
          mean = scipy.mean(nmode_coeff[:,i_range[0]:i_range[1]], axis=0)
          median = scipy.median(nmode_coeff[:,i_range[0]:i_range[1]], axis=0)
          std = scipy.std(nmode_coeff[:,i_range[0]:i_range[1]], axis=0)
          skew_measure = scipy.stats.skew(nmode_coeff[:,i_range[0]:i_range[1]], axis=0, bias=False)
          skew_test_z, skew_test_p = scipy.stats.skewtest(nmode_coeff[:,i_range[0]:i_range[1]], axis=0)
         
          histogram_gathered = comm.gather( histogram_list )
          mean_gathered = comm.gather( mean )
          median_gathered = comm.gather( median )
          std_gathered = comm.gather( std )
          skew_measure_gathered = comm.gather( skew_measure )
          skew_test_p_gathered = comm.gather( skew_test_p )

             
         
          if rank == 0:
            
             histogram = np.transpose(np.concatenate( histogram_gathered, axis = 0 ).\
                                      reshape(len(self.mode_list), len(self.histogram_bins)-1))  
             #print(histogram)
             self.__write_prob_density(self.mode_list,self.histogram_bins, histogram)

             mean = np.concatenate( mean_gathered, axis = 0 )
             median =  np.concatenate( median_gathered, axis = 0 )
             std = np.concatenate( std_gathered, axis = 0 )
             skew_measure = np.concatenate( skew_measure_gathered, axis = 0 )
             skew_test_p = np.concatenate( skew_test_p_gathered, axis = 0 )
             self.__write_statistics(self.mode_list,mean, median, std, skew_measure, skew_test_p)
      
      def __get_prob_density_ser(self):
          """serial version of the code"""

          nmode_coeff = np.zeros((self.no_frame,len(self.mode_list)),np.float64)
          iframe = 0
          #print(self.mode_list)
          for frame in range(self.frame_start,self.frame_end + 1):
              nmode_coeff[iframe,:] = self.traj.get_nm_coeff(frame,self.mode_list,self.freq_scaled,self.remove_rot_trans)
              iframe += 1
          self.__write_nm_traj(self.mode_list, nmode_coeff)
       
          del self.traj

          histogram_list = []
          for i in range(len(self.mode_list)):
              hist, hist_bins = np.histogram(nmode_coeff[:,i],bins = self.histogram_bins, density=True)
              histogram_list.append(hist)
          histogram = np.transpose(np.array( histogram_list))
          del histogram_list
          self.__write_prob_density(self.mode_list,self.histogram_bins, histogram)

          mean = scipy.mean(nmode_coeff, axis=0)
          median = scipy.median(nmode_coeff, axis=0)
          std = scipy.std(nmode_coeff, axis=0)
          skew_measure = scipy.stats.skew(nmode_coeff, axis=0, bias=False)
          skew_test_z, skew_test_p = scipy.stats.skewtest(nmode_coeff, axis=0)
          self.__write_statistics(self.mode_list,mean, median, std, skew_measure, skew_test_p) 
