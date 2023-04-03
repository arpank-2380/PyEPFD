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
<nodename> midway2-0595.rcc.local </nodename>
<start_time> 2023-01-06T23:12:05Z </start_time>
 MPIdata::comm: 20x1x1x1
<mpi_processes count="20">
<process id="0"> midway2-0595.rcc.local </process> (0,0,0,0)
<process id="1"> midway2-0595.rcc.local </process> (1,0,0,0)
<process id="2"> midway2-0595.rcc.local </process> (2,0,0,0)
<process id="3"> midway2-0595.rcc.local </process> (3,0,0,0)
<process id="4"> midway2-0595.rcc.local </process> (4,0,0,0)
<process id="5"> midway2-0595.rcc.local </process> (5,0,0,0)
<process id="6"> midway2-0595.rcc.local </process> (6,0,0,0)
<process id="7"> midway2-0595.rcc.local </process> (7,0,0,0)
<process id="8"> midway2-0595.rcc.local </process> (8,0,0,0)
<process id="9"> midway2-0595.rcc.local </process> (9,0,0,0)
<process id="10"> midway2-0595.rcc.local </process> (10,0,0,0)
<process id="11"> midway2-0595.rcc.local </process> (11,0,0,0)
<process id="12"> midway2-0595.rcc.local </process> (12,0,0,0)
<process id="13"> midway2-0595.rcc.local </process> (13,0,0,0)
<process id="14"> midway2-0595.rcc.local </process> (14,0,0,0)
<process id="15"> midway2-0595.rcc.local </process> (15,0,0,0)
<process id="16"> midway2-0595.rcc.local </process> (16,0,0,0)
<process id="17"> midway2-0595.rcc.local </process> (17,0,0,0)
<process id="18"> midway2-0595.rcc.local </process> (18,0,0,0)
<process id="19"> midway2-0595.rcc.local </process> (19,0,0,0)
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
[qbox] <cmd># Frame 11/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
[qbox] <cmd> atom   O1   O_species     0.000000       0.000000       2.186664</cmd>
[qbox] <cmd> atom   O2   O_species     0.000000      -0.005000      -2.186661</cmd>
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
  <eigenvalue_sum>  91.26708163 </eigenvalue_sum>
  <eigenvalue_sum>  57.53409226 </eigenvalue_sum>
  <eigenvalue_sum>  27.09794148 </eigenvalue_sum>
  <eigenvalue_sum>  9.51290963 </eigenvalue_sum>
  <eigenvalue_sum>  3.49357156 </eigenvalue_sum>
  <eigenvalue_sum>  0.34766752 </eigenvalue_sum>
  <eigenvalue_sum>  0.32683063 </eigenvalue_sum>
  <eigenvalue_sum>  -0.43425371 </eigenvalue_sum>
  <eigenvalue_sum>  -0.83229408 </eigenvalue_sum>
  <eigenvalue_sum>  -1.18191123 </eigenvalue_sum>
  <etotal_int>     -26.86768768 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -3.82587807 </eigenvalue_sum>
  <eigenvalue_sum>  -4.52285562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.66603212 </eigenvalue_sum>
  <eigenvalue_sum>  -6.38056579 </eigenvalue_sum>
  <eigenvalue_sum>  -6.93663265 </eigenvalue_sum>
  <eigenvalue_sum>  -7.44824056 </eigenvalue_sum>
  <eigenvalue_sum>  -7.91381562 </eigenvalue_sum>
  <eigenvalue_sum>  -8.40178552 </eigenvalue_sum>
  <eigenvalue_sum>  -8.94958983 </eigenvalue_sum>
  <eigenvalue_sum>  -9.51852405 </eigenvalue_sum>
  <etotal_int>     -32.55017796 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -10.24477424 </eigenvalue_sum>
  <eigenvalue_sum>  -10.83350460 </eigenvalue_sum>
  <eigenvalue_sum>  -11.59769452 </eigenvalue_sum>
  <eigenvalue_sum>  -11.94645946 </eigenvalue_sum>
  <eigenvalue_sum>  -12.14616493 </eigenvalue_sum>
  <eigenvalue_sum>  -12.26342538 </eigenvalue_sum>
  <eigenvalue_sum>  -12.33098799 </eigenvalue_sum>
  <eigenvalue_sum>  -12.37119736 </eigenvalue_sum>
  <eigenvalue_sum>  -12.37376499 </eigenvalue_sum>
  <eigenvalue_sum>  -12.40042716 </eigenvalue_sum>
  <etotal_int>     -38.90146367 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -13.25286282 </eigenvalue_sum>
  <eigenvalue_sum>  -13.31617606 </eigenvalue_sum>
  <eigenvalue_sum>  -13.46822693 </eigenvalue_sum>
  <eigenvalue_sum>  -13.56430307 </eigenvalue_sum>
  <eigenvalue_sum>  -13.70424418 </eigenvalue_sum>
  <eigenvalue_sum>  -13.79640346 </eigenvalue_sum>
  <eigenvalue_sum>  -13.83580469 </eigenvalue_sum>
  <eigenvalue_sum>  -13.85125462 </eigenvalue_sum>
  <eigenvalue_sum>  -13.85628413 </eigenvalue_sum>
  <eigenvalue_sum>  -13.85766164 </eigenvalue_sum>
  <etotal_int>     -40.95582223 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -13.54372355 </eigenvalue_sum>
  <eigenvalue_sum>  -13.54806793 </eigenvalue_sum>
  <eigenvalue_sum>  -13.55350756 </eigenvalue_sum>
  <eigenvalue_sum>  -13.55450600 </eigenvalue_sum>
  <eigenvalue_sum>  -13.55519324 </eigenvalue_sum>
  <eigenvalue_sum>  -13.55533444 </eigenvalue_sum>
  <etotal_int>     -40.96254012 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -14.88130618 </eigenvalue_sum>
  <eigenvalue_sum>  -14.88839289 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89451075 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89542005 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89594453 </eigenvalue_sum>
  <eigenvalue_sum>  -14.89605476 </eigenvalue_sum>
  <etotal_int>     -42.11496384 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.59187697 </eigenvalue_sum>
  <eigenvalue_sum>  -6.81165573 </eigenvalue_sum>
  <eigenvalue_sum>  -7.06764215 </eigenvalue_sum>
  <eigenvalue_sum>  -7.11013822 </eigenvalue_sum>
  <eigenvalue_sum>  -7.15106164 </eigenvalue_sum>
  <eigenvalue_sum>  -7.15875475 </eigenvalue_sum>
  <eigenvalue_sum>  -7.16670362 </eigenvalue_sum>
  <eigenvalue_sum>  -7.16852760 </eigenvalue_sum>
  <eigenvalue_sum>  -7.17034573 </eigenvalue_sum>
  <eigenvalue_sum>  -7.17077803 </eigenvalue_sum>
  <etotal_int>     -37.57292000 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.71103213 </eigenvalue_sum>
  <eigenvalue_sum>  -5.75796983 </eigenvalue_sum>
  <eigenvalue_sum>  -5.81806725 </eigenvalue_sum>
  <eigenvalue_sum>  -5.83078810 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84323141 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84612066 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84834054 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84890454 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84926277 </eigenvalue_sum>
  <eigenvalue_sum>  -5.84934088 </eigenvalue_sum>
  <etotal_int>     -37.58796556 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.52276271 </eigenvalue_sum>
  <eigenvalue_sum>  -6.53001445 </eigenvalue_sum>
  <eigenvalue_sum>  -6.53714598 </eigenvalue_sum>
  <eigenvalue_sum>  -6.53860909 </eigenvalue_sum>
  <eigenvalue_sum>  -6.53989041 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54029090 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54061906 </eigenvalue_sum>
  <eigenvalue_sum>  -6.54074067 </eigenvalue_sum>
  <etotal_int>     -37.57095337 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -6.18712028 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18772162 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18834873 </eigenvalue_sum>
  <eigenvalue_sum>  -6.18850076 </eigenvalue_sum>
  <etotal_int>     -37.54922503 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.72341352 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72400932 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72469983 </eigenvalue_sum>
  <eigenvalue_sum>  -5.72485329 </eigenvalue_sum>
  <etotal_int>     -37.53032249 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.65492712 </eigenvalue_sum>
  <eigenvalue_sum>  -5.65496581 </eigenvalue_sum>
  <etotal_int>     -37.52839338 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.45644763 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45663457 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45685187 </eigenvalue_sum>
  <eigenvalue_sum>  -5.45690616 </eigenvalue_sum>
  <etotal_int>     -37.52583705 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.39102976 </eigenvalue_sum>
  <eigenvalue_sum>  -5.39113302 </eigenvalue_sum>
  <etotal_int>     -37.52549993 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.30720022 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30739478 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30752881 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30756567 </eigenvalue_sum>
  <etotal_int>     -37.52614774 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29607735 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29609540 </eigenvalue_sum>
  <etotal_int>     -37.52636624 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28282934 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28287803 </eigenvalue_sum>
  <etotal_int>     -37.52700138 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26915803 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26916390 </eigenvalue_sum>
  <etotal_int>     -37.52732688 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.25754273 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25757266 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25760759 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25761634 </eigenvalue_sum>
  <etotal_int>     -37.52779862 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26214441 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26215209 </eigenvalue_sum>
  <etotal_int>     -37.52773495 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26654262 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26655111 </eigenvalue_sum>
  <etotal_int>     -37.52785073 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26833970 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26834136 </eigenvalue_sum>
  <etotal_int>     -37.52792406 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27131497 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27131757 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27132019 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27132070 </eigenvalue_sum>
  <etotal_int>     -37.52796205 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27354893 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27354922 </eigenvalue_sum>
  <etotal_int>     -37.52796065 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27599955 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27600001 </eigenvalue_sum>
  <etotal_int>     -37.52796664 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27807422 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27807435 </eigenvalue_sum>
  <etotal_int>     -37.52797047 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28084460 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28084500 </eigenvalue_sum>
  <etotal_int>     -37.52798047 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28171052 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28171055 </eigenvalue_sum>
  <etotal_int>     -37.52798186 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28274432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28274438 </eigenvalue_sum>
  <etotal_int>     -37.52798457 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28412508 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28412512 </eigenvalue_sum>
  <etotal_int>     -37.52798445 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569892 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569900 </eigenvalue_sum>
  <etotal_int>     -37.52798076 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28615585 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28615587 </eigenvalue_sum>
  <etotal_int>     -37.52798232 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28655177 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28655179 </eigenvalue_sum>
  <etotal_int>     -37.52798557 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28681310 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28681312 </eigenvalue_sum>
  <etotal_int>     -37.52798944 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28676672 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28676676 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28676678 </eigenvalue_sum>
  <etotal_int>     -37.52799989 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28676558 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28676559 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28676560 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28676560 </eigenvalue_sum>
  <etotal_int>     -37.52800061 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28666484 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28666486 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28666486 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28666486 </eigenvalue_sum>
  <etotal_int>     -37.52800312 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28653995 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28653996 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28653996 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28653996 </eigenvalue_sum>
  <etotal_int>     -37.52800509 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28629308 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28629309 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28629310 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28629310 </eigenvalue_sum>
  <etotal_int>     -37.52800522 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28621378 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28621378 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28621378 </eigenvalue_sum>
  <etotal_int>     -37.52800525 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28596454 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28596455 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28596455 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28596455 </eigenvalue_sum>
  <etotal_int>     -37.52800521 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28590496 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590497 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590497 </eigenvalue_sum>
  <etotal_int>     -37.52800442 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28570065 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570066 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570066 </eigenvalue_sum>
  <etotal_int>     -37.52800393 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564039 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564039 </eigenvalue_sum>
  <etotal_int>     -37.52800450 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555393 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555394 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555394 </eigenvalue_sum>
  <etotal_int>     -37.52800675 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555009 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555009 </eigenvalue_sum>
  <etotal_int>     -37.52800677 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28553630 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553630 </eigenvalue_sum>
  <etotal_int>     -37.52800812 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28554027 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28554028 </eigenvalue_sum>
  <etotal_int>     -37.52800906 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556043 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556043 </eigenvalue_sum>
  <etotal_int>     -37.52801039 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556839 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556840 </eigenvalue_sum>
  <etotal_int>     -37.52801061 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559589 </eigenvalue_sum>
  <etotal_int>     -37.52801110 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560593 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560593 </eigenvalue_sum>
  <etotal_int>     -37.52801130 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562977 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562977 </eigenvalue_sum>
  <etotal_int>     -37.52801158 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563908 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563908 </eigenvalue_sum>
  <etotal_int>     -37.52801168 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567123 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567124 </eigenvalue_sum>
  <etotal_int>     -37.52801216 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567302 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567302 </eigenvalue_sum>
  <etotal_int>     -37.52801217 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568179 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568179 </eigenvalue_sum>
  <etotal_int>     -37.52801244 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568706 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568706 </eigenvalue_sum>
  <etotal_int>     -37.52801269 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569234 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569234 </eigenvalue_sum>
  <etotal_int>     -37.52801319 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569168 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569168 </eigenvalue_sum>
  <etotal_int>     -37.52801325 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568951 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568951 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568851 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568851 </eigenvalue_sum>
  <etotal_int>     -37.52801329 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568522 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568522 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568442 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568442 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568238 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568238 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568112 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568112 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567825 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567825 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567761 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567761 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567610 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567610 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567555 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567555 </eigenvalue_sum>
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
  <eigenvalue_sum>  -5.28567466 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567466 </eigenvalue_sum>
  <etotal_int>     -37.52801328 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567477 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567477 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567485 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567485 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567515 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567515 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567524 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567524 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567548 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567548 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567559 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567559 </eigenvalue_sum>
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
  <eigenvalue_sum>  -5.28567597 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567597 </eigenvalue_sum>
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
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567620 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567633 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567633 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567634 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567634 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567635 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567635 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567634 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567634 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567631 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567631 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567631 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567631 </eigenvalue_sum>
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
  <eigenvalue_sum>  -5.28567628 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567628 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567624 </eigenvalue_sum>
  <etotal_int>     -37.52801327 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96972120 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48925417 </eps>
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
    <force> 0.00000000 0.00019530 -0.00072620 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 -0.00500000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00003096 0.00071236 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00038883 0.00000319 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="27.631" max="27.632"/>
