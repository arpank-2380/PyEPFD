#!/usr/bin/env python3
import sys
import cube 
import numpy as np
from mpi4py import MPI


min_energy_frame=1
start_frame=2
last_frame=15
directory = '../cube_files.1/' 

orbital_space=[[126,127,128]] #,[iorb for iorb in range(129,135)]]

def flatten(L):
    for item in L:
        try:
            yield from flatten(item)
        except TypeError:
            yield item

nframe = last_frame - start_frame + 1

comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()

if nframe%size == 0:
   frames_per_process = nframe//size
else:
   frames_per_process = nframe//size + 1

iorb_space = 0        
for orbitals in orbital_space:
    outfile_name = "frame_overlap-"+str(iorb_space)+".out"
    outfile = open(outfile_name,'w')
    outfile.write("#Orbitals indices: %s\n"%orbitals)
    if rank == 0:
       norb = len(orbitals)
       #file_list = [] 
       frame_list = []
       overlap_integral_list = []
       for process_id in range(size):
           frame_start = process_id*frames_per_process+start_frame
           if process_id != size -1:
              frame_end = (process_id+1)*frames_per_process+start_frame
           else:
              frame_end = last_frame+1
    
           #file_list.append([["%swf128_frame-%d.cube"%(directory,2*(iframe+1)),"%swf128_frame-%d.cube"%(directory,2*(iframe+1)+1)]\
           #                    for iframe in range(mode_start, mode_end)])
           frame_list.append([iframe for iframe in range(frame_start, frame_end)])
       overlap_integral_list = np.zeros((size,frames_per_process,norb*norb),np.float64)
       print(frame_list)   
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
                files = ["%swf%d_frame-%d.cube"%(directory,orbital1,min_energy_frame),\
                         "%swf%d_frame-%d.cube"%(directory,orbital2,frame)]       
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

