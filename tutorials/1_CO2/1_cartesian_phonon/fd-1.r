<?xml version="1.0" encoding="UTF-8"?>
<fpmd:simulation xmlns:fpmd="http://www.quantum-simulation.org/ns/fpmd/fpmd-1.0">

                   ============================
                   I qbox rel1_75_0           I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I                          I
                   I http://qboxcode.org      I
                   ============================


<release> rel1_75_0 midway-mklfftw3  </release>
<user> arpank </user>
<sysname> Linux </sysname>
<nodename> midway2-0594.rcc.local </nodename>
<start_time> 2023-01-06T23:12:05Z </start_time>
 MPIdata::comm: 20x1x1x1
<mpi_processes count="20">
<process id="0"> midway2-0594.rcc.local </process> (0,0,0,0)
<process id="1"> midway2-0594.rcc.local </process> (1,0,0,0)
<process id="2"> midway2-0594.rcc.local </process> (2,0,0,0)
<process id="3"> midway2-0594.rcc.local </process> (3,0,0,0)
<process id="4"> midway2-0594.rcc.local </process> (4,0,0,0)
<process id="5"> midway2-0594.rcc.local </process> (5,0,0,0)
<process id="6"> midway2-0594.rcc.local </process> (6,0,0,0)
<process id="7"> midway2-0594.rcc.local </process> (7,0,0,0)
<process id="8"> midway2-0594.rcc.local </process> (8,0,0,0)
<process id="9"> midway2-0594.rcc.local </process> (9,0,0,0)
<process id="10"> midway2-0594.rcc.local </process> (10,0,0,0)
<process id="11"> midway2-0594.rcc.local </process> (11,0,0,0)
<process id="12"> midway2-0594.rcc.local </process> (12,0,0,0)
<process id="13"> midway2-0594.rcc.local </process> (13,0,0,0)
<process id="14"> midway2-0594.rcc.local </process> (14,0,0,0)
<process id="15"> midway2-0594.rcc.local </process> (15,0,0,0)
<process id="16"> midway2-0594.rcc.local </process> (16,0,0,0)
<process id="17"> midway2-0594.rcc.local </process> (17,0,0,0)
<process id="18"> midway2-0594.rcc.local </process> (18,0,0,0)
<process id="19"> midway2-0594.rcc.local </process> (19,0,0,0)
</mpi_processes>
<omp_max_threads> 1 </omp_max_threads>
[qbox] <cmd> set xc B3LYP </cmd>
[qbox] <cmd> set wf_dyn PSDA </cmd>
[qbox] <cmd> set ecut  50.00</cmd>
[qbox] <cmd> set scf_tol 1.00e-12</cmd>
[qbox] <cmd> species  O_species ../../pseudos/O_ONCV_PBE-1.0.xml</cmd>
  SpeciesCmd: defining species O_species as ../../pseudos/O_ONCV_PBE-1.0.xml

Warning at file , line 0, char 0
  Message: unable to open primary document entity '/project2/gagalli/arpank/pyepfd_examples/pseudos/species.xsd'

 species O_species:
<species name="O_species">
 <description>


 This pseudopotential file has been produced using the code
 ONCVPSP  (Optimized Norm-Conservinng Vanderbilt PSeudopotential)
 scalar-relativistic version 2.1.1, 03/26/2014 by D. R. Hamann
 The code is available through a link at URL www.mat-simresearch.com.
 Documentation with the package provides a full discription of the
 input data below.


 While it is not required under the terms of the GNU GPL, it is
 suggested that you cite D. R. Hamann, Phys. Rev. B 88, 085117 (2013)
 in any publication using these pseudopotentials.


 Copyright 2015 The Regents of the University of California
 
 This work is licensed under the Creative Commons Attribution-ShareAlike 
 4.0 International License. To view a copy of this license, visit 
 http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to 
 Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
 
 This pseudopotential is part of the Schlipf-Gygi norm-conserving 
 pseudopotential library. Its construction parameters were tuned to 
 reproduce materials of a training set with very high accuracy and 
 should be suitable as a general purpose pseudopotential to treat a 
 variety of different compounds. For details of the construction and 
 testing of the pseudopotential please refer to:
 
 M. Schlipf, F. Gygi, Comp. Phys. Comm. 196, 36 (2015)
 http://dx.doi.org/10.1016/j.cpc.2015.05.011
 
 We kindly ask that you include this reference in all publications 
 associated to this pseudopotential.


Input file for PP generation:

# ATOM AND REFERENCE CONFIGURATION
# atsym  z    nc    nv    iexc   psfile
  O  8.00     1     2     4      fpmd
#
#   n    l    f        energy (Ha)
    1    0    2.00
    2    0    2.00
    2    1    4.00
#
# PSEUDOPOTENTIAL AND OPTIMIZATION
# lmax
    1
#
#   l,   rc,     ep,   ncon, nbas, qcut
    0   1.29195  -0.88057    5    8   8.98916
    1   1.47310  -0.33187    5    8   9.14990
#
# LOCAL POTENTIAL
# lloc, lpopt,  rc(5),   dvloc0
    4    5   0.90330      0.00000
#
# VANDERBILT-KLEINMAN-BYLANDER PROJECTORs
# l, nproj, debl
    0    2   1.51851
    1    2   1.53631
#
# MODEL CORE CHARGE
# icmod, fcfact
    0   0.00000
#
# LOG DERIVATIVE ANALYSIS
# epsh1, epsh2, depsh
   -5.00    3.00    0.02
#
# OUTPUT GRID
# rlmax, drl
    6.00    0.01
#
# TEST CONFIGURATIONS
# ncnf
    0
# nvcnf
#   n    l    f
 </description>
 <symbol>O</symbol>
 <atomic_number>8</atomic_number>
 <mass>15.999</mass>
 <norm_conserving_semilocal_pseudopotential>
 <valence_charge>6</valence_charge>
 <mesh_spacing>0.01</mesh_spacing>
 </norm_conserving_semilocal_pseudopotential>
</species>
 SLPP semilocal potential
 rcps_ =   1.5
[qbox] <cmd> species  C_species ../../pseudos/C_ONCV_PBE-1.0.xml</cmd>
  SpeciesCmd: defining species C_species as ../../pseudos/C_ONCV_PBE-1.0.xml

Warning at file , line 0, char 0
  Message: unable to open primary document entity '/project2/gagalli/arpank/pyepfd_examples/pseudos/species.xsd'

 species C_species:
<species name="C_species">
 <description>


 This pseudopotential file has been produced using the code
 ONCVPSP  (Optimized Norm-Conservinng Vanderbilt PSeudopotential)
 scalar-relativistic version 2.1.1, 03/26/2014 by D. R. Hamann
 The code is available through a link at URL www.mat-simresearch.com.
 Documentation with the package provides a full discription of the
 input data below.


 While it is not required under the terms of the GNU GPL, it is
 suggested that you cite D. R. Hamann, Phys. Rev. B 88, 085117 (2013)
 in any publication using these pseudopotentials.


 Copyright 2015 The Regents of the University of California
 
 This work is licensed under the Creative Commons Attribution-ShareAlike 
 4.0 International License. To view a copy of this license, visit 
 http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to 
 Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
 
 This pseudopotential is part of the Schlipf-Gygi norm-conserving 
 pseudopotential library. Its construction parameters were tuned to 
 reproduce materials of a training set with very high accuracy and 
 should be suitable as a general purpose pseudopotential to treat a 
 variety of different compounds. For details of the construction and 
 testing of the pseudopotential please refer to:
 
 M. Schlipf, F. Gygi, Comp. Phys. Comm. 196, 36 (2015)
 http://dx.doi.org/10.1016/j.cpc.2015.05.011
 
 We kindly ask that you include this reference in all publications 
 associated to this pseudopotential.