</iteration>
<timing name="charge"          min="0.658" max="0.709"/>
<timing name="energy"          min="3.194" max="3.408"/>
<timing name="ortho_align"     min="0.106" max="0.117"/>
<timing name="psda_prec"       min="0.010" max="0.011"/>
<timing name="psda_residual"   min="0.029" max="0.102"/>
<timing name="psda_update_wf"  min="0.031" max="0.041"/>
<timing name="update_vhxc"     min="22.831" max="23.044"/>
<timing name="wf_update"       min="0.205" max="0.275"/>
<timing name="ekin"            min="0.019" max="0.232"/>
<timing name="exc"             min="22.711" max="22.719"/>
<timing name="hpsi"            min="2.215" max="2.232"/>
<timing name="nonlocal"        min="0.936" max="0.951"/>
<timing name="charge_compute"  min="0.035" max="0.414"/>
<timing name="charge_integral" min="0.052" max="0.683"/>
<timing name="charge_rowsum"   min="0.000" max="0.019"/>
<timing name="charge_vft"      min="0.166" max="0.216"/>
[qbox] <cmd># Frame 12/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.181661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18166100
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
  <eigenvalue_sum>  -5.30190258 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30247311 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30274306 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30276914 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30277903 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30278084 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30278327 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30278408 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30278457 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30278470 </eigenvalue_sum>
  <etotal_int>     -37.52823359 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29702946 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29703369 </eigenvalue_sum>
  <etotal_int>     -37.52803652 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28915038 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28916500 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28918118 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28918354 </eigenvalue_sum>
  <etotal_int>     -37.52797485 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28958414 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28958495 </eigenvalue_sum>
  <etotal_int>     -37.52797822 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28876720 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28876756 </eigenvalue_sum>
  <etotal_int>     -37.52797655 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28791013 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28791046 </eigenvalue_sum>
  <etotal_int>     -37.52797761 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28828056 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28828064 </eigenvalue_sum>
  <etotal_int>     -37.52797801 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28863891 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28863900 </eigenvalue_sum>
  <etotal_int>     -37.52798094 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28836532 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28836535 </eigenvalue_sum>
  <etotal_int>     -37.52798392 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28786838 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28786841 </eigenvalue_sum>
  <etotal_int>     -37.52798684 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28771659 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28771661 </eigenvalue_sum>
  <etotal_int>     -37.52799025 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28773312 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28773314 </eigenvalue_sum>
  <etotal_int>     -37.52799294 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28771744 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28771747 </eigenvalue_sum>
  <etotal_int>     -37.52799633 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28768999 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28769000 </eigenvalue_sum>
  <etotal_int>     -37.52799663 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28768444 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28768444 </eigenvalue_sum>
  <etotal_int>     -37.52799701 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28766379 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28766380 </eigenvalue_sum>
  <etotal_int>     -37.52799958 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28769897 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28769897 </eigenvalue_sum>
  <etotal_int>     -37.52799924 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28777530 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28777532 </eigenvalue_sum>
  <etotal_int>     -37.52800180 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28773549 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28773549 </eigenvalue_sum>
  <etotal_int>     -37.52800213 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28771899 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28771899 </eigenvalue_sum>
  <etotal_int>     -37.52800292 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28772732 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28772733 </eigenvalue_sum>
  <etotal_int>     -37.52800330 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28773376 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28773377 </eigenvalue_sum>
  <etotal_int>     -37.52800356 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775170 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775171 </eigenvalue_sum>
  <etotal_int>     -37.52800422 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28774034 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28774034 </eigenvalue_sum>
  <etotal_int>     -37.52800407 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28773917 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28773917 </eigenvalue_sum>
  <etotal_int>     -37.52800424 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28774749 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28774749 </eigenvalue_sum>
  <etotal_int>     -37.52800424 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775095 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775095 </eigenvalue_sum>
  <etotal_int>     -37.52800424 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775132 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775132 </eigenvalue_sum>
  <etotal_int>     -37.52800424 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775070 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775070 </eigenvalue_sum>
  <etotal_int>     -37.52800424 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775155 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775155 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775179 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775179 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775421 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775421 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775374 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775374 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775349 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775349 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775375 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775375 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775378 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775378 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775413 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775413 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775384 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775384 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775366 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775366 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775387 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775387 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775398 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775398 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775395 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775395 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775394 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775394 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775396 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775402 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775402 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775400 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775400 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28775399 </eigenvalue_sum>
  <etotal_int>     -37.52800423 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.98232637 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.51318140 </eps>
  <enl>         -0.99790125 </enl>
  <ecoul>      -17.36694547 </ecoul>
  <exc>         -8.63230247 </exc>
  <esr>          3.22414981 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52800423 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52800423 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00000000 -0.00027651 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18166100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 -0.00438585 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 0.00469945 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="14.184" max="14.190"/>
