import sys,os
from pyepfd.coord_util import *
from pyepfd.pyepfd_io import *

#usage python3 osrap.py phonon_info_file T

phonon_file=sys.argv[1]  # First command line argument; phonon file (.xml)
T=sys.argv[2]            # Second command line argument; Temperature 

# Below we store important phonon file data into sd_inp class.
# From this class we will have access to atoms, coordinates, dynamical matrix,
# acoustic sum rule (asr) etc.
sd_inp = read_pyepfd_info(file_path=phonon_file)

#Below we define an xyz output class using the full file path
#Note the file name would be 300K.xyz if the chosen T = 300
sd_xyz = xyz(file_path=str(T)+'K.xyz',io='w',atoms=sd_inp.atoms)


# Now we will move using stochastic displacement (algo = 'osrap')
sdmoves = ionic_mover( atoms = sd_inp.atoms, \
                       opt_coord = sd_inp.coord, \
                       mode = 'SD', \
                       algo ='osrap', \
                       ngrid = 500,\
                       dynmat = sd_inp.ref_dynmatrix, \
                       asr = sd_inp.asr, \
                       temperature = float(T) )

# After performing all displacements, we save them into the xyz trajectory file.
for j in range(sdmoves.disp_coord.shape[1]):
    sd_xyz.write(cell = sd_inp.cell,coord = sdmoves.disp_coord[:,j])