Input file for PP generation:

# ATOM AND REFERENCE CONFIGURATION
# atsym  z    nc    nv    iexc   psfile
  C  6.00     1     2     4      fpmd
#
#   n    l    f        energy (Ha)
    1    0    2.00
    2    0    2.00
    2    1    2.00
#
# PSEUDOPOTENTIAL AND OPTIMIZATION
# lmax
    1
#
#   l,   rc,     ep,   ncon, nbas, qcut
    0   1.42330  -0.50533    5    8   6.97628
    1   1.38975  -0.19424    5    8   8.59046
#
# LOCAL POTENTIAL
# lloc, lpopt,  rc(5),   dvloc0
    4    5   0.82223      0.00000
#
# VANDERBILT-KLEINMAN-BYLANDER PROJECTORs
# l, nproj, debl
    0    2   1.09624
    1    2   1.27170
#
# MODEL CORE CHARGE
# icmod, fcfact
    0   0.00000
#
# LOG DERIVATIVE ANALYSIS
# epsh1, epsh2, depsh
   -5.00    3.00    0.02
#
# OUTPUT GRID
# rlmax, drl
    6.00    0.01
#
# TEST CONFIGURATIONS
# ncnf
    0
# nvcnf
#   n    l    f
 </description>
 <symbol>C</symbol>
 <atomic_number>6</atomic_number>
 <mass>12.011</mass>
 <norm_conserving_semilocal_pseudopotential>
 <valence_charge>4</valence_charge>
 <mesh_spacing>0.01</mesh_spacing>
 </norm_conserving_semilocal_pseudopotential>
</species>
 SLPP semilocal potential
 rcps_ =   1.5