</iteration>
<timing name="charge"          min="0.351" max="0.378"/>
<timing name="energy"          min="1.217" max="1.330"/>
<timing name="ortho_align"     min="0.040" max="0.045"/>
<timing name="psda_prec"       min="0.004" max="0.004"/>
<timing name="psda_residual"   min="0.011" max="0.044"/>
<timing name="psda_update_wf"  min="0.011" max="0.016"/>
<timing name="update_vhxc"     min="12.180" max="12.292"/>
<timing name="wf_update"       min="0.077" max="0.110"/>
<timing name="ekin"            min="0.007" max="0.120"/>
<timing name="exc"             min="12.117" max="12.121"/>
<timing name="hpsi"            min="0.842" max="0.849"/>
<timing name="nonlocal"        min="0.358" max="0.364"/>
<timing name="charge_compute"  min="0.019" max="0.221"/>
<timing name="charge_integral" min="0.027" max="0.348"/>
<timing name="charge_rowsum"   min="0.000" max="0.010"/>
<timing name="charge_vft"      min="0.089" max="0.116"/>
[qbox] <cmd># Frame 13/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.191661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.19166100
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
  <eigenvalue_sum>  -5.25234638 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25347246 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25401917 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25407650 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25409893 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25410390 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25411073 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25411301 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25411432 </eigenvalue_sum>
  <eigenvalue_sum>  -5.25411468 </eigenvalue_sum>
  <etotal_int>     -37.52851412 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.26520303 </eigenvalue_sum>
  <eigenvalue_sum>  -5.26521526 </eigenvalue_sum>
  <etotal_int>     -37.52803499 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28006281 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28009861 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28014250 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28014994 </eigenvalue_sum>
  <etotal_int>     -37.52794527 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.27917440 </eigenvalue_sum>
  <eigenvalue_sum>  -5.27917689 </eigenvalue_sum>
  <etotal_int>     -37.52795104 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28082699 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28082820 </eigenvalue_sum>
  <etotal_int>     -37.52794936 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28280199 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28280308 </eigenvalue_sum>
  <etotal_int>     -37.52796083 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28208075 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28208094 </eigenvalue_sum>
  <etotal_int>     -37.52795978 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28144918 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28144946 </eigenvalue_sum>
  <etotal_int>     -37.52796444 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28195024 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28195031 </eigenvalue_sum>
  <etotal_int>     -37.52797006 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28301203 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28301213 </eigenvalue_sum>
  <etotal_int>     -37.52797496 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28323196 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28323200 </eigenvalue_sum>
  <etotal_int>     -37.52798062 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28334172 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28334176 </eigenvalue_sum>
  <etotal_int>     -37.52798386 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28348601 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28348603 </eigenvalue_sum>
  <etotal_int>     -37.52798738 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28346833 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28346834 </eigenvalue_sum>
  <etotal_int>     -37.52798758 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28353511 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28353512 </eigenvalue_sum>
  <etotal_int>     -37.52798924 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28364314 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28364315 </eigenvalue_sum>
  <etotal_int>     -37.52799225 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28360490 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28360491 </eigenvalue_sum>
  <etotal_int>     -37.52799214 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361692 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361692 </eigenvalue_sum>
  <etotal_int>     -37.52799366 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361591 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361592 </eigenvalue_sum>
  <etotal_int>     -37.52799386 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28364026 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28364027 </eigenvalue_sum>
  <etotal_int>     -37.52799610 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28363165 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28363165 </eigenvalue_sum>
  <etotal_int>     -37.52799611 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362068 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362068 </eigenvalue_sum>
  <etotal_int>     -37.52799671 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362480 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362480 </eigenvalue_sum>
  <etotal_int>     -37.52799686 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28363042 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28363042 </eigenvalue_sum>
  <etotal_int>     -37.52799698 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362554 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362554 </eigenvalue_sum>
  <etotal_int>     -37.52799698 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361862 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361862 </eigenvalue_sum>
  <etotal_int>     -37.52799698 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361967 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361967 </eigenvalue_sum>
  <etotal_int>     -37.52799701 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28362151 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28362151 </eigenvalue_sum>
  <etotal_int>     -37.52799706 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361760 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361760 </eigenvalue_sum>
  <etotal_int>     -37.52799705 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361382 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361382 </eigenvalue_sum>
  <etotal_int>     -37.52799714 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361452 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361452 </eigenvalue_sum>
  <etotal_int>     -37.52799718 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361652 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361652 </eigenvalue_sum>
  <etotal_int>     -37.52799727 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361509 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361509 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361396 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361396 </eigenvalue_sum>
  <etotal_int>     -37.52799729 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361466 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361466 </eigenvalue_sum>
  <etotal_int>     -37.52799729 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361628 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361628 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361562 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361533 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361533 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361562 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361634 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361634 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361605 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361605 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361577 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361615 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361615 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361595 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361595 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361579 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361579 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361583 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361583 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361584 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361584 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361579 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361579 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361582 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361582 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361591 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361591 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361588 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361588 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361586 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361586 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361589 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361596 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361596 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361593 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361593 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28361594 </eigenvalue_sum>
  <etotal_int>     -37.52799728 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.95723143 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.46556681 </eps>
  <enl>         -0.99274410 </enl>
  <ecoul>      -17.40004971 </ecoul>
  <exc>         -8.62686810 </exc>
  <esr>          3.19600969 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52799728 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52799728 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00000000 -0.00117215 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.19166100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00000000 0.00568929 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00000000 -0.00458414 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="17.581" max="17.587"/>
