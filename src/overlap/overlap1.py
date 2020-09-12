import sys
import cube 
import numpy as np
from mpi4py import MPI
"""
This code calculates the overlap intergral between displaced structures
along each normal modes 
"""

#nmode = sys.argv[1]
nmode=174
directory = '../cube_files.1/' 

#orbital_space=[[126,127,128],[iorb for iorb in range(129,135)]]
orbital_space=[[66,67,68]]


class overlap():

      def __init__(self):

          global nmode, directory, orbital_space      
          comm = MPI.COMM_WORLD
          size = comm.Get_size()
          rank = comm.Get_rank()
          
          if nmode%size == 0:
             mode_per_process = nmode//size
          else:
             mode_per_process = nmode//size + 1
          
          iorb_space = 0        
          for orbitals in orbital_space:
              outfile_name = "orbital-"+str(iorb_space)+".overlap"
              outfile = open(outfile_name,'w')
              outfile.write("#Orbitals indices: %s\n"%orbitals)
              if rank == 0:
                 norb = len(orbitals)
                 #file_list = [] 
                 frame_list = []
                 overlap_integral_list = []
                 for process_id in range(size):
                     mode_start = process_id*mode_per_process
                     if process_id != size -1:
                        mode_end = (process_id+1)*mode_per_process
                     else:
                        mode_end = nmode
              
                     #file_list.append([["%swf128_frame-%d.cube"%(directory,2*(imode+1)),"%swf128_frame-%d.cube"%(directory,2*(imode+1)+1)]\
                     #                    for imode in range(mode_start, mode_end)])
                     frame_list.append([[2*(imode+1),2*(imode+1)+1] for imode in range(mode_start, mode_end)])
                 overlap_integral_list = np.zeros((size,mode_per_process,norb*norb),np.float64)
                    
              else:
                 norb = None
                 frame_list = None
                 overlap_integral_list = None
          
              norb = comm.bcast(norb, root = 0)
              frame_list = comm.scatter(frame_list, root = 0)
              overlap_integral_list = comm.scatter(overlap_integral_list, root = 0)
              
              imode = 0
              for frames in frame_list:
                  iorb = 0
                  for orbital1 in orbitals:
                      for orbital2 in orbitals:
                          files = ["%swf%d_frame-%d.cube"%(directory,orbital1,frames[0]),\
                                   "%swf%d_frame-%d.cube"%(directory,orbital2,frames[1])]       
                          #print(files)
                          value = cube.overlap_integral(files)
                          overlap_integral_list[imode,iorb] = value
                          #print(imode,iorb,value)
                          iorb += 1    
                  imode += 1
              
              overlap_integral_tmp = comm.gather(overlap_integral_list)
              
              #print('rank %d has files: %s'%(rank,file_list))
              #print('rank %d has overlap integral list: %s'%(rank,str(overlap_integral)))
              if rank == 0:
                 print(overlap_integral_tmp)
                 #overlap_integral = np.zeros(norb_space,nmode,norb*norb,np.float64)
                 imode = 1
                 for process_id in range(size):
                     modes = overlap_integral_tmp[process_id]
                     for mode in modes:
                         #overlap_integral(iorb_space,imode,:) = mode
                         outfile.write('#normal mode index = '+str(imode)+'\n')
                         for i in range(len(mode)):
                             #overlap_integral(iorb_space,imode,i) = mode[i]
                             outfile.write('  %14.6g  '%mode[i])
                             if i%norb == norb-1:
                                outfile.write('\n')  
                         #print(np.reshape(overlap_integral(iorb_space,imode,:),(norb,norb)))
                         imode += 1
                         if imode > nmode:
                            break
              outfile.close()
              iorb_space += 1
      
      def flatten(self,L):
          for item in L:
              try:
                  yield from flatten(item)
              except TypeError:
                  yield item
      