[qbox] <cmd># Frame 1/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
[qbox] <cmd> atom   O1   O_species     0.000000       0.000000       2.186664</cmd>
[qbox] <cmd> atom   O2   O_species     0.000000       0.000000      -2.186661</cmd>
[qbox] <cmd> atom   C3   C_species     0.000000       0.000000      -0.000003</cmd>
[qbox] <cmd> randomize_wf</cmd>
[qbox] <cmd> run -atomic_density 0 100 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  91.26709881 </eigenvalue_sum>
  <eigenvalue_sum>  57.53410692 </eigenvalue_sum>
  <eigenvalue_sum>  27.09794988 </eigenvalue_sum>
  <eigenvalue_sum>  9.51291528 </eigenvalue_sum>
  <eigenvalue_sum>  3.49361312 </eigenvalue_sum>
  <eigenvalue_sum>  0.34767974 </eigenvalue_sum>
  <eigenvalue_sum>  0.32690098 </eigenvalue_sum>
  <eigenvalue_sum>  -0.43418007 </eigenvalue_sum>
  <eigenvalue_sum>  -0.83198322 </eigenvalue_sum>
  <eigenvalue_sum>  -1.18100087 </eigenvalue_sum>
  <etotal_int>     -26.86585347 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -3.82539211 </eigenvalue_sum>
  <eigenvalue_sum>  -4.53060265 </eigenvalue_sum>
  <eigenvalue_sum>  -5.66822713 </eigenvalue_sum>
  <eigenvalue_sum>  -6.38297016 </eigenvalue_sum>
  <eigenvalue_sum>  -6.93937541 </eigenvalue_sum>
  <eigenvalue_sum>  -7.45072987 </eigenvalue_sum>
  <eigenvalue_sum>  -7.91863344 </eigenvalue_sum>
  <eigenvalue_sum>  -8.40619964 </eigenvalue_sum>
  <eigenvalue_sum>  -8.95449655 </eigenvalue_sum>
  <eigenvalue_sum>  -9.52513493 </eigenvalue_sum>
  <etotal_int>     -32.56342681 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -10.24813484 </eigenvalue_sum>
  <eigenvalue_sum>  -10.83603117 </eigenvalue_sum>
  <eigenvalue_sum>  -11.59979613 </eigenvalue_sum>
  <eigenvalue_sum>  -11.94470108 </eigenvalue_sum>
  <eigenvalue_sum>  -12.14291165 </eigenvalue_sum>
  <eigenvalue_sum>  -12.25889086 </eigenvalue_sum>
  <eigenvalue_sum>  -12.32557706 </eigenvalue_sum>
  <eigenvalue_sum>  -12.36523527 </eigenvalue_sum>
  <eigenvalue_sum>  -12.36795724 </eigenvalue_sum>
  <eigenvalue_sum>  -12.39416050 </eigenvalue_sum>
  <etotal_int>     -38.89511246 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -13.24733073 </eigenvalue_sum>
  <eigenvalue_sum>  -13.30998186 </eigenvalue_sum>
  <eigenvalue_sum>  -13.45960161 </eigenvalue_sum>
  <eigenvalue_sum>  -13.55364055 </eigenvalue_sum>
  <eigenvalue_sum>  -13.69338790 </eigenvalue_sum>
  <eigenvalue_sum>  -13.78987824 </eigenvalue_sum>
  <eigenvalue_sum>  -13.83120793 </eigenvalue_sum>
  <eigenvalue_sum>  -13.84733056 </eigenvalue_sum>
  <eigenvalue_sum>  -13.85270142 </eigenvalue_sum>
  <eigenvalue_sum>  -13.85414581 </eigenvalue_sum>
  <etotal_int>     -40.95261833 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -13.53484818 </eigenvalue_sum>
  <eigenvalue_sum>  -13.53916765 </eigenvalue_sum>
  <eigenvalue_sum>  -13.54456061 </eigenvalue_sum>
  <eigenvalue_sum>  -13.54555199 </eigenvalue_sum>
  <eigenvalue_sum>  -13.54623506 </eigenvalue_sum>
  <eigenvalue_sum>  -13.54637507 </eigenvalue_sum>
  <etotal_int>     -40.95575415 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -14.87954814 </eigenvalue_sum>
  <eigenvalue_sum>  -14.88670592 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89288002 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89379729 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89432625 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89443746 </eigenvalue_sum>
  <etotal_int>     -42.11408562 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.59459376 </eigenvalue_sum>
  <eigenvalue_sum>  -6.81407872 </eigenvalue_sum>
  <eigenvalue_sum>  -7.06944837 </eigenvalue_sum>
  <eigenvalue_sum>  -7.11174533 </eigenvalue_sum>
  <eigenvalue_sum>  -7.15236369 </eigenvalue_sum>
  <eigenvalue_sum>  -7.15996031 </eigenvalue_sum>
  <eigenvalue_sum>  -7.16776223 </eigenvalue_sum>
  <eigenvalue_sum>  -7.16953954 </eigenvalue_sum>
  <eigenvalue_sum>  -7.17130352 </eigenvalue_sum>
  <eigenvalue_sum>  -7.17172069 </eigenvalue_sum>
  <etotal_int>     -37.57393165 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.70438590 </eigenvalue_sum>
  <eigenvalue_sum>  -5.75156846 </eigenvalue_sum>
  <eigenvalue_sum>  -5.81207235 </eigenvalue_sum>
  <eigenvalue_sum>  -5.82489261 </eigenvalue_sum>
  <eigenvalue_sum>  -5.83746017 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84037004 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84260184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84316728 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84352619 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84360431 </eigenvalue_sum>
  <etotal_int>     -37.58842658 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.52786165 </eigenvalue_sum>
  <eigenvalue_sum>  -6.53522668 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54243872 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54390095 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54517050 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54556280 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54588230 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54600087 </eigenvalue_sum>
  <etotal_int>     -37.57120546 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.18804764 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18864381 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18927055 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18942353 </eigenvalue_sum>
  <etotal_int>     -37.54914883 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.72329749 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72388833 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72458624 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72473498 </eigenvalue_sum>
  <etotal_int>     -37.53074783 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.65344902 </eigenvalue_sum>
  <eigenvalue_sum>  -5.65349781 </eigenvalue_sum>
  <etotal_int>     -37.52843472 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.45906725 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45924934 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45945381 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45950463 </eigenvalue_sum>
  <etotal_int>     -37.52578791 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.39046123 </eigenvalue_sum>
  <eigenvalue_sum>  -5.39050735 </eigenvalue_sum>
  <etotal_int>     -37.52517828 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.30207849 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30217725 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30231007 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30234281 </eigenvalue_sum>
  <etotal_int>     -37.52615687 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29551559 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29552803 </eigenvalue_sum>
  <etotal_int>     -37.52633497 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28385314 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28390569 </eigenvalue_sum>
  <etotal_int>     -37.52700208 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26957650 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26958378 </eigenvalue_sum>
  <etotal_int>     -37.52733645 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.25659072 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25662328 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25666019 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25666889 </eigenvalue_sum>
  <etotal_int>     -37.52780123 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26197254 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26198276 </eigenvalue_sum>
  <etotal_int>     -37.52773861 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26694399 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26695317 </eigenvalue_sum>
  <etotal_int>     -37.52784882 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26849743 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26849903 </eigenvalue_sum>
  <etotal_int>     -37.52792523 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27108304 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27108619 </eigenvalue_sum>
  <etotal_int>     -37.52795719 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27361597 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27361615 </eigenvalue_sum>
  <etotal_int>     -37.52796422 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27600156 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27600190 </eigenvalue_sum>
  <etotal_int>     -37.52796782 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27835290 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27835303 </eigenvalue_sum>
  <etotal_int>     -37.52797127 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27834117 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27834119 </eigenvalue_sum>
  <etotal_int>     -37.52797651 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28250556 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28250626 </eigenvalue_sum>
  <etotal_int>     -37.52799162 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28264315 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28264322 </eigenvalue_sum>
  <etotal_int>     -37.52798905 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28254016 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28254030 </eigenvalue_sum>
  <etotal_int>     -37.52798917 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28395489 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28395494 </eigenvalue_sum>
  <etotal_int>     -37.52799071 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28539335 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28539343 </eigenvalue_sum>
  <etotal_int>     -37.52798574 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28600962 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28600963 </eigenvalue_sum>
  <etotal_int>     -37.52798908 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28597411 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28597425 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28597439 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28597443 </eigenvalue_sum>
  <etotal_int>     -37.52800205 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28643978 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28643986 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28643991 </eigenvalue_sum>
  <etotal_int>     -37.52799857 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28643318 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28643322 </eigenvalue_sum>
  <etotal_int>     -37.52800066 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28638395 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28638398 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28638399 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28638400 </eigenvalue_sum>
  <etotal_int>     -37.52800510 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28607637 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28607640 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28607642 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28607642 </eigenvalue_sum>
  <etotal_int>     -37.52800557 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28601389 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601390 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601390 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601390 </eigenvalue_sum>
  <etotal_int>     -37.52800760 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28602164 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28602164 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28602165 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28602165 </eigenvalue_sum>
  <etotal_int>     -37.52800900 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28601432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28601432 </eigenvalue_sum>
  <etotal_int>     -37.52801048 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28594090 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28594091 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28594091 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28594091 </eigenvalue_sum>
  <etotal_int>     -37.52801284 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28595196 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28595196 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28595196 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28595196 </eigenvalue_sum>
  <etotal_int>     -37.52801119 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28583955 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28583956 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28583957 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28583957 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28583957 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28583957 </eigenvalue_sum>
  <etotal_int>     -37.52801027 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28590576 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590577 </eigenvalue_sum>
  <etotal_int>     -37.52801210 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28590230 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590230 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590230 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590230 </eigenvalue_sum>
  <etotal_int>     -37.52801270 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28587470 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587470 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587470 </eigenvalue_sum>
  <etotal_int>     -37.52801281 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28585169 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28585169 </eigenvalue_sum>
  <etotal_int>     -37.52801288 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28570698 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570699 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570699 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570699 </eigenvalue_sum>
  <etotal_int>     -37.52801303 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28581251 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28581251 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28581251 </eigenvalue_sum>
  <etotal_int>     -37.52801311 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28581857 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28581858 </eigenvalue_sum>
  <etotal_int>     -37.52801316 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28579474 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28579474 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567927 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567927 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567927 </eigenvalue_sum>
  <etotal_int>     -37.52801321 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567517 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567517 </eigenvalue_sum>
  <etotal_int>     -37.52801326 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567571 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567571 </eigenvalue_sum>
  <etotal_int>     -37.52801336 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567562 </eigenvalue_sum>
  <etotal_int>     -37.52801337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567656 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567656 </eigenvalue_sum>
  <etotal_int>     -37.52801337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567717 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567717 </eigenvalue_sum>
  <etotal_int>     -37.52801338 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567781 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567781 </eigenvalue_sum>
  <etotal_int>     -37.52801337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567738 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567738 </eigenvalue_sum>
  <etotal_int>     -37.52801338 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567814 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567814 </eigenvalue_sum>
  <etotal_int>     -37.52801337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567861 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567861 </eigenvalue_sum>
  <etotal_int>     -37.52801337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568002 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568002 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568010 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568010 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567996 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567996 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568000 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568000 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567990 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567990 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567965 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567965 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567977 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567977 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567974 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567974 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567955 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567955 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567942 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567942 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567937 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567937 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567935 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567935 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567922 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567922 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567928 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567928 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567927 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567927 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567919 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567919 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567914 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567914 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567912 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567912 </eigenvalue_sum>
  <etotal_int>     -37.52801335 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96973234 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48928033 </eps>
  <enl>         -0.99531907 </enl>
  <ecoul>      -17.38356814 </ecoul>
  <exc>         -8.62957814 </exc>
  <esr>          3.21002195 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801335 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801335 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00000000 -0.00072596 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00000000 0.00071765 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00000000 0.00000814 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="24.758" max="24.759"/>
