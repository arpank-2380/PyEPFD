TUTORIAL-1: CO2 Molecule
========================

  No.    |   Directory  |  jupyter-notebook file  |    Description
------------------------------------------------------------------------------
  1.1    | 1_cartesian_phonon                     | A Cartesian Phonon Calculation

  1.1.1  |          1_cart_phonon.ipynb        Displacing the atoms and 
					       storing into a XYZ file.
  1.1.2             2_cart_phonon.ipynb        Preparing Qbox input files from
					       the XYZ files created in 1.1.1
  1.1.3		    3_cart_phonon.ipynb        Post-processing Qbox outputs to
					       compute dynamical matrix

  1.2    2_normal_mode_phonon                  A normal mode phonon calculation

  1.2.1             1_enmfd_phonon.ipynb       Displacing the atoms along 
					       normal modes and storing the
					       coordinates in an xyz file
  1.2.2             2_enmfd_phonon.ipynb       Preparing Qbox input files from
                                               the XYZ files created in 1.2.1
  1.2.3             3_enmfd_phonon.ipynb       Post-processing Qbox outputs to
                                               compute dynamical matrix.

  1.3    3_fph_epce_zpr                        A frozen-phonon calucation of
					       Electron-Phonon Coupling Energy
					       (EPCE), zero-phonon 
					       renormalization (ZPR) etc based
					       on normal-mode phonon 
						calculation

  1.3.1             1_epce_zpr.ipynb           Preparing the input files
  1.3.2             2_epce_zpr.ipynb           Post-processing the outputs

  1.4    4_stochastic                          Stochastic Calculation of ZPR
                    1_stoch_mc.ipynb           

  1.5    5_trajectory_analysis                 Analysis of MD (or MC) 
		    1_analysis.ipynb	       trajectory to compute 
					       vibrational density along a mode
                                               or anharmonic measure
