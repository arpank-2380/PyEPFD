# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

"""
This module contains methods for parsing WEST outputs

..note:
    Currently only parsing TDDFT outputs is supported.
    In future further parsers would be developed.
"""


import sys,os,json,time
import numpy as np
import xml.etree.ElementTree as ET
from pyepfd.constants import *

def tddft_energy(frames,west_prefix,path='./'):
    """
    Parse the summary.json file from each folder and obtain the tddft energies

    Args:

        frames = A tuple or an integer of frame indices. 
                 If tuple then indices of (start, end) or (start, end, inc)
                 where inc in the increment

        west_prefix = A string that is same with west prefix used in 
        the WEST calculation

        path = path to the root directory where all frame calculations
        exists with directory name frame-1, frame-2 etc.

    Returns: TDDFT excitation energies (array) in eV 
    """
    init_time = time.time()
    try: 
        ntuple = len(frames)
        if  ntuple == 3: 
            start,end,inc = frames
        elif ntuple == 2: 
            start,end = frames; inc = 1 
        elif ntuple == 1: 
            start = frames; end = frames; inc = 1
        else:
            sys.exit("Length of frames tuple is %d."%ntuple+\
                     "Maximum allowed length of frames tuple is 3.")
    except TypeError:
        start = int(frames); end = int(frames); inc = 1
    
    if start < 1: sys.exit("Start frame index cannot be less than 1") 

    for frame in range(start,end+1,inc):
        json_file=open(path+'/frame-'+str(frame)+'/'+west_prefix+\
                '.wbse.save/'+'summary.json','r')
        data = json.load(json_file)
        #print("No of eigen:", data["plep"]["n_plep_eigen"])
        #print("Energy:", data["plep"]["eigenval"]) 
        if frame == start:
            energies = np.array( data["plep"]["eigenval"] ) 
        else:
            energies = np.vstack( (energies, 
                np.array(data["plep"]["eigenval"])) )
   
    energies /= ev2unit['Ry']        
    end_time = time.time()
    elapsed_time = end_time - init_time
    print( f"{west_prefix}: TDDFT energies for frames:"+\
           f" {frames} extracted in {elapsed_time} s.")
    return energies

