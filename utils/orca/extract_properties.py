# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.
"""
This script is an example of how orca Kohn-Sham eigenvalues can be extracted
and stored into a file.
"""

import sys, os
import numpy as np
from pyepfd.coord_util import *

"""
pattern is a python list of strings. It defines the first 2 column 
(as in orca output) of the orbital you want to extract.
spin is a python list too. 
spin =  0 defines the up channel and spin = 1 defines the down channel.
"""
pattern = ["109   1.0000", "110   1.0000", "111   0.0000", "109   0.0000"]
spin = [0,0,0,1]
frames = (1,200,1)

def extract_eigenvalue(filepath, index):
    """ Returns one eigenvalue in eV from an orca output"""
    value = grep(filepath, pattern[index], cols = 3)
    if value.ndim == 0:
       eigenvalue = float(value)
    else:
       eigenvalue = value[spin[index]]
    return eigenvalue

def extract_eigenvalues(root_dir, frames = (1,200,1), outfile='eigenvalues.dat'):
    """ 
    Returns eigenvalues of all frames and writes to outfile
    """
    print(f"Extracting eigenvalues of all frames in range: {frames} ...")
    if len(pattern) != len(spin):
       sys.exit("\033[91mLengths of pattern and spin must be same\033[00m")
    outfile_path = f"{root_dir}/{outfile}"
    outfile_obj = open(outfile_path,'w+')
    for i,element in enumerate(pattern):
        outfile_obj.write(f"#Col-{i} ==> Pattern: {element} Spin: {spin[i]}\n")
    for iframe in range(frames[0],frames[1]+1, frames[2]):
        filepath = f"{root_dir}/frame-{iframe}/orca-sp.out" 
        for i,element in enumerate(pattern):
            eigenvalue = extract_eigenvalue(filepath,i)
            outfile_obj.write(f" {eigenvalue:10.4f}  ")
            if i == len(pattern) - 1: outfile_obj.write("\n")
    print(f"\033[92mEigenvalues are written in {outfile_path}\033[00m")
    return 


def main():
    if len(sys.argv) == 2: root_dir = sys.argv[1]
    else: root_dir = './'
    extract_eigenvalues(root_dir = root_dir, frames = frames, outfile = "eigenvalues.dat")    

if __name__ == "__main__":
     main()
