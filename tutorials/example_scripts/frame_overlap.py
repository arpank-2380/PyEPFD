#!/usr/bin/env python3
import sys,os
sys.path.insert(0,'/home/arku/Work_UChicago/Code-developments/EPFD/pyepfd/src/overlap') #Enter path of the overlap directory
import overlap2 as ov

ov.overlap( ref_frame=0,
            directory = 'MD_orbitals/',
            orbital_space=[[430,431,432]],
            start_frame=5502,
            last_frame=8502,
            inc_frame=1000 )

