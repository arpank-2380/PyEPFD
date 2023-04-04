#!/usr/bin/python3
import sys, time
import numpy as np

class degeneracy:
      """
      ======================
      Class Degeneracy
      ======================
      This class will read the Kohn Sham eigenvalues from a file
      and divide it into defferent set of degenerate eigenvalues based on a defined
      degeneracy cut_off.

        **Arguments:**
      
            **logfile** = Logfile path

            **eigval_file** = A file path where each column defined KS eigenvalue with a particular orbital-index

            **overlap_file** = overlap_file path contains overlap matrix to map orbitals between two normal-mode displaced structures    
            degeneracy_cutoff = Any two elements within a degenerate state would be smaller than this value
      """
      def __init__(self,logfile,eigval_file,overlap_file=None,degeneracy_cutoff=0.002):
          self.logfile = logfile
          self.eigval = np.loadtxt(eigval_file)
          self.degeneracy_cutoff = degeneracy_cutoff
          self.degenerate_data = []
          self.degenerate_orbital_indices = []
          self.nrow = len(self.eigval)
          self.ncol = self.eigval.size//self.nrow
          #print(self.nrow, self.ncol)   
          self.overlap_matrix = self.__read_overlap_file(overlap_file)
          if self.ncol > 1:
             self.__modify_ks_eigval()

      def __read_overlap_file(self,filename):
          if (filename is None):
             return None
          else: 
             raw_data =  np.loadtxt(filename)
             no_orb = raw_data.size//len(raw_data)
             no_modes = len(raw_data)//(no_orb)
             if (self.ncol != no_orb) | (self.nrow != 2*no_modes+1): 
                sys.exit(eigval_file+" and "+overlap_file+" are not consistent.")
             else:
                overlap_matrix = np.zeros((no_modes,no_orb,no_orb),np.float64) 
                for mode in range(no_modes):
                    for row in range(no_orb):
                        line_index = mode*no_orb+row
                        for col in range(no_orb):
                            overlap_matrix[mode,row,col] = raw_data[line_index,col]
                return overlap_matrix
      
      
      def _group(self,data,cutoff):
          """
             This method will group the degenerate orbitals based on
             the givven degeneracy cutoff
          """ 
          #print(data)
          diff1 = [data[i+1]-data[i] for i in range(len(data)-1)]
          diff2 = [data[i+2]-data[i] for i in range(len(data)-2)]
      
          divider = []
          for i in range(len(data)-1):
              if (diff1[i] >= cutoff) & (divider.count(i) == 0):
                 divider.append(i)
              if i < len(data)-2 :
                 if diff2[i] >= cutoff:
                    if diff1[i+1] > diff1[i]:
                       j = i+1
                    else:
                       j = i
                    if divider.count(j) == 0:
                       divider.append(j)
          divider.sort()
          #print(divider)
      
          i=0
          grouped_data = []
          grouped_indices = []
          for index in divider:
              tmp_list_data = []
              tmp_list_indices = []
              while i <= index:
                    tmp_list_data.append(data[i])
                    tmp_list_indices.append(i)
                    i += 1
              grouped_data.append(tmp_list_data)
              grouped_indices.append(tmp_list_indices)
          tmp_list_data = []
          tmp_list_indices = []
          while i < len(data):
              tmp_list_data.append(data[i])
              tmp_list_indices.append(i)
              i += 1
          grouped_data.append(tmp_list_data)
          grouped_indices.append(tmp_list_indices)
          return grouped_data, grouped_indices
      
      def __modify_ks_eigval(self):
          """
            This method would modify the supplied eigenvalues. 
            For a degenerate set only average values would be stored.
            If overlap matrix is supplied then for each phonon modes,
            a mapping of orbitals between two displaced structure 
            would be determined based on maximum overlap and to ensure
            same electronic state is used for calculating the second 
            derivatives in epce_calculator class 
          """    
          if self.overlap_matrix is None:
             if self.degeneracy_cutoff is not None:
                for row in range(self.nrow):
                    orbital_energies = self.eigval[row,:]
                    degenerate_energies, degenerate_indices = self._group(orbital_energies, self.degeneracy_cutoff)
                    self.__average_degenerate_eigval(row,degenerate_energies)
             else:
                pass  
          else:
             overlap_matrix = np.abs(self.overlap_matrix)
             tmp_overlap_matrix = np.zeros((self.ncol,self.ncol),np.float64)
             #print(overlap_matrix)
             for row in range(self.nrow):
                 nmode_index = row//2-1
                 orbital_energies = self.eigval[row,:]
                 degenerate_energies, degenerate_indices = self._group(orbital_energies, self.degeneracy_cutoff)
                 if (row == 0) or (row%2 != 0) or len(degenerate_energies) == 1 :
                    pass
                 else:
                    for index in range(self.ncol):
                        tmp_overlap_matrix[:,index] = overlap_matrix[nmode_index,:,index]\
                                     /np.sqrt(np.sum(overlap_matrix[nmode_index,:,index]**2))
                    new_degenerate_indices = []
                    degenerate_energies = []
                    for indices in degenerate_indices:
                        tmp_degenerate_indices = []
                        tmp_degenerate_energies = []
                        for index in indices:
                            new_index = np.argmax(tmp_overlap_matrix[:,index])    
                            #if (tmp_overlap_matrix[new_index,index] < 0.99):
                                #print("Maximum overlap (%d,%d) = %12.6g"%(index,new_index,tmp_overlap_matrix[new_index,index]))
                            tmp_degenerate_indices.append(new_index)
                            tmp_degenerate_energies.append(self.eigval[row,new_index])
                        new_degenerate_indices.append(tmp_degenerate_indices)
                        degenerate_energies.append(tmp_degenerate_energies)
                    #print(row+1, new_degenerate_indices )
                 self.__average_degenerate_eigval(row,degenerate_energies)

      def __average_degenerate_eigval(self,row,degenerate_energies):
          """
            Method calculate average of eigenvalues over a degenrate
            orbital space
          """
          icol = 0   
          for item in degenerate_energies:
              mean_energy = sum(item)/float(len(item))
              for i in range(len(item)):
                  self.eigval[row,icol] = mean_energy  
                  icol += 1

      def rewrite_ks_eigval(self,filename):
          """
          Method to rewrite the modified eigenvalues in a separate file. 
          **Argument:** filename

            .. warning::
                Usually used for debugging.
          """
          outfile = open(filename,"w")
          for row in range(self.nrow):
              for col in range(self.ncol):
                  outfile.write(" %18.12g  "%self.eigval[row,col])
              outfile.write("\n")

               
