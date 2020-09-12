#!/usr/bin/python3
import numpy as np
ks_energy_file = "dia64-homo.dat"
degeneracy_cutoff = 0.002
overlap_file = "dia64-homo.out"
iorb = 66

ks_eigval = np.loadtxt(ks_energy_file)
degenerate_data = []
degenerate_orbital_indices = []
nrow = len(ks_eigval)
ncol = ks_eigval.size//nrow
print(nrow, ncol)

def read_overlap_file(filename):
    raw_data =  np.loadtxt(filename)
    no_orb = raw_data.size//len(raw_data)
    no_modes = len(raw_data)//(no_orb)

    overlap_matrix = np.zeros((no_modes,no_orb,no_orb),np.float64)

    for mode in range(no_modes):
        for row in range(no_orb):
            line_index = mode*no_orb+row
            for col in range(no_orb):
                overlap_matrix[mode,row,col] = raw_data[line_index,col]
    return overlap_matrix



def group(data,cutoff): 
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

def rewrite_orbital_energies(filename):
    outfile = open(filename,'w')    
    overlap_matrix = np.abs(read_overlap_file(overlap_file))
    tmp_overlap_matrix = np.zeros((ncol,ncol),np.float64)
    #print(overlap_matrix)
    for row in range(nrow):
        nmode_index = row//2-1
        orbital_energies = ks_eigval[row,:]
        degenerate_energies, degenerate_indices = group(orbital_energies, degeneracy_cutoff)
        if (row == 0) or (row%2 != 0) or len(degenerate_energies) == 1 :
           pass
        else:
           tmp_overlap_matrix = overlap_matrix[nmode_index,:,:]
           new_degenerate_indices = []
           degenerate_energies = []
           for indices in degenerate_indices:
               tmp_degenerate_indices = []
               tmp_degenerate_energies = []
               for index in indices:
                   new_index = np.argmax(tmp_overlap_matrix[:,index])    
                   tmp_degenerate_indices.append(new_index)
                   tmp_degenerate_energies.append(ks_eigval[row,new_index])
               new_degenerate_indices.append(tmp_degenerate_indices)
               degenerate_energies.append(tmp_degenerate_energies)
           print(row+1, new_degenerate_indices)
           
        for item in degenerate_energies:
            mean_energy = sum(item)/float(len(item))
            for i in range(len(item)):
                outfile.write(" %18.12g  "%mean_energy)
        outfile.write("\n")

rewrite_orbital_energies("dia64-new-homo.dat")            
               
            




