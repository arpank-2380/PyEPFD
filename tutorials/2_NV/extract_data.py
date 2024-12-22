import numpy as np
from pyepfd.coord_util import qe

simulation = qe(path = 'TDDFT', frames = (1,200),
                bands = (430,432), spin =2)

cell = simulation.cell
atoms = simulation.atoms
coords = simulation.coords
forces = simulation.forces
etotals = simulation.etotals

# Saving an .npz file for future reference
np.savez('NV216_DDH_300K.npz',
         cell = cell, atoms = atoms, coords = coords,
         forces = forces, etotals = etotals)

del simulation #Needed only within jupyter note book so that file writing is finished.