</iteration>
<timing name="charge"          min="0.438" max="0.472"/>
<timing name="energy"          min="1.498" max="1.637"/>
<timing name="ortho_align"     min="0.048" max="0.055"/>
<timing name="psda_prec"       min="0.005" max="0.005"/>
<timing name="psda_residual"   min="0.014" max="0.054"/>
<timing name="psda_update_wf"  min="0.013" max="0.019"/>
<timing name="update_vhxc"     min="15.104" max="15.242"/>
<timing name="wf_update"       min="0.094" max="0.134"/>
<timing name="ekin"            min="0.009" max="0.148"/>
<timing name="exc"             min="15.026" max="15.032"/>
<timing name="hpsi"            min="1.041" max="1.049"/>
<timing name="nonlocal"        min="0.436" max="0.444"/>
<timing name="charge_compute"  min="0.023" max="0.277"/>
<timing name="charge_integral" min="0.032" max="0.436"/>
<timing name="charge_rowsum"   min="0.000" max="0.013"/>
<timing name="charge_vft"      min="0.111" max="0.144"/>
[qbox] <cmd># Frame 14/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.005000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00500000 0.00000000 -0.00000300
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
  <eigenvalue_sum>  -5.30004891 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30038933 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30054638 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30056579 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057259 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057400 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057577 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057642 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057680 </eigenvalue_sum>
  <eigenvalue_sum>  -5.30057690 </eigenvalue_sum>
  <etotal_int>     -37.52815072 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.29489777 </eigenvalue_sum>
  <eigenvalue_sum>  -5.29490084 </eigenvalue_sum>
  <etotal_int>     -37.52802594 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28719475 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28720443 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28721607 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28721796 </eigenvalue_sum>
  <etotal_int>     -37.52799246 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28772740 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28772802 </eigenvalue_sum>
  <etotal_int>     -37.52799216 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28688150 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28688179 </eigenvalue_sum>
  <etotal_int>     -37.52799065 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28590678 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28590705 </eigenvalue_sum>
  <etotal_int>     -37.52799160 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28626539 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28626544 </eigenvalue_sum>
  <etotal_int>     -37.52799208 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28657797 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28657805 </eigenvalue_sum>
  <etotal_int>     -37.52799378 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28631794 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28631797 </eigenvalue_sum>
  <etotal_int>     -37.52799574 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28576833 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576837 </eigenvalue_sum>
  <etotal_int>     -37.52799801 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567775 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567777 </eigenvalue_sum>
  <etotal_int>     -37.52800047 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565961 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565963 </eigenvalue_sum>
  <etotal_int>     -37.52800322 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561260 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561261 </eigenvalue_sum>
  <etotal_int>     -37.52800437 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561962 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561962 </eigenvalue_sum>
  <etotal_int>     -37.52800488 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561141 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561142 </eigenvalue_sum>
  <etotal_int>     -37.52800716 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559777 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559778 </eigenvalue_sum>
  <etotal_int>     -37.52800806 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561490 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561490 </eigenvalue_sum>
  <etotal_int>     -37.52800820 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562857 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562858 </eigenvalue_sum>
  <etotal_int>     -37.52800918 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564834 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564834 </eigenvalue_sum>
  <etotal_int>     -37.52801105 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565928 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565928 </eigenvalue_sum>
  <etotal_int>     -37.52801147 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566153 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566153 </eigenvalue_sum>
  <etotal_int>     -37.52801165 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566427 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566427 </eigenvalue_sum>
  <etotal_int>     -37.52801175 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566320 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566320 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566509 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566509 </eigenvalue_sum>
  <etotal_int>     -37.52801180 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566648 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566648 </eigenvalue_sum>
  <etotal_int>     -37.52801181 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566664 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566664 </eigenvalue_sum>
  <etotal_int>     -37.52801181 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567187 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567187 </eigenvalue_sum>
  <etotal_int>     -37.52801180 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567092 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567092 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567113 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567113 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567143 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567143 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567280 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567280 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567245 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567245 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567214 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567214 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567226 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567226 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567250 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567250 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567227 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567227 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567208 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567208 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567209 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567209 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567210 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567210 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567205 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567205 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567202 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567202 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567188 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567188 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567186 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96970966 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48922816 </eps>
  <enl>         -0.99531549 </enl>
  <ecoul>      -17.38360544 </ecoul>
  <exc>         -8.62957234 </exc>
  <esr>          3.20999057 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801178 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801178 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00038895 0.00000000 -0.00073016 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00038894 -0.00000000 0.00072184 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00500000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00063857 -0.00000000 0.00000816 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="15.342" max="15.348"/>
