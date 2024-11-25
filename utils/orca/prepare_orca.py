# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

import sys,os, shutil
from pyepfd.coord_util import xyz

"""
This script prepares orca inputs for each frame from an XYZ
trajectory file from a stochastic calculation. 
It accepts 3 arguments: 
(1) full path to the xyz file,
(2) index of the last frame,
(3) Full path to a pre-prepared orca input file with coordinates supplied
by an XYZ file name (dummy).
usage: python prepare_orca.py <xyz_path>  <last_frame_index> <path_to_orca.inp>

Example orca.inp:

!B3LYP D3 DEF2-TZVP

%pal
nprocs 48
end

%maxcore 14000

*xyzfile 0 3 geom.xyz
    
"""
if len(sys.argv) != 4:
   sys.exit("\033[91mUsage: python prepare_orca.py <trajectory.xyz>" +\
           " <last_frame_index> <path_to_orca.inp>\033[00m")

traj_path = sys.argv[1]
last_frame_index = int(sys.argv[2])
orca_input = sys.argv[3]

print("-----------------------------------------------------------------")
print(f"Preparing orca inputs using first {last_frame_index} frames.\n"+\
       f"Trajectory: {traj_path}\nOrca input: {orca_input}")
print("-----------------------------------------------------------------")

# parsing orca_input to obtain geom_file name:
geom_file = None
print(f"Reading {orca_input}")
with open(orca_input, "r") as file:
    for line in file:
        # Check if the line contains "*xyzfile"
        if line.strip().startswith("*xyzfile"):
            # Extract the last element (geometry file name) using split
            geom_file = line.strip().split()[-1]
            break

if geom_file is None:
    print(f"*xyzfile not found in {orca_input}.")
print(f"Reading {traj_path}")
trajectory =  xyz(file_path=traj_path,io='r')

if last_frame_index > trajectory.nframes:
   sys.exit("\033[91mInput last frame index is larger than the total number of frames.\033[00m")

for i in range(1,last_frame_index+1):
    sub_dir = f"frame-{i}/"
    if not os.path.isdir(sub_dir): os.makedirs(sub_dir)
    print(f"Preparing orca inputs for frame-{i}") 
    tmp_xyz = xyz(file_path=sub_dir+geom_file,io='w',atoms=trajectory.atoms)
    tmp_xyz.write(cell = trajectory.cell[i-1],coord = trajectory.coords[i-1])
    shutil.copy(orca_input, sub_dir)
    del(tmp_xyz) 