</iteration>
<timing name="charge"          min="0.589" max="0.629"/>
<timing name="energy"          min="3.084" max="3.273"/>
<timing name="ortho_align"     min="0.105" max="0.115"/>
<timing name="psda_prec"       min="0.010" max="0.011"/>
<timing name="psda_residual"   min="0.028" max="0.098"/>
<timing name="psda_update_wf"  min="0.030" max="0.040"/>
<timing name="update_vhxc"     min="20.267" max="20.454"/>
<timing name="wf_update"       min="0.201" max="0.270"/>
<timing name="ekin"            min="0.020" max="0.207"/>
<timing name="exc"             min="20.163" max="20.169"/>
<timing name="hpsi"            min="2.140" max="2.156"/>
<timing name="nonlocal"        min="0.902" max="0.916"/>
<timing name="charge_compute"  min="0.030" max="0.370"/>
<timing name="charge_integral" min="0.049" max="0.616"/>
<timing name="charge_rowsum"   min="0.000" max="0.017"/>
<timing name="charge_vft"      min="0.150" max="0.189"/>
[qbox] <cmd># Frame 2/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.005000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00500000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28527250 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556164 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569470 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570636 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571053 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571113 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571191 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571217 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571232 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28571236 </eigenvalue_sum>
  <etotal_int>     -37.52811363 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568811 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568945 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569049 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569060 </eigenvalue_sum>
  <etotal_int>     -37.52803301 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565272 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565727 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566118 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566162 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566209 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566223 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566235 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566237 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566238 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566238 </eigenvalue_sum>
  <etotal_int>     -37.52798852 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563135 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563139 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563142 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563142 </eigenvalue_sum>
  <etotal_int>     -37.52799162 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560850 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560852 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560853 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560853 </eigenvalue_sum>
  <etotal_int>     -37.52799319 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557850 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557853 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557854 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557855 </eigenvalue_sum>
  <etotal_int>     -37.52799521 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558930 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558933 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558934 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558934 </eigenvalue_sum>
  <etotal_int>     -37.52799623 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559516 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559517 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559517 </eigenvalue_sum>
  <etotal_int>     -37.52799797 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561101 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561104 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561106 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561106 </eigenvalue_sum>
  <etotal_int>     -37.52800397 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561519 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561520 </eigenvalue_sum>
  <etotal_int>     -37.52800494 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562454 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562455 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562456 </eigenvalue_sum>
  <etotal_int>     -37.52800681 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563265 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563266 </eigenvalue_sum>
  <etotal_int>     -37.52800804 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565460 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565461 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565463 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565463 </eigenvalue_sum>
  <etotal_int>     -37.52801065 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565458 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565459 </eigenvalue_sum>
  <etotal_int>     -37.52801107 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566018 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566018 </eigenvalue_sum>
  <etotal_int>     -37.52801207 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566323 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566324 </eigenvalue_sum>
  <etotal_int>     -37.52801257 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566978 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566978 </eigenvalue_sum>
  <etotal_int>     -37.52801313 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567008 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567009 </eigenvalue_sum>
  <etotal_int>     -37.52801325 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567170 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567170 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567251 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567251 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567340 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567340 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567528 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567520 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567520 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567526 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567526 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567552 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567552 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567599 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567599 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567600 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567600 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567622 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567622 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567629 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567629 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567627 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567627 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567626 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567626 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972120 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925416 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358656 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00500000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00003098 0.00000000 -0.00072068 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00019531 0.00000000 0.00071788 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00038884 0.00000000 0.00001303 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="12.182" max="12.187"/>
</iteration>
<timing name="charge"          min="0.295" max="0.317"/>
<timing name="energy"          min="1.289" max="1.383"/>
<timing name="ortho_align"     min="0.043" max="0.048"/>
<timing name="psda_prec"       min="0.004" max="0.005"/>
<timing name="psda_residual"   min="0.012" max="0.041"/>
<timing name="psda_update_wf"  min="0.013" max="0.016"/>
<timing name="update_vhxc"     min="10.219" max="10.312"/>
<timing name="wf_update"       min="0.083" max="0.111"/>
<timing name="ekin"            min="0.008" max="0.101"/>
<timing name="exc"             min="10.166" max="10.170"/>
<timing name="hpsi"            min="0.895" max="0.902"/>
<timing name="nonlocal"        min="0.376" max="0.382"/>
<timing name="charge_compute"  min="0.016" max="0.185"/>
<timing name="charge_integral" min="0.022" max="0.293"/>
<timing name="charge_rowsum"   min="0.000" max="0.009"/>
<timing name="charge_vft"      min="0.076" max="0.097"/>
[qbox] <cmd># Frame 3/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to       -0.005000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to -0.00500000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28411775 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28527409 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28580610 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28585294 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28586960 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587200 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587511 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587678 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587693 </eigenvalue_sum>
  <etotal_int>     -37.52841473 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28577654 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28578184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28578594 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28578635 </eigenvalue_sum>
  <etotal_int>     -37.52810573 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28550908 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28552721 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554283 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554459 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554646 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554700 </eigenvalue_sum>
  <etotal_int>     -37.52795890 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555717 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555748 </eigenvalue_sum>
  <etotal_int>     -37.52796730 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28553078 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553088 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553097 </eigenvalue_sum>
  <etotal_int>     -37.52796978 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28547198 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547205 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547210 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547211 </eigenvalue_sum>
  <etotal_int>     -37.52797572 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28547498 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547505 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547510 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547511 </eigenvalue_sum>
  <etotal_int>     -37.52798085 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28548916 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28548920 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28548921 </eigenvalue_sum>
  <etotal_int>     -37.52798593 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555342 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555348 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555352 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555353 </eigenvalue_sum>
  <etotal_int>     -37.52799767 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555799 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555801 </eigenvalue_sum>
  <etotal_int>     -37.52800100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557472 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557473 </eigenvalue_sum>
  <etotal_int>     -37.52800367 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558994 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558995 </eigenvalue_sum>
  <etotal_int>     -37.52800571 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563211 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563214 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563216 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563217 </eigenvalue_sum>
  <etotal_int>     -37.52800856 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563491 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563491 </eigenvalue_sum>
  <etotal_int>     -37.52800912 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564600 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564601 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564601 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564601 </eigenvalue_sum>
  <etotal_int>     -37.52801032 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565380 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565380 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565380 </eigenvalue_sum>
  <etotal_int>     -37.52801115 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566599 </eigenvalue_sum>
  <etotal_int>     -37.52801227 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566528 </eigenvalue_sum>
  <etotal_int>     -37.52801268 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566774 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566774 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566980 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566980 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567612 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567612 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567434 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567434 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567432 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567544 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567544 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567712 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567712 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567696 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567696 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567643 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567643 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567675 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567675 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567704 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567704 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567680 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567680 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567642 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567642 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567652 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567652 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567654 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567654 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567642 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567642 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567622 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567622 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567616 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567616 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567607 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567607 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567616 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567616 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567619 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567619 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972120 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925418 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358655 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> -0.00500000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00003098 -0.00000000 -0.00072067 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00019532 -0.00000000 0.00071787 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00038884 -0.00000000 0.00001305 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="13.611" max="13.616"/>