</iteration>
<timing name="charge"          min="0.384" max="0.413"/>
<timing name="energy"          min="1.313" max="1.436"/>
<timing name="ortho_align"     min="0.043" max="0.049"/>
<timing name="psda_prec"       min="0.004" max="0.005"/>
<timing name="psda_residual"   min="0.012" max="0.048"/>
<timing name="psda_update_wf"  min="0.012" max="0.017"/>
<timing name="update_vhxc"     min="13.171" max="13.292"/>
<timing name="wf_update"       min="0.082" max="0.118"/>
<timing name="ekin"            min="0.008" max="0.131"/>
<timing name="exc"             min="13.103" max="13.108"/>
<timing name="hpsi"            min="0.910" max="0.918"/>
<timing name="nonlocal"        min="0.384" max="0.390"/>
<timing name="charge_compute"  min="0.020" max="0.241"/>
<timing name="charge_integral" min="0.031" max="0.381"/>
<timing name="charge_rowsum"   min="0.000" max="0.011"/>
<timing name="charge_vft"      min="0.098" max="0.126"/>
[qbox] <cmd># Frame 15/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to       -0.005000       0.000000      -0.000003</cmd>
 MoveCmd: atom C3 moved to -0.00500000 0.00000000 -0.00000300
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
  <eigenvalue_sum>  -5.28534538 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558235 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566907 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568505 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569068 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569141 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569216 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569238 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569249 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569252 </eigenvalue_sum>
  <etotal_int>     -37.52805313 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569757 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569812 </eigenvalue_sum>
  <etotal_int>     -37.52802212 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564955 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565332 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565688 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565738 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565789 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565803 </eigenvalue_sum>
  <etotal_int>     -37.52798469 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563920 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563936 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563946 </eigenvalue_sum>
  <etotal_int>     -37.52798928 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561221 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561226 </eigenvalue_sum>
  <etotal_int>     -37.52799043 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28555969 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28555974 </eigenvalue_sum>
  <etotal_int>     -37.52799301 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557279 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557283 </eigenvalue_sum>
  <etotal_int>     -37.52799341 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557608 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557610 </eigenvalue_sum>
  <etotal_int>     -37.52799599 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558188 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558191 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558193 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558193 </eigenvalue_sum>
  <etotal_int>     -37.52800220 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559519 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559520 </eigenvalue_sum>
  <etotal_int>     -37.52800324 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562138 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562140 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562141 </eigenvalue_sum>
  <etotal_int>     -37.52800628 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562493 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562493 </eigenvalue_sum>
  <etotal_int>     -37.52800686 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564503 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564504 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564505 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564506 </eigenvalue_sum>
  <etotal_int>     -37.52800891 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564742 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564742 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564742 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564742 </eigenvalue_sum>
  <etotal_int>     -37.52800941 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566125 </eigenvalue_sum>
  <etotal_int>     -37.52801068 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566390 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566390 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566390 </eigenvalue_sum>
  <etotal_int>     -37.52801117 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566668 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566668 </eigenvalue_sum>
  <etotal_int>     -37.52801159 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566669 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566669 </eigenvalue_sum>
  <etotal_int>     -37.52801180 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566735 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566735 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566819 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566819 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566921 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566921 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567003 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567003 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567063 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567063 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567100 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567100 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567131 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567131 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567145 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567145 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567153 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567153 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567158 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567158 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567163 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567163 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567171 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567171 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567174 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567174 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567179 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567179 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96970966 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48922816 </eps>
  <enl>         -0.99531549 </enl>
  <ecoul>      -17.38360544 </ecoul>
  <exc>         -8.62957234 </exc>
  <esr>          3.20999057 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801178 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801178 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00038896 -0.00000000 -0.00073016 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00038894 0.00000000 0.00072184 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> -0.00500000 0.00000000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00063857 0.00000000 0.00000815 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="10.821" max="10.827"/>
