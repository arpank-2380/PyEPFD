import sys
import cube 
import numpy as np
from mpi4py import MPI
#nmode = sys.argv[1]
#nmode=174
#directory = '../cube_files.1/' 

#orbital_space=[[126,127,128],[iorb for iorb in range(129,135)]]
#orbital_space=[[66,67,68]]

class mode_overlap():
      """
      ==========================================================
      Class Mode Overlap
      ==========================================================
      This class computes the overlap integral between displaced structures along each
      normal modes. This code is parallelized with MPI4Py. Therefore, MPI4Py is needed.

        **Arguments:**
            
            **nmode** = Total number of normal modes; an *integer*.

            **orbital_space** = A python list of lists. Each inside list must contain
            a set of orbital indices.

                **Example:** ``orbital_space=[[66,67,68],[69,70]]``
                would create 2 orbital(band) spaces. In the first space orbitals with 
                indices 66-68 would be included, while in the second space 69-70 would be
                included. Usually, the orbitals which are degenerate in the undistorted 
                structure should be kept in the same space.

            **directory** = Directory path where wave function cube files are located.

        **Returns:**
            Files with names orbital-0.overlap, orbital-1.overlap, ... containing overlap
            matrices for 1st, 2nd,... orbital spaces, respectively.
      """

      def __init__(self,nmode,orbital_space,directory='../cube_files.1/'):

          #global nmode, directory, orbital_space      
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
      

class frame_overlap():
      """
      =========================================
      Class Frame Overlap
      =========================================
      This class computes the overlap integral for a set of orbitals 
      (defined by indices, file type: cube files) at a structure 
      (usually from MD or Frozen phonon) and a reference structure 
      (usually optimized structure)
      
        **Arguments:**

            **ref_frame** = *Integer.* Index of the reference frame within the cube files

            **start_fram** = *Integer.* Index of the first frame whose overlap to be computed

            **last_frame** = *Integer.* Index of the last frame whose overlap to be computed

            **inc_frame** = *Integer.* Increment of frame indices

            **directory** = *String.* Directory path where cube files are located.

            **cube_prefix** = *String* Prefix of the cube files.

            **orbital_space** = Same as **mode_overlap** class.

        **Returns:**
            Files with names orbital-0.overlap, orbital-1.overlap, ... containing overlap
            matrices for 1st, 2nd,... orbital spaces, respectively.

      """

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
      