</iteration>
<timing name="charge"          min="0.332" max="0.356"/>
<timing name="energy"          min="1.377" max="1.483"/>
<timing name="ortho_align"     min="0.046" max="0.052"/>
<timing name="psda_prec"       min="0.005" max="0.005"/>
<timing name="psda_residual"   min="0.012" max="0.043"/>
<timing name="psda_update_wf"  min="0.013" max="0.017"/>
<timing name="update_vhxc"     min="11.483" max="11.588"/>
<timing name="wf_update"       min="0.089" max="0.118"/>
<timing name="ekin"            min="0.008" max="0.114"/>
<timing name="exc"             min="11.424" max="11.429"/>
<timing name="hpsi"            min="0.958" max="0.966"/>
<timing name="nonlocal"        min="0.399" max="0.406"/>
<timing name="charge_compute"  min="0.018" max="0.208"/>
<timing name="charge_integral" min="0.025" max="0.328"/>
<timing name="charge_rowsum"   min="0.000" max="0.010"/>
<timing name="charge_vft"      min="0.085" max="0.109"/>
[qbox] <cmd># Frame 4/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.005000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00500000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28489690 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547518 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574130 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576463 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577294 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577412 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577567 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577619 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577650 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577657 </eigenvalue_sum>
  <etotal_int>     -37.52821400 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28571813 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572079 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572286 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572306 </eigenvalue_sum>
  <etotal_int>     -37.52805736 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564177 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565100 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565887 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565975 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566068 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566094 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566117 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566122 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566124 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566125 </eigenvalue_sum>
  <etotal_int>     -37.52798036 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562217 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562229 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562230 </eigenvalue_sum>
  <etotal_int>     -37.52798223 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558542 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558548 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558550 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558550 </eigenvalue_sum>
  <etotal_int>     -37.52798403 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28552832 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28552838 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28552841 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28552841 </eigenvalue_sum>
  <etotal_int>     -37.52798828 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554857 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554864 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554867 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554867 </eigenvalue_sum>
  <etotal_int>     -37.52799148 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556142 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556146 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556147 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556147 </eigenvalue_sum>
  <etotal_int>     -37.52799384 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559918 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559921 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559924 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559924 </eigenvalue_sum>
  <etotal_int>     -37.52800221 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560331 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560333 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560333 </eigenvalue_sum>
  <etotal_int>     -37.52800448 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561425 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561425 </eigenvalue_sum>
  <etotal_int>     -37.52800630 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562726 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562727 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562727 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562727 </eigenvalue_sum>
  <etotal_int>     -37.52800742 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566222 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566224 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566225 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566225 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566226 </eigenvalue_sum>
  <etotal_int>     -37.52800935 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565977 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565977 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565977 </eigenvalue_sum>
  <etotal_int>     -37.52800984 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566197 </eigenvalue_sum>
  <etotal_int>     -37.52801139 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566519 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566519 </eigenvalue_sum>
  <etotal_int>     -37.52801202 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567223 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567223 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567223 </eigenvalue_sum>
  <etotal_int>     -37.52801299 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567136 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567136 </eigenvalue_sum>
  <etotal_int>     -37.52801314 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567069 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567069 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567242 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567242 </eigenvalue_sum>
  <etotal_int>     -37.52801330 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567726 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567726 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567567 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567567 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567465 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567465 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567566 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567566 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567702 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567702 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567669 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567669 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567609 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567609 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567639 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567639 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567675 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567675 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567651 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567651 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567632 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567632 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567645 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567645 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567630 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567630 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567625 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567621 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567618 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972119 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925415 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358656 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00500000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000002 -0.00003099 -0.00072068 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000002 -0.00019532 0.00071788 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000001 0.00038884 0.00001303 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="13.179" max="13.185"/>
</iteration>
<timing name="charge"          min="0.319" max="0.342"/>
<timing name="energy"          min="1.472" max="1.573"/>
<timing name="ortho_align"     min="0.049" max="0.054"/>
<timing name="psda_prec"       min="0.005" max="0.005"/>
<timing name="psda_residual"   min="0.013" max="0.052"/>
<timing name="psda_update_wf"  min="0.014" max="0.018"/>
<timing name="update_vhxc"     min="10.965" max="11.065"/>
<timing name="wf_update"       min="0.094" max="0.132"/>
<timing name="ekin"            min="0.009" max="0.109"/>
<timing name="exc"             min="10.909" max="10.913"/>
<timing name="hpsi"            min="1.023" max="1.031"/>
<timing name="nonlocal"        min="0.429" max="0.436"/>
<timing name="charge_compute"  min="0.017" max="0.200"/>
<timing name="charge_integral" min="0.025" max="0.316"/>
<timing name="charge_rowsum"   min="0.000" max="0.009"/>
<timing name="charge_vft"      min="0.082" max="0.104"/>
[qbox] <cmd># Frame 5/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000      -0.005000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 -0.00500000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28411776 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28527426 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28580632 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28585310 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28586968 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587205 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587513 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587616 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587680 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587694 </eigenvalue_sum>
  <etotal_int>     -37.52841473 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28578260 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28578790 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28579202 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28579243 </eigenvalue_sum>
  <etotal_int>     -37.52810479 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28551537 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553342 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554900 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555074 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555258 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555311 </eigenvalue_sum>
  <etotal_int>     -37.52795597 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554895 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554939 </eigenvalue_sum>
  <etotal_int>     -37.52797194 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28551504 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28551534 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28551548 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28551550 </eigenvalue_sum>
  <etotal_int>     -37.52796987 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28547067 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547078 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547083 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547083 </eigenvalue_sum>
  <etotal_int>     -37.52797814 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28548431 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28548444 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28548450 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28548450 </eigenvalue_sum>
  <etotal_int>     -37.52798161 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28550548 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28550552 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28550554 </eigenvalue_sum>
  <etotal_int>     -37.52798633 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556468 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556474 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556477 </eigenvalue_sum>
  <etotal_int>     -37.52799751 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556455 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556457 </eigenvalue_sum>
  <etotal_int>     -37.52800115 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557306 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557308 </eigenvalue_sum>
  <etotal_int>     -37.52800378 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558602 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558603 </eigenvalue_sum>
  <etotal_int>     -37.52800584 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563128 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563131 </eigenvalue_sum>
  <etotal_int>     -37.52800857 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563057 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563058 </eigenvalue_sum>
  <etotal_int>     -37.52800921 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564048 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564048 </eigenvalue_sum>
  <etotal_int>     -37.52801046 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564718 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564718 </eigenvalue_sum>
  <etotal_int>     -37.52801137 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565933 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565933 </eigenvalue_sum>
  <etotal_int>     -37.52801252 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566072 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566072 </eigenvalue_sum>
  <etotal_int>     -37.52801293 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566491 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566491 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566707 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566707 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566888 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566888 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567173 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567173 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567198 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567198 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567472 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567472 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567466 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567466 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567561 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567561 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567570 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567570 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567578 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567578 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567587 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567587 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567598 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567598 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567604 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567604 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567612 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567612 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972117 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925414 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358656 </ecoul>
  <exc>         -8.62957553 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 -0.00500000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00003097 -0.00072067 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00019531 0.00071787 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00038884 0.00001304 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="10.341" max="10.347"/>