</iteration>
<timing name="charge"          min="0.265" max="0.286"/>
<timing name="energy"          min="1.091" max="1.175"/>
<timing name="ortho_align"     min="0.035" max="0.040"/>
<timing name="psda_prec"       min="0.003" max="0.004"/>
<timing name="psda_residual"   min="0.010" max="0.040"/>
<timing name="psda_update_wf"  min="0.010" max="0.014"/>
<timing name="update_vhxc"     min="9.124" max="9.207"/>
<timing name="wf_update"       min="0.069" max="0.098"/>
<timing name="ekin"            min="0.006" max="0.090"/>
<timing name="exc"             min="9.076" max="9.080"/>
<timing name="hpsi"            min="0.758" max="0.764"/>
<timing name="nonlocal"        min="0.318" max="0.323"/>
<timing name="charge_compute"  min="0.014" max="0.168"/>
<timing name="charge_integral" min="0.020" max="0.262"/>
<timing name="charge_rowsum"   min="0.000" max="0.008"/>
<timing name="charge_vft"      min="0.067" max="0.087"/>
[qbox] <cmd># Frame 16/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.005000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00500000 -0.00000300
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
  <eigenvalue_sum>  -5.28550860 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562709 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567050 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567844 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568162 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568200 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568211 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568217 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568218 </eigenvalue_sum>
  <etotal_int>     -37.52803246 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568458 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568486 </eigenvalue_sum>
  <etotal_int>     -37.52801659 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567753 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567945 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568150 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568176 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568183 </eigenvalue_sum>
  <etotal_int>     -37.52799552 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565652 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565664 </eigenvalue_sum>
  <etotal_int>     -37.52799619 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563244 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563247 </eigenvalue_sum>
  <etotal_int>     -37.52799677 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558874 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558877 </eigenvalue_sum>
  <etotal_int>     -37.52799789 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560006 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560009 </eigenvalue_sum>
  <etotal_int>     -37.52799911 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560350 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560352 </eigenvalue_sum>
  <etotal_int>     -37.52800112 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28560990 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28560991 </eigenvalue_sum>
  <etotal_int>     -37.52800481 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28561591 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28561591 </eigenvalue_sum>
  <etotal_int>     -37.52800584 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562703 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562704 </eigenvalue_sum>
  <etotal_int>     -37.52800785 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563471 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563472 </eigenvalue_sum>
  <etotal_int>     -37.52800877 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564316 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564317 </eigenvalue_sum>
  <etotal_int>     -37.52800965 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565149 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565150 </eigenvalue_sum>
  <etotal_int>     -37.52801060 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566072 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566072 </eigenvalue_sum>
  <etotal_int>     -37.52801155 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566290 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566290 </eigenvalue_sum>
  <etotal_int>     -37.52801173 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566441 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566441 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566698 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566698 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566831 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566831 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566957 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566957 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567087 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567087 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567105 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567105 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567147 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567147 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567163 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567163 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567185 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567184 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96970966 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48922817 </eps>
  <enl>         -0.99531550 </enl>
  <ecoul>      -17.38360544 </ecoul>
  <exc>         -8.62957234 </exc>
  <esr>          3.20999057 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801178 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801178 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000001 0.00038895 -0.00073016 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000001 0.00038893 0.00072184 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00500000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00063858 0.00000815 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="9.559" max="9.565"/>
</iteration>
<timing name="charge"          min="0.237" max="0.255"/>
<timing name="energy"          min="0.880" max="0.954"/>
<timing name="ortho_align"     min="0.028" max="0.032"/>
<timing name="psda_prec"       min="0.003" max="0.003"/>
<timing name="psda_residual"   min="0.008" max="0.032"/>
<timing name="psda_update_wf"  min="0.008" max="0.011"/>
<timing name="update_vhxc"     min="8.148" max="8.221"/>
<timing name="wf_update"       min="0.055" max="0.078"/>
<timing name="ekin"            min="0.005" max="0.080"/>
<timing name="exc"             min="8.105" max="8.109"/>
<timing name="hpsi"            min="0.608" max="0.613"/>
<timing name="nonlocal"        min="0.259" max="0.263"/>
<timing name="charge_compute"  min="0.013" max="0.150"/>
<timing name="charge_integral" min="0.018" max="0.234"/>
<timing name="charge_rowsum"   min="0.000" max="0.007"/>
<timing name="charge_vft"      min="0.060" max="0.078"/>
[qbox] <cmd># Frame 17/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000      -0.005000      -0.000003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 -0.00500000 -0.00000300
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
  <eigenvalue_sum>  -5.28534538 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558243 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566905 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568508 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569072 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569144 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569217 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569238 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569249 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569252 </eigenvalue_sum>
  <etotal_int>     -37.52805313 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28570585 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570640 </eigenvalue_sum>
  <etotal_int>     -37.52802224 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565951 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566328 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566684 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566734 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566785 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566799 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566809 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566812 </eigenvalue_sum>
  <etotal_int>     -37.52798391 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562592 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562602 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562608 </eigenvalue_sum>
  <etotal_int>     -37.52798929 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559086 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559091 </eigenvalue_sum>
  <etotal_int>     -37.52799097 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28553899 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28553904 </eigenvalue_sum>
  <etotal_int>     -37.52799261 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28556033 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28556035 </eigenvalue_sum>
  <etotal_int>     -37.52799326 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28557285 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28557287 </eigenvalue_sum>
  <etotal_int>     -37.52799560 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28558034 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558036 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558039 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558039 </eigenvalue_sum>
  <etotal_int>     -37.52800196 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28559423 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28559424 </eigenvalue_sum>
  <etotal_int>     -37.52800309 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28562057 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562058 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562059 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28562060 </eigenvalue_sum>
  <etotal_int>     -37.52800624 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28563661 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563661 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28563662 </eigenvalue_sum>
  <etotal_int>     -37.52800763 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564673 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564674 </eigenvalue_sum>
  <etotal_int>     -37.52800866 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565282 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565282 </eigenvalue_sum>
  <etotal_int>     -37.52800965 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566037 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566038 </eigenvalue_sum>
  <etotal_int>     -37.52801116 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566126 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566126 </eigenvalue_sum>
  <etotal_int>     -37.52801157 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566261 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566261 </eigenvalue_sum>
  <etotal_int>     -37.52801172 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566462 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566462 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566644 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566644 </eigenvalue_sum>
  <etotal_int>     -37.52801179 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566792 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566792 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566915 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566915 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567020 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567020 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567096 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567096 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567142 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567142 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567173 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567173 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567180 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567180 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567179 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567179 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567180 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567180 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567181 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567182 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567183 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567183 </eigenvalue_sum>
  <etotal_int>     -37.52801178 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96970965 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48922815 </eps>
  <enl>         -0.99531549 </enl>
  <ecoul>      -17.38360545 </ecoul>
  <exc>         -8.62957234 </exc>
  <esr>          3.20999057 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52801178 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52801178 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00038896 -0.00073016 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00038894 0.00072184 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 -0.00500000 -0.00000300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00063857 0.00000815 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="9.944" max="9.950"/>
