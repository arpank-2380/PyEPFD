#!/usr/bin/python2
import sys,os
import numpy as np
### Insert the path where pyepfd is located
pyepfd_path = '/home/arku/Work_UChicago/Code-developments/EPFD/pyepfd/src'
sys.path.insert(0,pyepfd_path)
import pyepfd as ep


ep.inp_dir = "pyepfd_inp"  ## Directory where all input files are
ep.out_dir = "epfd1_out"   ## Directory that would be created to store all results

if not os.path.isdir(ep.out_dir):
   os.system("mkdir "+ep.out_dir)

T = ep.temp_grid( T_start = 0.0, T_end = 1100.0, NT = 111 )   ## Temperature range

### Creating an object name homo which calculate all electron-phonon things for HOMO
homo = ep.epfd(eigval_file = "homo.dat",
             overlap_file = "homo.overlap",
             degeneracy_cutoff = 0.004,
             output_prefix = "homo"
               )
homo.eigval_at_temp(T)   ### Calculating temperature dependent properties using Bose Einstein Statistics

### Creating an object name lumo which calculate all electron-phonon things for LUMO
lumo = ep.epfd(eigval_file = "lumo.dat",
             overlap_file = "lumo.overlap",
             degeneracy_cutoff = 0.002,
             output_prefix = "lumo"
               )
lumo.eigval_at_temp(T)   ### Calculating temperature dependent properties using Bose Einstein Statistics

### Calculation of electron-phonon gap renormalization for band edges
renorm_gap = lumo.renorm_eigval[:,0] - homo.renorm_eigval[:,-1]

### Calculation of electron-phonon renormalization as an average of degenerate orbitals, i.e., band centers
renorm_avg_homo = np.sum( homo.renorm_eigval,axis=1)/len(homo.renorm_eigval[0])
renorm_avg_lumo = np.sum( lumo.renorm_eigval,axis=1)/len(lumo.renorm_eigval[0])
renorm_avg_gap = renorm_avg_lumo - renorm_avg_homo

### concatenating renormalization for band-edge-gap and band-center-gap
gap = np.vstack((renorm_gap,renorm_avg_gap)).T

## Writing outputs for temperature dependent gap
header = ["Gap w sym breaking", "Gap w/o sym breaking"]
ep.write_temp_vs_energy( temp_grid = T, energy = gap, col_header = header, output_prefix = "gap" )

