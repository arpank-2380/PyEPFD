 set xc B3LYP 
 set wf_dyn JD 
 set ecut  50.00
 set scf_tol 1.00e-12
 species  O_species ../pseudos/O_ONCV_PBE-1.0.xml
 species  C_species ../pseudos/C_ONCV_PBE-1.0.xml
# Frame 1/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 atom   O1   O_species     0.000000       0.000000       2.186665
 atom   O2   O_species     0.000000       0.000000      -2.186662
 atom   C3   C_species     0.000000       0.000000      -0.000003
 set nempty    5
 randomize_wf
 run -atomic_density 0 100 10
plot -wf 7 wf7_frame-1.cube
 plot -wf 8 wf8_frame-1.cube
 plot -wf 9 wf9_frame-1.cube
# Frame 2/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.000000      -0.000000       2.475340
 move   O2   to       -0.000000      -0.000000      -1.897987
 move   C3   to       -0.000000      -0.000000       0.288672
 run 0 60 10
plot -wf 7 wf7_frame-2.cube
 plot -wf 8 wf8_frame-2.cube
 plot -wf 9 wf9_frame-2.cube
# Frame 3/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.000000       0.000000       1.897990
 move   O2   to        0.000000       0.000000      -2.475337
 move   C3   to        0.000000       0.000000      -0.288678
 run 0 60 10
plot -wf 7 wf7_frame-3.cube
 plot -wf 8 wf8_frame-3.cube
 plot -wf 9 wf9_frame-3.cube
# Frame 4/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.000000       0.448620       2.186665
 move   O2   to       -0.000001      -0.172131      -2.186662
 move   C3   to       -0.000000       0.138244      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-4.cube
 plot -wf 8 wf8_frame-4.cube
 plot -wf 9 wf9_frame-4.cube
# Frame 5/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.000000      -0.448620       2.186665
 move   O2   to        0.000001       0.172131      -2.186662
 move   C3   to        0.000000      -0.138244      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-5.cube
 plot -wf 8 wf8_frame-5.cube
 plot -wf 9 wf9_frame-5.cube
# Frame 6/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.352008      -0.000001       2.186665
 move   O2   to       -0.355089       0.000000      -2.186662
 move   C3   to       -0.001542      -0.000000      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-6.cube
 plot -wf 8 wf8_frame-6.cube
 plot -wf 9 wf9_frame-6.cube
# Frame 7/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.352008       0.000001       2.186665
 move   O2   to        0.355089      -0.000000      -2.186662
 move   C3   to        0.001542       0.000000      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-7.cube
 plot -wf 8 wf8_frame-7.cube
 plot -wf 9 wf9_frame-7.cube
# Frame 8/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.290402      -0.000001       2.186665
 move   O2   to       -0.286941       0.000001      -2.186662
 move   C3   to       -0.288672      -0.000000      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-8.cube
 plot -wf 8 wf8_frame-8.cube
 plot -wf 9 wf9_frame-8.cube
# Frame 9/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.290402       0.000001       2.186665
 move   O2   to        0.286941      -0.000001      -2.186662
 move   C3   to        0.288672       0.000000      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-9.cube
 plot -wf 8 wf8_frame-9.cube
 plot -wf 9 wf9_frame-9.cube
# Frame 10/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.000000      -0.100021       2.186665
 move   O2   to        0.000000      -0.416340      -2.186662
 move   C3   to       -0.000000      -0.258181      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-10.cube
 plot -wf 8 wf8_frame-10.cube
 plot -wf 9 wf9_frame-10.cube
# Frame 11/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.000000       0.100021       2.186665
 move   O2   to       -0.000000       0.416340      -2.186662
 move   C3   to        0.000000       0.258181      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-11.cube
 plot -wf 8 wf8_frame-11.cube
 plot -wf 9 wf9_frame-11.cube
# Frame 12/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.031448       0.010314       2.186665
 move   O2   to        0.031448       0.010314      -2.186662
 move   C3   to       -0.083784      -0.027478      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-12.cube
 plot -wf 8 wf8_frame-12.cube
 plot -wf 9 wf9_frame-12.cube
# Frame 13/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.031448      -0.010314       2.186665
 move   O2   to       -0.031448      -0.010314      -2.186662
 move   C3   to        0.083784       0.027478      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-13.cube
 plot -wf 8 wf8_frame-13.cube
 plot -wf 9 wf9_frame-13.cube
# Frame 14/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.010314      -0.031448       2.186665
 move   O2   to        0.010314      -0.031448      -2.186662
 move   C3   to       -0.027478       0.083784      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-14.cube
 plot -wf 8 wf8_frame-14.cube
 plot -wf 9 wf9_frame-14.cube
# Frame 15/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.010314       0.031448       2.186665
 move   O2   to       -0.010314       0.031448      -2.186662
 move   C3   to        0.027478      -0.083784      -0.000003
 run 0 60 10
plot -wf 7 wf7_frame-15.cube
 plot -wf 8 wf8_frame-15.cube
 plot -wf 9 wf9_frame-15.cube
# Frame 16/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.000000       0.000000       2.216857
 move   O2   to        0.000000       0.000000      -2.216853
 move   C3   to       -0.000000      -0.000000      -0.000004
 run 0 60 10
plot -wf 7 wf7_frame-16.cube
 plot -wf 8 wf8_frame-16.cube
 plot -wf 9 wf9_frame-16.cube
# Frame 17/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.000000      -0.000000       2.156473
 move   O2   to       -0.000000      -0.000000      -2.156471
 move   C3   to        0.000000       0.000000      -0.000002
 run 0 60 10
plot -wf 7 wf7_frame-17.cube
 plot -wf 8 wf8_frame-17.cube
 plot -wf 9 wf9_frame-17.cube
# Frame 18/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to       -0.000000       0.000000       2.195700
 move   O2   to       -0.000000       0.000000      -2.177627
 move   C3   to        0.000000      -0.000000      -0.024074
 run 0 60 10
plot -wf 7 wf7_frame-18.cube
 plot -wf 8 wf8_frame-18.cube
 plot -wf 9 wf9_frame-18.cube
# Frame 19/19 from enmfd_phonon.xyz#
 set cell     20.000000     0.000000     0.000000     0.000000    20.000000     0.000000     0.000000     0.000000    20.000000
 move   O1   to        0.000000      -0.000000       2.177630
 move   O2   to        0.000000      -0.000000      -2.195697
 move   C3   to       -0.000000       0.000000       0.024068
 run 0 60 10
plot -wf 7 wf7_frame-19.cube
 plot -wf 8 wf8_frame-19.cube
 plot -wf 9 wf9_frame-19.cube
