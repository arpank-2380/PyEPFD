# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.
import sys,os, time
import numpy as np
from pyepfd.elph_classes import *
from pyepfd.pyepfd_io import *
from pyepfd.coord_util import *
from pyepfd.constants import *


"""
This script converts a FORCE_CONSTANT file generated by phonopy and
convert it into an pyepfd restart file (xml). 
The script must be run in the same directory where FORCE_CONSTANT file
is present and must use FULL_FORCE_CONSTANTS = .TRUE. for phonopy 
calculation so that phonopy prints the full force constants.

The script accepts atleast 2 mandatory command line arguments:
(1) full path to the optimized geometry file in XYZ format.
(2) full path to the pyepfd.xml file (output)
and an optional command-line argument:
(3) a frequency scale factor, in case you want to scale the
orca frequencies for your stochastic displacements.


Usage:
python phonopy2pyepfd.py path_to_opt_geometry.xyz path_to_pyepfd_restart.xml <freq_scale_factor>[optional]
"""

def fc_read(file_path='FORCE_CONSTANTS'):
    force_const = open(file_path,'r+').readlines()
    natoms = int(force_const[0].split()[0])
    satoms = int(force_const[0].split()[1])
    fc_unit_conv = 0.5 #Ry/Bohr^2 to Ha/Bohr^2
    if satoms is None:
       satoms = natoms     
    fcmatrix = np.zeros((3*natoms,3*satoms),np.float64)
    for i in range(natoms):
        for j in range(satoms):
            #print(i,j,4*i*satoms+4*j+3)
            fcmatrix[i*3,3*j:3*(j+1)] = np.array([float(x) for x in\
            force_const[4*i*satoms+4*j+2].split()] )
            fcmatrix[i*3+1,3*j:3*(j+1)] = np.array([float(x) for x in\
            force_const[4*i*satoms+4*j+3].split()] )
            fcmatrix[i*3+2,3*j:3*(j+1)] = np.array([float(x) for x in\
            force_const[4*i*satoms+4*j+4].split()] )
    del force_const
    fcmatrix =  fcmatrix * fc_unit_conv
    return fcmatrix

init_time = time.time()
if len(sys.argv) < 3:
   sys.exit("\033[91mUsage: python phonopy2pyepfd.py path_to_opt_geometry.xyz path_to_pyepfd_restart.xml <freq_scale_factor>[optional]") 

opt_xyz_file=sys.argv[1]
restart_file=sys.argv[2]
if len(sys.argv)==4:
    freq_scale = float(sys.argv[3])
else:
    freq_scale = 1.0

fcmatrix = fc_read()
opt = xyz(file_path=opt_xyz_file,io='r')
dynmatrix=np.copy(fcmatrix) 
for i in range(dynmatrix.shape[0]):
    for j in range(dynmatrix.shape[1]):
        dynmatrix[i,j] = fcmatrix[i,j]/np.sqrt(opt.mass[i] * opt.mass[j])

dynmatrix *= np.square(freq_scale)
dm=dm(dynmat=dynmatrix, mass=opt.mass)
dm.apply_asr(opt_coord = opt.coords[0], asr='crystal')

print("#Mode    Frequency(cm-1)")
for i in range(len(dm.refomega)):
    print(i+1, dm.refomega[i]*ha2unit['cm-1'])

write_pyepfd_info(inp_dynmat = None,\
   dynmat = dm.dynmatrix,\
   ref_dynmat = dm.refdynmatrix,\
   mass = opt.mass,atoms = opt.atoms,\
   opt_coord = opt.coords[0],\
   cell = opt.cell[0],\
   file_name=restart_file,\
   mode='fd',\
   deltax=0.019,\
   asr = 'crystal')

print(f"Successfully written {restart_file}.\n" +
"Change the values of <phonon mode>, <asr>, <deltax>, <deltae>, \n"+
"<ngrid> and <cell> if needed.")
final_time = time.time()
exec_time = final_time - init_time
print("Total time required (s): " + str(exec_time))