</iteration>
<timing name="charge"          min="0.244" max="0.263"/>
<timing name="energy"          min="1.000" max="1.078"/>
<timing name="ortho_align"     min="0.032" max="0.037"/>
<timing name="psda_prec"       min="0.003" max="0.004"/>
<timing name="psda_residual"   min="0.009" max="0.036"/>
<timing name="psda_update_wf"  min="0.009" max="0.013"/>
<timing name="update_vhxc"     min="8.386" max="8.463"/>
<timing name="wf_update"       min="0.063" max="0.090"/>
<timing name="ekin"            min="0.006" max="0.083"/>
<timing name="exc"             min="8.342" max="8.346"/>
<timing name="hpsi"            min="0.694" max="0.699"/>
<timing name="nonlocal"        min="0.293" max="0.297"/>
<timing name="charge_compute"  min="0.013" max="0.154"/>
<timing name="charge_integral" min="0.019" max="0.240"/>
<timing name="charge_rowsum"   min="0.000" max="0.007"/>
<timing name="charge_vft"      min="0.062" max="0.081"/>
[qbox] <cmd># Frame 18/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000       0.004997</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 0.00499700
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
  <eigenvalue_sum>  -5.28555327 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569757 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574623 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28575786 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576235 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576337 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576448 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576485 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576503 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28576509 </eigenvalue_sum>
  <etotal_int>     -37.52802627 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28571887 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572076 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572294 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572362 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572427 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572452 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572471 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572477 </eigenvalue_sum>
  <etotal_int>     -37.52799192 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28570053 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570111 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570172 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570201 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570207 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570212 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28570213 </eigenvalue_sum>
  <etotal_int>     -37.52798346 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566365 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566401 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566441 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566452 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566462 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566466 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566468 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566469 </eigenvalue_sum>
  <etotal_int>     -37.52798037 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566167 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566176 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566184 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566186 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566188 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566189 </eigenvalue_sum>
  <etotal_int>     -37.52797866 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566200 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566203 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566204 </eigenvalue_sum>
  <etotal_int>     -37.52797949 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565770 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565772 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565773 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565773 </eigenvalue_sum>
  <etotal_int>     -37.52797959 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565321 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565322 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565323 </eigenvalue_sum>
  <etotal_int>     -37.52798080 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564926 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564927 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564927 </eigenvalue_sum>
  <etotal_int>     -37.52798245 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565021 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565022 </eigenvalue_sum>
  <etotal_int>     -37.52798259 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566284 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566285 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566286 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566286 </eigenvalue_sum>
  <etotal_int>     -37.52798403 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566029 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566030 </eigenvalue_sum>
  <etotal_int>     -37.52798476 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28565968 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565968 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28565969 </eigenvalue_sum>
  <etotal_int>     -37.52798583 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566528 </eigenvalue_sum>
  <etotal_int>     -37.52798671 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566709 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566709 </eigenvalue_sum>
  <etotal_int>     -37.52798672 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567745 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567745 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567746 </eigenvalue_sum>
  <etotal_int>     -37.52798813 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567235 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567235 </eigenvalue_sum>
  <etotal_int>     -37.52798761 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567486 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567486 </eigenvalue_sum>
  <etotal_int>     -37.52798786 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569378 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569378 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569379 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569379 </eigenvalue_sum>
  <etotal_int>     -37.52799062 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568221 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568222 </eigenvalue_sum>
  <etotal_int>     -37.52798914 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567897 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567897 </eigenvalue_sum>
  <etotal_int>     -37.52798850 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567744 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567744 </eigenvalue_sum>
  <etotal_int>     -37.52798840 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569044 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569045 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569045 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568927 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568927 </eigenvalue_sum>
  <etotal_int>     -37.52799053 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568896 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568896 </eigenvalue_sum>
  <etotal_int>     -37.52799027 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568944 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568944 </eigenvalue_sum>
  <etotal_int>     -37.52799031 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569044 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569044 </eigenvalue_sum>
  <etotal_int>     -37.52799052 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569114 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569114 </eigenvalue_sum>
  <etotal_int>     -37.52799064 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569633 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569633 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569633 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569651 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569651 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569641 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569641 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569625 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569625 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569600 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569600 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569578 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569578 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569562 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569562 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569555 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569555 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569525 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569525 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569523 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569523 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569522 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569522 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569524 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569524 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569527 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569527 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569526 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569526 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569526 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569526 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569528 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569529 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569529 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569529 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569529 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569530 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569530 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569530 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569530 </eigenvalue_sum>
  <etotal_int>     -37.52799100 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96982775 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48946599 </eps>
  <enl>         -0.99532919 </enl>
  <ecoul>      -17.38342982 </ecoul>
  <exc>         -8.62959375 </exc>
  <esr>          3.21013353 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52799100 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52799100 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00000000 0.00396222 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00000000 0.00530728 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 0.00499700 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 -0.00000000 -0.00899026 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="14.868" max="14.874"/>
</iteration>
<timing name="charge"          min="0.359" max="0.386"/>
<timing name="energy"          min="1.637" max="1.753"/>
<timing name="ortho_align"     min="0.053" max="0.060"/>
<timing name="psda_prec"       min="0.005" max="0.006"/>
<timing name="psda_residual"   min="0.015" max="0.059"/>
<timing name="psda_update_wf"  min="0.016" max="0.021"/>
<timing name="update_vhxc"     min="12.391" max="12.505"/>
<timing name="wf_update"       min="0.103" max="0.147"/>
<timing name="ekin"            min="0.010" max="0.125"/>
<timing name="exc"             min="12.326" max="12.331"/>
<timing name="hpsi"            min="1.136" max="1.145"/>
<timing name="nonlocal"        min="0.479" max="0.487"/>
<timing name="charge_compute"  min="0.019" max="0.226"/>
<timing name="charge_integral" min="0.028" max="0.357"/>
<timing name="charge_rowsum"   min="0.000" max="0.011"/>
<timing name="charge_vft"      min="0.091" max="0.118"/>
[qbox] <cmd># Frame 19/19 from fd_phonon.xyz#</cmd>
[qbox] <cmd> set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000</cmd>
<unit_cell 
    a="20.00000000  0.00000000   0.00000000  "
    b="0.00000000   20.00000000  0.00000000  "
    c="0.00000000   0.00000000   20.00000000 " />
[qbox] <cmd> move   O1   to        0.000000       0.000000       2.186664</cmd>
 MoveCmd: atom O1 moved to 0.00000000 0.00000000 2.18666400
[qbox] <cmd> move   O2   to        0.000000       0.000000      -2.186661</cmd>
 MoveCmd: atom O2 moved to 0.00000000 0.00000000 -2.18666100
