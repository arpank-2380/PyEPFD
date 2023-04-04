#!/usr/bin/env python3
import sys,os
sys.path.insert(0,'/home/arpank/Scripts/pyepfd/src/overlap')
import overlap1 as ov
ov.nmode=174
ov.directory = 'cube_files.1/'
ov.orbital_space=[[66,67,68]]
overlap = ov.overlap()