</iteration>
<timing name="charge"          min="0.255" max="0.274"/>
<timing name="energy"          min="1.039" max="1.120"/>
<timing name="ortho_align"     min="0.035" max="0.039"/>
<timing name="psda_prec"       min="0.003" max="0.004"/>
<timing name="psda_residual"   min="0.010" max="0.038"/>
<timing name="psda_update_wf"  min="0.010" max="0.013"/>
<timing name="update_vhxc"     min="8.721" max="8.801"/>
<timing name="wf_update"       min="0.066" max="0.094"/>
<timing name="ekin"            min="0.007" max="0.087"/>
<timing name="exc"             min="8.676" max="8.680"/>
<timing name="hpsi"            min="0.718" max="0.724"/>
<timing name="nonlocal"        min="0.305" max="0.310"/>
<timing name="charge_compute"  min="0.013" max="0.160"/>
<timing name="charge_integral" min="0.022" max="0.251"/>
<timing name="charge_rowsum"   min="0.000" max="0.007"/>
<timing name="charge_vft"      min="0.065" max="0.083"/>
[qbox] <cmd># Frame 6/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.191664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.19166400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26800564 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26857663 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26884662 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26887216 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888162 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888333 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888564 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888641 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888687 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26888699 </eigenvalue_sum>
  <etotal_int>     -37.52822648 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27442818 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27443249 </eigenvalue_sum>
  <etotal_int>     -37.52802276 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28203751 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28205212 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28206809 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28207043 </eigenvalue_sum>
  <etotal_int>     -37.52795904 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28171522 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28171604 </eigenvalue_sum>
  <etotal_int>     -37.52796452 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28247538 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28247571 </eigenvalue_sum>
  <etotal_int>     -37.52796593 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28319439 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28319467 </eigenvalue_sum>
  <etotal_int>     -37.52796940 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28284711 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28284717 </eigenvalue_sum>
  <etotal_int>     -37.52797107 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28250090 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28250099 </eigenvalue_sum>
  <etotal_int>     -37.52797466 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28274197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28274201 </eigenvalue_sum>
  <etotal_int>     -37.52797895 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28325249 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28325253 </eigenvalue_sum>
  <etotal_int>     -37.52798173 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28342582 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28342584 </eigenvalue_sum>
  <etotal_int>     -37.52798484 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28343447 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28343449 </eigenvalue_sum>
  <etotal_int>     -37.52798670 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28350317 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28350320 </eigenvalue_sum>
  <etotal_int>     -37.52799032 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28352573 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28352574 </eigenvalue_sum>
  <etotal_int>     -37.52799057 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28353966 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28353966 </eigenvalue_sum>
  <etotal_int>     -37.52799069 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362483 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362484 </eigenvalue_sum>
  <etotal_int>     -37.52799283 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28357186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28357186 </eigenvalue_sum>
  <etotal_int>     -37.52799238 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28353766 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28353767 </eigenvalue_sum>
  <etotal_int>     -37.52799498 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28359157 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28359158 </eigenvalue_sum>
  <etotal_int>     -37.52799538 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362244 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362244 </eigenvalue_sum>
  <etotal_int>     -37.52799609 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361632 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361633 </eigenvalue_sum>
  <etotal_int>     -37.52799646 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28360947 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28360947 </eigenvalue_sum>
  <etotal_int>     -37.52799655 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28360112 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28360112 </eigenvalue_sum>
  <etotal_int>     -37.52799718 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361092 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361092 </eigenvalue_sum>
  <etotal_int>     -37.52799697 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361772 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361772 </eigenvalue_sum>
  <etotal_int>     -37.52799713 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361631 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361631 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361345 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361345 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361354 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361354 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361413 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361413 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361611 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361611 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361571 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361571 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361457 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361457 </eigenvalue_sum>
  <etotal_int>     -37.52799724 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361508 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361508 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361531 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361531 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361602 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361602 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361547 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361547 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361531 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361531 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361573 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361573 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361586 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361586 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361593 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361593 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361585 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361585 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361592 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361592 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361597 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361597 </eigenvalue_sum>
  <etotal_int>     -37.52799723 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.95723160 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.46556715 </eps>
  <enl>         -0.99274411 </enl>
  <ecoul>      -17.40004945 </ecoul>
  <exc>         -8.62686812 </exc>
  <esr>          3.19600989 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52799723 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52799723 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.19166400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00000000 -0.00569741 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 0.00116381 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00000000 0.00460022 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="13.095" max="13.101"/>
</iteration>
<timing name="charge"          min="0.328" max="0.350"/>
<timing name="energy"          min="1.130" max="1.233"/>
<timing name="ortho_align"     min="0.037" max="0.042"/>
<timing name="psda_prec"       min="0.004" max="0.004"/>
<timing name="psda_residual"   min="0.010" max="0.041"/>
<timing name="psda_update_wf"  min="0.010" max="0.014"/>
<timing name="update_vhxc"     min="11.238" max="11.340"/>
<timing name="wf_update"       min="0.071" max="0.102"/>
<timing name="ekin"            min="0.007" max="0.110"/>
<timing name="exc"             min="11.180" max="11.184"/>
<timing name="hpsi"            min="0.783" max="0.789"/>
<timing name="nonlocal"        min="0.330" max="0.336"/>
<timing name="charge_compute"  min="0.017" max="0.205"/>
<timing name="charge_integral" min="0.025" max="0.322"/>
<timing name="charge_rowsum"   min="0.000" max="0.010"/>
<timing name="charge_vft"      min="0.085" max="0.106"/>
[qbox] <cmd># Frame 7/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.181664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18166400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.31600430 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31713256 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31768140 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31773654 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31775718 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31776154 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31776747 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31776943 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31777059 </eigenvalue_sum>
  <eigenvalue_sum>  -5.31777090 </eigenvalue_sum>
  <etotal_int>     -37.52851900 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.30629935 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30631105 </eigenvalue_sum>
  <etotal_int>     -37.52805555 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29099117 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29102599 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29106877 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29107551 </eigenvalue_sum>
  <etotal_int>     -37.52797393 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29204730 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29204952 </eigenvalue_sum>
  <etotal_int>     -37.52796807 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29031488 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29031596 </eigenvalue_sum>
  <etotal_int>     -37.52796295 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28828645 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28828745 </eigenvalue_sum>
  <etotal_int>     -37.52796829 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28901010 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28901031 </eigenvalue_sum>
  <etotal_int>     -37.52796696 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28961597 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28961625 </eigenvalue_sum>
  <etotal_int>     -37.52796906 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28907329 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28907335 </eigenvalue_sum>
  <etotal_int>     -37.52797222 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28798790 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28798801 </eigenvalue_sum>
  <etotal_int>     -37.52797807 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28781799 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28781801 </eigenvalue_sum>
  <etotal_int>     -37.52798237 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775310 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775314 </eigenvalue_sum>
  <etotal_int>     -37.52798909 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28763223 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28763226 </eigenvalue_sum>
  <etotal_int>     -37.52799305 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28765514 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28765515 </eigenvalue_sum>
  <etotal_int>     -37.52799373 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28763355 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28763356 </eigenvalue_sum>
  <etotal_int>     -37.52799649 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28760100 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28760101 </eigenvalue_sum>
  <etotal_int>     -37.52799774 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28763768 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28763769 </eigenvalue_sum>
  <etotal_int>     -37.52799753 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28767388 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28767390 </eigenvalue_sum>
  <etotal_int>     -37.52799899 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28766764 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28766764 </eigenvalue_sum>
  <etotal_int>     -37.52799983 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28767368 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28767369 </eigenvalue_sum>
  <etotal_int>     -37.52800126 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28768635 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28768635 </eigenvalue_sum>
  <etotal_int>     -37.52800175 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28773717 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28773718 </eigenvalue_sum>
  <etotal_int>     -37.52800315 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28772279 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28772279 </eigenvalue_sum>
  <etotal_int>     -37.52800295 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28771889 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28771889 </eigenvalue_sum>
  <etotal_int>     -37.52800312 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28772629 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28772629 </eigenvalue_sum>
  <etotal_int>     -37.52800336 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775164 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775164 </eigenvalue_sum>
  <etotal_int>     -37.52800371 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28774849 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28774849 </eigenvalue_sum>
  <etotal_int>     -37.52800373 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28774690 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28774690 </eigenvalue_sum>
  <etotal_int>     -37.52800390 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775034 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775034 </eigenvalue_sum>
  <etotal_int>     -37.52800398 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775057 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775057 </eigenvalue_sum>
  <etotal_int>     -37.52800410 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775870 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775870 </eigenvalue_sum>
  <etotal_int>     -37.52800428 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775186 </eigenvalue_sum>
  <etotal_int>     -37.52800425 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775056 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775056 </eigenvalue_sum>
  <etotal_int>     -37.52800426 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775061 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775061 </eigenvalue_sum>
  <etotal_int>     -37.52800428 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775295 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775295 </eigenvalue_sum>
  <etotal_int>     -37.52800428 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775372 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775372 </eigenvalue_sum>
  <etotal_int>     -37.52800428 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775358 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775358 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775357 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775357 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775369 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775369 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775375 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775375 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775406 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775406 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775393 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775393 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775395 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775395 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775400 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775400 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775397 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775397 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775398 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775398 </eigenvalue_sum>
  <etotal_int>     -37.52800427 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.98232620 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.51318107 </eps>
  <enl>         -0.99790124 </enl>
  <ecoul>      -17.36694572 </ecoul>
  <exc>         -8.63230244 </exc>
  <esr>          3.22414961 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52800427 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52800427 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18166400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00000000 0.00437733 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 0.00026817 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 -0.00468303 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="15.138" max="15.144"/>
