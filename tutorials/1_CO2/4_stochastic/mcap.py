import sys,os
from pyepfd.coord_util import *
from pyepfd.pyepfd_io import *

#usage python3 mcap.py phonon_file T

phonon_file = sys.argv[1]
T = sys.argv[2]

sd_inp = read_pyepfd_info(file_path = phonon_file)

if sd_inp.ref_dynmatrix is not None:
    inp_dynmat = sd_inp.ref_dynmatrix
else:
    inp_dynmat = sd_inp.dynmatrix

# creating an xyz class to write the trajectory
sd_xyz = xyz(file_path=f'{T}K.xyz',io='w',atoms=sd_inp.atoms)

# Calling ionic mover class to perform Monte Carlo Antethetic Pair (MCAP) displacements
sdmoves = ionic_mover( atoms = sd_inp.atoms,
                       opt_coord = sd_inp.coord,
                       mode = 'SD',
                       algo ='mcap',
                       ngrid = 250,
                       dynmat = inp_dynmat,
                       asr = sd_inp.asr,
                       temperature = float(T))

for j in range(sdmoves.disp_coord.shape[1]):
    sd_xyz.write(cell = sd_inp.cell,coord = sdmoves.disp_coord[:,j])
del sd_xyz
