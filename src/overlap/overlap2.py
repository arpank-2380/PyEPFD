#!/usr/bin/env python3
"""
    This code computes the overlap integral 
    for a set of orbitals (defined by indices, file type: cube files)
    at a structure (usually from MD or Frozen phonon) 
    and 
    a reference structure (usually optimized structure)
    Author: Arpan Kundu, arpan.kundu@gmail.com
"""

import sys
import cube 
import numpy as np
from mpi4py import MPI

class overlap():

      def __init__(self, ref_frame = 1, start_frame=2, last_frame=5, inc_frame=1, directory='./', orbital_space=[[126,127,128]], cube_prefix='wf'):
          
          comm = MPI.COMM_WORLD
          size = comm.Get_size()
          rank = comm.Get_rank()

          nframe = (last_frame - start_frame)// inc_frame + 1
          
          if nframe%size == 0:
             frames_per_process = nframe//size
          else:
             frames_per_process = nframe//size + 1
          
          iorb_space = 0        
          for orbitals in orbital_space:
              outfile_name = "orbital-"+str(iorb_space)+".overlap"
              outfile = open(outfile_name,'w')
              outfile.write("#Orbitals indices: %s, Reference Frame = %d\n"%(orbitals,ref_frame))
              if rank == 0:
                 norb = len(orbitals)
                 #file_list = [] 
                 frame_list = []
                 overlap_integral_list = []
                 for process_id in range(size):
                     frame_start = process_id * frames_per_process * inc_frame + start_frame
                     if process_id != size -1:
                        frame_end = (process_id+1) * frames_per_process * inc_frame + start_frame
                     else:
                        frame_end = last_frame+1
              
                     #file_list.append([["%swf128_frame-%d.cube"%(directory,2*(iframe+1)),"%swf128_frame-%d.cube"%(directory,2*(iframe+1)+1)]\
                     #                    for iframe in range(mode_start, mode_end)])
                     frame_list.append([iframe for iframe in range(frame_start, frame_end, inc_frame)])
                 overlap_integral_list = np.zeros((size,frames_per_process,norb*norb),np.float64)
                 #print(frame_list)   
              else:
                 norb = None
                 frame_list = None
                 overlap_integral_list = None
          
           
              norb = comm.bcast(norb, root = 0)
              frame_list = comm.scatter(frame_list, root = 0)
              overlap_integral_list = comm.scatter(overlap_integral_list, root = 0)
              
              iframe = 0
              for frame in frame_list:
                  iorb = 0
                  for orbital1 in orbitals:
                      for orbital2 in orbitals:
                          files = ["%s%s%d_frame-%d.cube"%(directory,cube_prefix,orbital1,ref_frame),\
                                   "%s%s%d_frame-%d.cube"%(directory,cube_prefix,orbital2,frame)]       
                          value = cube.overlap_integral(files)
                          #print("Files: %s, Overlap: %14.6g)"%(files,value))
                          overlap_integral_list[iframe,iorb] = value
                          #print(iframe,iorb,value)
                          iorb += 1    
                  iframe += 1
              
              overlap_integral_tmp = comm.gather(overlap_integral_list)
              frame_list = comm.gather(frame_list) 
              #print('rank %d has files: %s'%(rank,file_list))
              #print('rank %d has overlap integral list: %s'%(rank,str(overlap_integral)))
              if rank == 0:
                 #print(frame_list)
                 #overlap_integral = np.zeros(norb_space,nframe,norb*norb,np.float64)
                 #iframe = 0
                 for process_id in range(size):
                     iframe = 0
                     overlaps = overlap_integral_tmp[process_id]
                     for overlap in overlaps:
                         outfile.write('#Frame index = '+str(frame_list[process_id][iframe])+'\n')
                         for i in range(len(overlap)):
                             #overlap_integral(iorb_space,iframe,i) = mode[i]
                             outfile.write('  %14.6g  '%overlap[i])
                             if i%norb == norb-1:
                                outfile.write('\n')  
                         #print(np.reshape(overlap_integral(iorb_space,iframe,:),(norb,norb)))
                         iframe += 1
                         if iframe >= len(frame_list[process_id]):
                            break
              outfile.close()
              iorb_space += 1

      def flatten(self,L):
          for item in L:
              try:
                  yield from flatten(item)
              except TypeError:
                  yield item
      