</iteration>
<timing name="charge"          min="0.374" max="0.404"/>
<timing name="energy"          min="1.291" max="1.410"/>
<timing name="ortho_align"     min="0.042" max="0.047"/>
<timing name="psda_prec"       min="0.004" max="0.005"/>
<timing name="psda_residual"   min="0.012" max="0.047"/>
<timing name="psda_update_wf"  min="0.012" max="0.016"/>
<timing name="update_vhxc"     min="13.010" max="13.128"/>
<timing name="wf_update"       min="0.081" max="0.116"/>
<timing name="ekin"            min="0.008" max="0.127"/>
<timing name="exc"             min="12.943" max="12.948"/>
<timing name="hpsi"            min="0.895" max="0.902"/>
<timing name="nonlocal"        min="0.377" max="0.383"/>
<timing name="charge_compute"  min="0.020" max="0.237"/>
<timing name="charge_integral" min="0.027" max="0.373"/>
<timing name="charge_rowsum"   min="0.000" max="0.011"/>
<timing name="charge_vft"      min="0.094" max="0.123"/>
[qbox] <cmd># Frame 8/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.005000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00500000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26999267 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27056345 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27083361 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27085964 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27086948 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27087129 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27087369 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27087448 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27087494 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27087506 </eigenvalue_sum>
  <etotal_int>     -37.52824290 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27646316 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27646747 </eigenvalue_sum>
  <etotal_int>     -37.52803650 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28408805 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28410273 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28411896 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28412136 </eigenvalue_sum>
  <etotal_int>     -37.52796908 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28373391 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28373474 </eigenvalue_sum>
  <etotal_int>     -37.52797666 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28449701 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28449737 </eigenvalue_sum>
  <etotal_int>     -37.52797631 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28524185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28524218 </eigenvalue_sum>
  <etotal_int>     -37.52798094 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28489107 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28489115 </eigenvalue_sum>
  <etotal_int>     -37.52798156 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28453255 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28453267 </eigenvalue_sum>
  <etotal_int>     -37.52798677 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28477219 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28477225 </eigenvalue_sum>
  <etotal_int>     -37.52799026 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28528150 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28528154 </eigenvalue_sum>
  <etotal_int>     -37.52799425 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28545577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28545579 </eigenvalue_sum>
  <etotal_int>     -37.52799804 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28546831 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28546832 </eigenvalue_sum>
  <etotal_int>     -37.52800045 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554699 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554702 </eigenvalue_sum>
  <etotal_int>     -37.52800536 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556820 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556820 </eigenvalue_sum>
  <etotal_int>     -37.52800573 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558453 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558454 </eigenvalue_sum>
  <etotal_int>     -37.52800602 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567849 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567850 </eigenvalue_sum>
  <etotal_int>     -37.52800890 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562282 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562282 </eigenvalue_sum>
  <etotal_int>     -37.52800829 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559750 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559751 </eigenvalue_sum>
  <etotal_int>     -37.52801110 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564961 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564961 </eigenvalue_sum>
  <etotal_int>     -37.52801149 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568049 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568049 </eigenvalue_sum>
  <etotal_int>     -37.52801209 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567500 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567500 </eigenvalue_sum>
  <etotal_int>     -37.52801240 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566849 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566849 </eigenvalue_sum>
  <etotal_int>     -37.52801254 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566186 </eigenvalue_sum>
  <etotal_int>     -37.52801322 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567052 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567052 </eigenvalue_sum>
  <etotal_int>     -37.52801295 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567941 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567941 </eigenvalue_sum>
  <etotal_int>     -37.52801317 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567321 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567321 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567367 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567367 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567441 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567441 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567593 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567593 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567474 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567474 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567416 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567416 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567540 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567540 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567596 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567596 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567590 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567590 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567578 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567578 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567574 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567574 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567587 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567587 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567593 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567593 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567614 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567623 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972122 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925418 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358655 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00019530 -0.00000000 -0.00072619 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00500000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00003096 0.00000000 0.00071235 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00038883 0.00000000 0.00000322 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="13.647" max="13.653"/>
</iteration>
<timing name="charge"          min="0.338" max="0.364"/>
<timing name="energy"          min="1.179" max="1.289"/>
<timing name="ortho_align"     min="0.038" max="0.043"/>
<timing name="psda_prec"       min="0.004" max="0.004"/>
<timing name="psda_residual"   min="0.011" max="0.044"/>
<timing name="psda_update_wf"  min="0.011" max="0.015"/>
<timing name="update_vhxc"     min="11.708" max="11.817"/>
<timing name="wf_update"       min="0.075" max="0.106"/>
<timing name="ekin"            min="0.008" max="0.118"/>
<timing name="exc"             min="11.647" max="11.652"/>
<timing name="hpsi"            min="0.813" max="0.819"/>
<timing name="nonlocal"        min="0.349" max="0.355"/>
<timing name="charge_compute"  min="0.018" max="0.212"/>
<timing name="charge_integral" min="0.026" max="0.335"/>
<timing name="charge_rowsum"   min="0.000" max="0.010"/>
<timing name="charge_vft"      min="0.086" max="0.112"/>
[qbox] <cmd># Frame 9/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to       -0.005000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to -0.00500000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28411775 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28527176 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28580355 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28585175 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28586939 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587195 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587517 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587619 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587679 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28587692 </eigenvalue_sum>
  <etotal_int>     -37.52841472 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28576641 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577167 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577622 </eigenvalue_sum>
  <etotal_int>     -37.52810438 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556638 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558430 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559999 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560183 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560372 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560467 </eigenvalue_sum>
  <etotal_int>     -37.52795825 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557963 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557988 </eigenvalue_sum>
  <etotal_int>     -37.52796731 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28553396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553434 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553458 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553460 </eigenvalue_sum>
  <etotal_int>     -37.52797330 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28545974 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28546028 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28546045 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28546046 </eigenvalue_sum>
  <etotal_int>     -37.52797664 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28547916 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547923 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547927 </eigenvalue_sum>
  <etotal_int>     -37.52798015 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28549324 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28549327 </eigenvalue_sum>
  <etotal_int>     -37.52798589 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554148 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554154 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554159 </eigenvalue_sum>
  <etotal_int>     -37.52799760 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554646 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554648 </eigenvalue_sum>
  <etotal_int>     -37.52800096 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556253 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556254 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556255 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556256 </eigenvalue_sum>
  <etotal_int>     -37.52800368 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558563 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558563 </eigenvalue_sum>
  <etotal_int>     -37.52800515 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565000 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565003 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565006 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565006 </eigenvalue_sum>
  <etotal_int>     -37.52800801 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564269 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564269 </eigenvalue_sum>
  <etotal_int>     -37.52800842 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564424 </eigenvalue_sum>
  <etotal_int>     -37.52800971 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564894 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564894 </eigenvalue_sum>
  <etotal_int>     -37.52801057 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566504 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566504 </eigenvalue_sum>
  <etotal_int>     -37.52801196 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566353 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566353 </eigenvalue_sum>
  <etotal_int>     -37.52801231 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566393 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566394 </eigenvalue_sum>
  <etotal_int>     -37.52801293 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566603 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566603 </eigenvalue_sum>
  <etotal_int>     -37.52801315 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566889 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566889 </eigenvalue_sum>
  <etotal_int>     -37.52801321 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567528 </eigenvalue_sum>
  <etotal_int>     -37.52801326 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567448 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567448 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567314 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567314 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567456 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567456 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567562 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567568 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567568 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567550 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567550 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567585 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567585 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567608 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567590 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567590 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567603 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567603 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567609 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567609 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972118 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925415 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358656 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00019531 -0.00000000 -0.00072619 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> -0.00500000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00003095 0.00000000 0.00071233 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00038883 0.00000000 0.00000320 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="10.618" max="10.624"/>