[qbox] <cmd> move   C3   to        0.000000       0.000000      -0.005003</cmd>
 MoveCmd: atom C3 moved to 0.00000000 0.00000000 -0.00500300
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
  <eigenvalue_sum>  -5.28524541 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28558564 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569372 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28572400 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573649 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573988 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574368 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574483 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574535 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574553 </eigenvalue_sum>
  <etotal_int>     -37.52809102 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28572646 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28573363 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574234 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574506 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574769 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28574870 </eigenvalue_sum>
  <etotal_int>     -37.52798190 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566152 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566312 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566546 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566622 </eigenvalue_sum>
  <etotal_int>     -37.52798538 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28564689 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564781 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564871 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28564888 </eigenvalue_sum>
  <etotal_int>     -37.52798307 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28566951 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28566960 </eigenvalue_sum>
  <etotal_int>     -37.52798134 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567438 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567446 </eigenvalue_sum>
  <etotal_int>     -37.52798164 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567121 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567125 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567131 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567135 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567138 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567138 </eigenvalue_sum>
  <etotal_int>     -37.52798232 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567279 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567280 </eigenvalue_sum>
  <etotal_int>     -37.52798253 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567291 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567292 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567293 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567293 </eigenvalue_sum>
  <etotal_int>     -37.52798317 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567727 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567730 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567733 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567734 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567735 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567735 </eigenvalue_sum>
  <etotal_int>     -37.52798426 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567196 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567197 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567197 </eigenvalue_sum>
  <etotal_int>     -37.52798419 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567151 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567152 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567152 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567152 </eigenvalue_sum>
  <etotal_int>     -37.52798444 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567266 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567267 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567268 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567268 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567268 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567268 </eigenvalue_sum>
  <etotal_int>     -37.52798491 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567366 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567366 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567366 </eigenvalue_sum>
  <etotal_int>     -37.52798498 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567408 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567409 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567409 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567409 </eigenvalue_sum>
  <etotal_int>     -37.52798540 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568043 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568044 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568045 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568045 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568045 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568046 </eigenvalue_sum>
  <etotal_int>     -37.52798783 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567582 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567582 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567583 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567583 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567583 </eigenvalue_sum>
  <etotal_int>     -37.52798627 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567685 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567686 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567686 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567686 </eigenvalue_sum>
  <etotal_int>     -37.52798597 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567859 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567859 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567859 </eigenvalue_sum>
  <etotal_int>     -37.52798647 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28567948 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567948 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28567948 </eigenvalue_sum>
  <etotal_int>     -37.52798689 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568424 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568425 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568425 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568426 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568426 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568426 </eigenvalue_sum>
  <etotal_int>     -37.52798966 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568522 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568522 </eigenvalue_sum>
  <etotal_int>     -37.52798995 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28568335 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568335 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568335 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28568335 </eigenvalue_sum>
  <etotal_int>     -37.52798870 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569430 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569430 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569431 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569431 </eigenvalue_sum>
  <etotal_int>     -37.52799072 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569122 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569122 </eigenvalue_sum>
  <etotal_int>     -37.52799072 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569047 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569047 </eigenvalue_sum>
  <etotal_int>     -37.52799079 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569056 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569056 </eigenvalue_sum>
  <etotal_int>     -37.52799087 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569166 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569166 </eigenvalue_sum>
  <etotal_int>     -37.52799090 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569225 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569225 </eigenvalue_sum>
  <etotal_int>     -37.52799091 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569625 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569625 </eigenvalue_sum>
  <etotal_int>     -37.52799093 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569314 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569314 </eigenvalue_sum>
  <etotal_int>     -37.52799094 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569305 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569305 </eigenvalue_sum>
  <etotal_int>     -37.52799094 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569363 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569363 </eigenvalue_sum>
  <etotal_int>     -37.52799093 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569404 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569404 </eigenvalue_sum>
  <etotal_int>     -37.52799093 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569545 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569545 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569447 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569447 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569481 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569481 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569522 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569522 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569528 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569528 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569524 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569524 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569518 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569518 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569525 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569525 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569527 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569527 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569531 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569532 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569532 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569533 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569533 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569535 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569535 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569535 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569535 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  BOSampleStepper: start scf iteration
  <electronic_charge ispin="0"> 16.00000000 </electronic_charge>
  <eigenvalue_sum>  -5.28569536 </eigenvalue_sum>
  <eigenvalue_sum>  -5.28569536 </eigenvalue_sum>
  <etotal_int>     -37.52799092 </etotal_int>
  BOSampleStepper: end scf iteration
  <ekin>        25.96982809 </ekin>
  <econf>        0.00000000 </econf>
  <eps>        -36.48946666 </eps>
  <enl>         -0.99532922 </enl>
  <ecoul>      -17.38342932 </ecoul>
  <exc>         -8.62959381 </exc>
  <esr>          3.21013393 </esr>
  <eself>       23.40461378 </eself>
  <ets>          0.00000000 </ets>
  <eexf>         0.00000000 </eexf>
  <etotal>     -37.52799092 </etotal>
  <epv>          0.00000000 </epv>
  <eefield>      0.00000000 </eefield>
  <enthalpy>   -37.52799092 </enthalpy>
<atomset>
<unit_cell 
    a=" 20.00000000   0.00000000   0.00000000"
    b="  0.00000000  20.00000000   0.00000000"
    c="  0.00000000   0.00000000  20.00000000" />
  <atom name="O1" species="O_species">
    <position> 0.00000000 0.00000000 2.18666400 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 0.00000000 -0.00531541 </force>
  </atom>
  <atom name="O2" species="O_species">
    <position> 0.00000000 0.00000000 -2.18666100 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> -0.00000000 -0.00000000 -0.00397071 </force>
  </atom>
  <atom name="C3" species="C_species">
    <position> 0.00000000 0.00000000 -0.00500300 </position>
    <velocity> 0.00000000 0.00000000 0.00000000 </velocity>
    <force> 0.00000000 0.00000000 0.00900677 </force>
  </atom>
</atomset>
<unit_cell_a_norm> 20.000000 </unit_cell_a_norm>
<unit_cell_b_norm> 20.000000 </unit_cell_b_norm>
<unit_cell_c_norm> 20.000000 </unit_cell_c_norm>
<unit_cell_alpha>  90.000 </unit_cell_alpha>
<unit_cell_beta>   90.000 </unit_cell_beta>
<unit_cell_gamma>  90.000 </unit_cell_gamma>
<unit_cell_volume> 8000.000 </unit_cell_volume>
<timing name="iteration"       min="15.284" max="15.290"/>
</iteration>
<timing name="charge"          min="0.367" max="0.394"/>
<timing name="energy"          min="1.776" max="1.894"/>
<timing name="ortho_align"     min="0.058" max="0.065"/>
<timing name="psda_prec"       min="0.006" max="0.006"/>
<timing name="psda_residual"   min="0.016" max="0.065"/>
<timing name="psda_update_wf"  min="0.017" max="0.023"/>
<timing name="update_vhxc"     min="12.641" max="12.757"/>
<timing name="wf_update"       min="0.112" max="0.160"/>
<timing name="ekin"            min="0.010" max="0.127"/>
<timing name="exc"             min="12.576" max="12.581"/>
<timing name="hpsi"            min="1.237" max="1.247"/>
<timing name="nonlocal"        min="0.517" max="0.525"/>
<timing name="charge_compute"  min="0.019" max="0.231"/>
<timing name="charge_integral" min="0.028" max="0.364"/>
<timing name="charge_rowsum"   min="0.000" max="0.011"/>
<timing name="charge_vft"      min="0.094" max="0.120"/>
[qbox]  End of command stream 
<real_time> 136.648 </real_time>
<end_time> 2023-01-06T23:14:22Z </end_time>
</fpmd:simulation>
