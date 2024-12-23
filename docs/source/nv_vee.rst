.. _tutorial:

Phonon Renormalizations of Vertical Excitation Energies 
=======================================================

For this tutorial we will use Quantum Espresso as a DFT solver
and WEST code for TDDFT calculations. 

The ground state phonon
were precomputed using finite displacement method using 
PhonoPy Code. Note, it could also be performed using PyEPFD,
as we did in exercise 1.1. However, the NV-center has a C\ :sub:`3v`
symmetry, which PhonoPy can exploit to reduce number of
DFT single-point calculations needed for obtaining the
phonon modes. Currently, phonon calculations using PyEPFD
cannot exploit symmetry.

After obtaining the phonon modes we would compute the 
stochastic displacements and perform DFT and TDDFT 
calculations using QE and WEST code.

Lets get started.


.. toctree::
   :maxdepth: 1

   tutorials/2_NV/1_nv216.ipynb