</iteration>
<timing name="charge"          min="0.263" max="0.281"/>
<timing name="energy"          min="1.094" max="1.177"/>
<timing name="ortho_align"     min="0.036" max="0.040"/>
<timing name="psda_prec"       min="0.004" max="0.004"/>
<timing name="psda_residual"   min="0.010" max="0.040"/>
<timing name="psda_update_wf"  min="0.011" max="0.014"/>
<timing name="update_vhxc"     min="8.925" max="9.007"/>
<timing name="wf_update"       min="0.069" max="0.098"/>
<timing name="ekin"            min="0.006" max="0.089"/>
<timing name="exc"             min="8.879" max="8.883"/>
<timing name="hpsi"            min="0.761" max="0.767"/>
<timing name="nonlocal"        min="0.318" max="0.324"/>
<timing name="charge_compute"  min="0.014" max="0.165"/>
<timing name="charge_integral" min="0.020" max="0.259"/>
<timing name="charge_rowsum"   min="0.000" max="0.008"/>
<timing name="charge_vft"      min="0.067" max="0.085"/>
[qbox] <cmd># Frame 10/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.005000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00500000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00000300
[qbox] <cmd> run 0 60 10</cmd>
 EnergyFunctional: <np0v> 110 </np0v>  <np1v> 110 </np1v>  <np2v> 110 </np2v>
 EnergyFunctional: vft->np012(): 1331000
<wavefunction ecut="25.00000000" nspin="1" nel="16" nempty="0">
<cell a="20.000000 0.000000 0.000000"
      b="0.000000 20.000000 0.000000"
      c="0.000000 0.000000 20.000000"/>
 reciprocal lattice vectors
 0.314159 0.000000 0.000000
 0.000000 0.314159 0.000000
 0.000000 0.000000 0.314159
<refcell a="0.000000 0.000000 0.000000"
         b="0.000000 0.000000 0.000000"
         c="0.000000 0.000000 0.000000"/>
<grid nx="48" ny="48" nz="48"/>
<slater_determinant kpoint="0 0 0" size="8">
 sdcontext: 20x1
 basis size: 23917
 c dimensions: 24400x8   (1220x8 blocks)
 <density_matrix form="diagonal" size="8"/>
</slater_determinant>
</wavefunction>
<net_charge> 0 </net_charge>
<iteration count="1">
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28489691 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28547429 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574023 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576418 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577289 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577413 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577571 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577621 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577651 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28577658 </eigenvalue_sum>
  <etotal_int>     -37.52821400 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28572795 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573061 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573267 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573288 </eigenvalue_sum>
  <etotal_int>     -37.52805700 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560904 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561803 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562586 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562677 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562770 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562796 </eigenvalue_sum>
  <etotal_int>     -37.52797659 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560673 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560687 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560700 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560703 </eigenvalue_sum>
  <etotal_int>     -37.52798178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557557 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557574 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557582 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557583 </eigenvalue_sum>
  <etotal_int>     -37.52798565 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28553642 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553666 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553674 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553674 </eigenvalue_sum>
  <etotal_int>     -37.52798887 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555219 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555225 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555227 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555228 </eigenvalue_sum>
  <etotal_int>     -37.52799083 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556277 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556279 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556280 </eigenvalue_sum>
  <etotal_int>     -37.52799452 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559174 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559179 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559182 </eigenvalue_sum>
  <etotal_int>     -37.52800263 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559810 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559811 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559812 </eigenvalue_sum>
  <etotal_int>     -37.52800472 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561414 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561415 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561416 </eigenvalue_sum>
  <etotal_int>     -37.52800650 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562789 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562790 </eigenvalue_sum>
  <etotal_int>     -37.52800788 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565218 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565219 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565221 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565221 </eigenvalue_sum>
  <etotal_int>     -37.52800962 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565393 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565394 </eigenvalue_sum>
  <etotal_int>     -37.52801033 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565764 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565764 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565765 </eigenvalue_sum>
  <etotal_int>     -37.52801109 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566613 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566614 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566614 </eigenvalue_sum>
  <etotal_int>     -37.52801260 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566818 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566818 </eigenvalue_sum>
  <etotal_int>     -37.52801301 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566963 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566963 </eigenvalue_sum>
  <etotal_int>     -37.52801319 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567160 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567160 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567301 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567301 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567384 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567384 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567429 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567429 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567493 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567493 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567536 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567536 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567561 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567561 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567579 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567579 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567589 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567598 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567598 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567604 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567604 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567611 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567613 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567615 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567617 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567619 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567619 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972119 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925415 </eps>
  <enl>         -0.99531821 </enl>
  <ecoul>      -17.38358656 </ecoul>
  <exc>         -8.62957554 </exc>
  <esr>          3.21000606 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801327 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801327 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00019530 -0.00072620 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00500000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00003097 0.00071235 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00038883 0.00000320 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="10.448" max="10.454"/>
</iteration>
<timing name="charge"          min="0.253" max="0.272"/>
<timing name="energy"          min="1.154" max="1.235"/>
<timing name="ortho_align"     min="0.037" max="0.042"/>
<timing name="psda_prec"       min="0.004" max="0.004"/>
<timing name="psda_residual"   min="0.011" max="0.042"/>
<timing name="psda_update_wf"  min="0.011" max="0.015"/>
<timing name="update_vhxc"     min="8.708" max="8.787"/>
<timing name="wf_update"       min="0.072" max="0.103"/>
<timing name="ekin"            min="0.007" max="0.087"/>
<timing name="exc"             min="8.662" max="8.666"/>
<timing name="hpsi"            min="0.804" max="0.810"/>
<timing name="nonlocal"        min="0.334" max="0.340"/>
<timing name="charge_compute"  min="0.013" max="0.160"/>
<timing name="charge_integral" min="0.019" max="0.250"/>
<timing name="charge_rowsum"   min="0.000" max="0.008"/>
<timing name="charge_vft"      min="0.064" max="0.083"/>
[qbox]  End of command stream 
<real_time> 138.869 </real_time>
<end_time> 2023-01-06T23:14:24Z </end_time>
</fpmd:simulation>
