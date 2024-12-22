import sys,os
import numpy as np
from pyepfd.west_util import tddft_energy
from pyepfd.constants import *


ev2mev = 1000


# Energies of the optimized GS geometry
singlet_0 = np.array([
      0.11141222885296939E-1,
      0.60939419639036742E-1,
      0.60945316008269398E-1,
      0.15486512004137221E+0
    ]) / ev2unit['Ry']


triplet_0 = np.array([
      0.17576134841668695E+0,
      0.1757629043174222E+0
    ]) / ev2unit['Ry']

# Obtaining tddft energies of each frame
singlet = tddft_energy( path = 'TDDFT',
                        west_prefix = 'singlet',
                        frames = (1,200) )

triplet = tddft_energy( path = 'TDDFT',
                        west_prefix = 'triplet',
                        frames = (1,200) )


## singlet renormalizations
# The first value is related to ms=0 state of the triplet state;
# therefore we are subtracting this value as it should be 0.

singlet_e_low = (singlet[:,1] - singlet[:,0] - singlet_0[1] + singlet_0[0])  * ev2mev
singlet_e_high = (singlet[:,2] - singlet[:,0] - singlet_0[2] + singlet_0[0]) * ev2mev
singlet_a = (singlet[:,3] - singlet[:,0] - singlet_0[3] + singlet_0[0]) * ev2mev

## triplet renormalizations for each frames
triplet_e_low = (triplet[:,0] - triplet_0[0])   * ev2mev
triplet_e_high = (triplet[:,1] - triplet_0[1])  * ev2mev

## writing data in files
singlet_out = open('singlet_renorm.dat','w+')
triplet_out = open('triplet_renorm.dat','w+')
singlet_out.write('#    1E(low)     1E(High)     1A1    all in meV\n') 
triplet_out.write('#    3E(low)     3E(High)  all in meV\n')

for frame in range(len(singlet_e_low)):
    singlet_out.write(' %10.2f  %10.2f  %10.2f\n'\
	%(singlet_e_low[frame],singlet_e_high[frame],singlet_a[frame]))
    triplet_out.write(' %10.2f  %10.2f  \n'\
        %(triplet_e_low[frame],triplet_e_high[frame]))

singlet_out.close()
triplet_out.close()

