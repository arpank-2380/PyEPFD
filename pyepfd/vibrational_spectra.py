# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

"""
This module contains methods and classes relevant to computing 
frequencies and intensities of vibrational spectroscopy (IR, Raman)
using double-harmonic approximation. 
This information can be later used for constructing vibrational 
spectra.

.. tip::
    Only normal mode finite displacements ``NMFD``/``ENMFD``
    can be used for computing intensities

.. note::
    Currently, on IR intensities are implemented.
    Raman intensities would be implemented in future releases.
"""
__all__=["ir",'qbox_ir','add_broadening']

from pyepfd.coord_util import *
from pyepfd.elph_classes import *
from pyepfd.elph_classes import central_diff
from pyepfd.pyepfd_io import *
from pyepfd.ipi_file_read import ipi_info
from pyepfd.constants import *

def add_broadening( freq, osc_str, line_profile="Lorentzian",
                    line_param=10,step=10):
    """
    ===============================
    FUNCTION ADD BROADENING
    ===============================
    This function adds broadening to the line spectra
    (*i.e.* normal mode frequencies and intensities) to
    construct a vibrational spectra.

    **Arguments:**

        **freq** = A numpy 1D aray containing normal-mode frequencies(float).

        **osc_str** = A numpy 1D array containing oscillator strength (float)
        computed using double-harmonic approximation

        **line_profile** = A string: 'Lorentzian' (Default) or 'Gaussian'

        **line_param** = A float defining width of the profile 

        **step** = A float defining the size of the bin of the
        returned spectra

    **Returns:**

        A numpy array with 2 rows:

        (1) X-axis values (frequency) of the spectra as a numpy 1D float array

        (2) Y-axis values (intensity) of the spectra as a numpy 1D float array
    """

    x_min = np.amin(freq) - 50
    x_max = np.amax(freq) + 50
    x = np.arange(x_min, x_max, step)
    y = np.zeros((len(x)))

    # go through the frames and calculate the spectrum for each frame
    for xp in range(len(x)):
        for e, f in zip(freq, osc_str):
            if line_profile == "Gaussian":
                y[xp] += f * np.exp(-(((e - x[xp]) / line_param) ** 2))
            elif line_profile == "Lorentzian":
                y[xp] += (
                    0.5
                    * line_param
                    * f
                    / (np.pi * ((x[xp] - e) ** 2 + 0.25 * line_param**2))
                )
    y = y / np.sum(y)
    return np.array([x, y])

def remove_dipole_jumps(dipole_moment, cell):
    """
    ===================================
    FUNCTION REMOVE DIPOLE JUMPS
    ===================================
    Removes the dipole moment jumps due to change in polarization lattice of a periodic system.
    The reference dipole moment is that of the geometry optimized configurations.

    **Arguments:**

        **dipole_moment** = numpy float array of shape (M,3) 
        where M is the number of configurations

        **cell** = numpy array of length 6. 
        Lengths a,b,c and angles (degree):alpha, beta, gamma

    **Returns:**

        numpy float array of shape (M,3) containing corrected dipole moments

    """
    nconfig = len(dipole_moment)
    h = abc2h(np.array(cell))
    ih = np.linalg.inv(h)
    dipole_moment_diff = dipole_moment - dipole_moment[0]

    for j in range(1,nconfig):
        dipole_moment_diff_frac = np.dot(ih, dipole_moment_diff[j])
        for i in range(3):
            dipole_moment_diff_frac[i] -= round(dipole_moment_diff_frac[i])
        dipole_moment_diff[j] = np.dot(h,dipole_moment_diff_frac)

    corr_dipole_moment = dipole_moment_diff + dipole_moment[0]

    return corr_dipole_moment

def difference(x,y,forward=True):
    """
    Calculate gradient using Finite Difference between 2 points.
    Finte difference can be calculated using forward or backward differences.
    
    **Arguments:**
        
        **x** = Array of displacement values

        **y** = Array of functional values off shifted w.r.t x = 0

        **forward** = if True then forward difference, else backward difference

    **Returns:**

        A numpy array containing gradients
    """
    if len(y) != len(x): raise ValueError("Size of y should be equal to size of x.")
    if forward: gradient = y/x
    else:       gradient = -y/x
    return gradient

def oscillator_strength(grad_dipole_x, grad_dipole_y, grad_dipole_z):
    """
    ======================================
    FUNCTION OSCILLATOR STRENGTH
    ======================================

    Calculate oscillator strengths from cartesian components 
    of dipole-moment gradients
    
    **Arguments:**
        
        grad_dipole_x = Gradient of x-component of dipole moment

        grad_dipole_y = Gradient of y-component of dipole moment

        grad_dipole_z = Gradient of z-component of dipole moment

    **Returns:**

        A numpy array of oscillator strengths
    """
    return np.square(grad_dipole_x) + np.square(grad_dipole_y) + np.square(grad_dipole_z)


def calc_ir_freq_osc_str(energies, dipole_total, disp_steps, ngrid=1, freq_unit='cm-1'):
    """
    =======================================================
    FUNCTION calculate IR frequency oscillator strengths
    =======================================================
    This function calculates the IR frequencies and oscillator
    strengths.

    **Arguments:**

        **energies** = A numpy float array of length 2*ngrid*M+1 containing
        displaced energies where M is the number of modes to be treated.
        The first element: energies[0] should be the energy of the 
        optimized geometry

        **dipole_total** = A (2*ngrid*M+1, 3) numpy float array of containing
        cartesian components of dipole moment. The first element: 
        dipole_total[0] should be an array of length 3 containg cartesian
        components of the total dipole moment of the optimized geometry.

        **disp_steps** = A numpy float array of length M containing 
        symmetric displacement step along each normal mode.

        **ngrid** = The number of displacement grid points.
        Allowed values: *1(Default), 2, 3, 4* . 

        **freq_unit** = The desired unit of frequency
        

    **Returns:**

        (1) A numpy array of normal-mode frequencies (units desired by user)\
        computed from the normal-mode hessian.

        (2) A numpy array of oscillator strengths.

        (3) If ``ngrid = 1``; oscillator strength from forward diff;\
        otherwise returns NONE.

        (4) If ``ngrid = 1``; oscillator strength from backward diff;\
        otherwise returns NONE.

        For items 2-4, each array has 4 rows. First three rows are
        Cartesian X, Y and Z components of the oscillator strengths
        while the last row is their sum, *i.e.* total oscillator strengths.

    """
    if (ngrid < 1) | (ngrid > 4):
        raise ValueError("ir_freq_osc_str: Allowed values of ngrid are 1,2,3,4")

    n_mode = len(disp_steps)  # This is our M as in documentation above
    n_energy = len(energies)
    n_dipole = len(dipole_total)

    if (n_energy != 2*ngrid*n_mode + 1) | (n_dipole != 2*ngrid*n_mode + 1):
        raise ValueError(f"ir_freq_osc_str:\nLength of energies ({n_energy}) "+\
                f"or dipole_total ({n_dipole}) \nis not consistent with the "+\
                f"length of disp_step ({n_mode})")

    #  Scale shifting energy and dipole moment w.r.t opt. geometry
    energy = energies[1:] - energies[0]
    dipole = dipole_total[1:] - dipole_total[0]
    #print(f"energy: {energy}")
    # Frequency and oscillator strengths using central difference
    hessian = central_diff(disp_steps, energy, order=2,ngrid=ngrid).cd
    dipole_x_grad_c =  central_diff(disp_steps, dipole[:,0], order=1,ngrid=ngrid).cd
    dipole_y_grad_c =  central_diff(disp_steps, dipole[:,1], order=1,ngrid=ngrid).cd
    dipole_z_grad_c =  central_diff(disp_steps, dipole[:,2], order=1,ngrid=ngrid).cd

    osc_str =  np.array([np.square(dipole_x_grad_c), 
                         np.square(dipole_y_grad_c),
                         np.square(dipole_z_grad_c),
               oscillator_strength(dipole_x_grad_c, dipole_y_grad_c, dipole_z_grad_c)])

    # forward and backward differences:
    if ngrid == 1:
       dipole_x_grad_f =  difference(disp_steps, dipole[::2,0], forward = True)
       dipole_y_grad_f =  difference(disp_steps, dipole[::2,1], forward = True)
       dipole_z_grad_f =  difference(disp_steps, dipole[::2,2], forward = True) 
       osc_str_f = np.array([np.square(dipole_x_grad_f),
                         np.square(dipole_y_grad_f),
                         np.square(dipole_z_grad_f),
                         oscillator_strength(
                             dipole_x_grad_f, 
                             dipole_y_grad_f, 
                             dipole_z_grad_f)])

       dipole_x_grad_b =  difference(disp_steps, dipole[1::2,0], forward = False)
       dipole_y_grad_b =  difference(disp_steps, dipole[1::2,1], forward = False)
       dipole_z_grad_b =  difference(disp_steps, dipole[1::2,2], forward = False)
       osc_str_b = np.array([np.square(dipole_x_grad_b),
                         np.square(dipole_y_grad_b),
                         np.square(dipole_z_grad_b),
                         oscillator_strength(
                             dipole_x_grad_b, 
                             dipole_y_grad_b, 
                             dipole_z_grad_b)])
    else:
       osc_str_f = None
       osc_str_b = None

    omega = np.sqrt(hessian) * ha2unit[freq_unit]
    return omega, osc_str, osc_str_f, osc_str_b

class ir:
      """
      ===========================================================
      CLASS IR
      ===========================================================
      This class contains methods for calculating IR frequencies
      and intensities and broadening methods to obtain a spectra.
      These quantities are calculated using normal mode finite 
      displacements *(NMFD/ENMFD/NMS/ENMS)* and using finite-difference.
      The class can be instantiated using either
      (i) a normal mode displacement log file
      or (ii) pyepfd (or i-PI) XML restart file. 
      Bellow are the description of various arguments it accepts,
      the objects it creates and the methods it contains.

      **Arguments:**

          **file_path** = This is a mandatory argument accepting a string.
          The string defines:

            **EITHER**
          
            (1) Full path to the log file (or output) while
            normal mode displacements (using NMFD, ENMFD, NMS or ENMS) 
            are performed. 
          
            **OR** 
          
            (2) Full path to the pyepfd restart XML file 
            obtained after finite difference (FD) frequency calculation,
            which was used as input for normal-mode displacements.

          .. note:
             if you have performed normal mode sampling with ``ngrid`` larger
             than 4, then providing the log file is the only option. Therefore
             this is recommended. 

          Other arguments are not mandatory as they have set default values
          but should be checked.

          **(A) Arguments if log file is supplied**
          
                **disp_indices** = A python list defining the points (from the 
                displacement grid of a normal-mode sampling) that is to be used
                to calculate frequency and oscillator strength (intensity). This
                is needed only if ``ngrid`` is larger than 4 when you performed
                normal mode sampling using **coord_util.ionic_mover** class.

                .. tip::
                   Suppose you used a normal mode sampling with ``ngrid=8``, *i.e*,
                   16 symmetrically displaced points. The implemented finite 
                   difference formula accepts upto ``ngrid = 4``. Therefore, you can
                   chose the 8 closest points to supply this class using 
                   ``disp_indices = [5,6,7,8,9,10,11,12]``.

                   .. note::
                      Remember point 8 in this example is the negatively displaced
                      configuration, while point 9 is positively displaced configuration.
                      Check the normal mode displacement output (logfile) for further
                      clarifications.

                   If you want to increase
                   the displacement, you can use 
                   ``disp_indices = [1, 3, 5, 7, 10, 12, 14, 16]``. Defining this, will
                   automatically define ``ngrid = 4``.
                   If you want to use a lower value, say, ``ngrid = 2``, you can set
                   ``disp_indices = [5, 7, 10, 12]``


          **(B) Arguments if only XML restart file is supplied**
          
                **mode** = Finite displacement mode

                  Options are:
                    **(1)** *'NMFD'*: Normal Mode Finite Displacement,
                  OR
                    **(2)** *'ENMFD'*: Energy-scaled Normal Mode Finite Displacement

                **deltax** = A displacement (*float*) in atomic unit (Bohr)

                **deltae** = Energy scaled displacement (*float*) in atomic_unit (Hartree)

                **ngrid** = The number of displacement grid points. Allowed values: 1,2,3,4.

          .. tip:
                These values must be same with the ones supplied to coord_util.ionic_mover
                class while performing the displacements.
                See documentation of coord_util.ionic_mover class for more details
                regarding this set of arguments.

          .. warning::    
                If these values are not supplied, then default values, which are:
                ``mode = 'ENMFD'``, ``deltax = 0.005``, ``deltae = 0.001``, ``ngrid = 1``,
                would be used for calculating displacements. 

          .. danger::
                If these values are not same to the ones supplied to 
                **coord_util.ionic_mover** class while performing the 
                displacements, it would lead to **wrong** frequencies and 
                intensities. 

          **(C) Argument irrespective of logfile or XML file**
                
                **nmode_only** = A python-list of normal-mode indices 
                along which displacements are performed. Default is None, i.e.,
                all modes are included.

                .. warning:: 
                   If XML restart file is supplied as input then the supplied list 
                   must match to the one supplied to **coord_util.ionic_mover**
                   while performing the displacements.

                   If log file is supplied, then the supplied list should be a subset
                   of the sampled modes in the logfile.

                **asr** = acoustic sum rule. Options are: 
                (1) *'none'*, (2) *'crystal'*, (3) *'poly'*, (4) *'lin'*

                .. tip::
                   See the documentation of **coord_util.ionic_mover** 
                   for more information.

                .. warning::
                   If it is not supplied, either it would be read from the XML restart file,
                   or set to default *'none'* when log file is supplied.                      

                .. note::
                   The following two cutoff's are required to ensure numerical stability
                   in periodic calculations. For a periodic system, the dipole moment
                   is not a single vector but a lattice with several branches, and therefore,
                   one must ensure that the dipole momentsof the displaced configurations 
                   entering the finite difference are in the same branch. If there is a 
                   jump, there would be considerable difference between the forward and
                   backward difference formula and central difference won't be numerically
                   accurate. Using these cut offs we ensure, to use the
                   correct difference formula while calculating the dipole moment gradient.

                **diff_cut** = Default is None. Otherwise, a floating point number,
                defining the acceptable difference between forward and backward 
                difference for oscillator strength when ``ngrid = 1``. If the difference
                is less than the cutoff we accept the central difference.

                **ratio_cut** = Default is None. Otherwise, a floating point number > 1,
                defining the range of acceptable ratio between forward and backward 
                differences. If the ratio is within the acceptable range: (1, ratio_cut),
                central differance would be accepted.

                **save_path** = full path to an numpy *.npz* file where frequencies and
                oscillator strength would be written if **save()** method is used.
                This file could be used to obtain the spectra using the 
                **add_broadening** method described above.

      """
      def __init__(self, file_path,  
                  mode = None, deltax = None, deltae = None, ngrid = None, # required if xml file is input
                  disp_indices = None,  # required if the log file is supplied 
                  nmode_only = None, asr = None,
                  diff_cut = None, ratio_cut = None,
                  save_path = 'ir_freq_osc_str.npz'):

         self.file_path = file_path
         if mode is not None:
            if 'fd' not in mode.lower(): 
                raise ValueError("\033[91mAlowed values of mode are: NMFD/ENMFD.\n"+\
                        f"If you performed NMS/ENMS sampling please provide the logfile.\033[00m")
         self.mode = mode; self.deltax = deltax; self.deltae = deltae; self.ngrid = ngrid
         self.disp_indices = disp_indices; self.nmode_only = nmode_only
         self.diff_cut = diff_cut; self.ratio_cut = ratio_cut; self.asr = asr
         self.save_path = save_path 
         self._get_disp_steps()
         

      def _get_disp_steps(self):
          """
          This private class method obtains the displacement steps from the 
          supplied files using the key **file_path**
          """

          try: 
             logdata = read_nmdisp_log(self.file_path)
             self.ndisp = len(logdata.disp_au[logdata.modes[0]]) 
             self.mode_list = logdata.modes
             self.nmode = len(self.mode_list)
             if self.asr is None:  
                self.asr = 'none'
                print(f"\033[95m asr is not supplied. Setting it to {self.asr} \033[00m")
             if self.disp_indices is None: 
                if self.ndisp in [2,4,6,8]:
                   self.disp_indices = [i+1 for i in range(self.ndisp)]
                else: 
                   print(f"\033[91m{self.ndisp} displacement corresponding to"+\
                           f" ngrid = {self.ndisp//2} found\n"+\
                           f"Allowed values of ngrid = 1,2,3,4\n"+\
                           f"Supply disp_indices list to define the points for"+\
                           f" IR intensity calculations\033[00m") 
                   sys.exit(0)
             self.ngrid = len(self.disp_indices)//2
             ind_diff = self.disp_indices[self.ngrid] - \
                     self.disp_indices[self.ngrid-1]
             disp_scale = (1+ind_diff)//2
             if self.nmode_only is None:
                self.disp_steps = np.array(logdata.disp_steps_au) * disp_scale
                self.mode_disp_seq = [i for i in range(self.nmode)]
             else:
                disp_steps = [] 
                self.mode_disp_seq = []
                for imode in self.nmode_only: 
                    try:
                        index = self.mode_list(imode)
                        disp_steps.append(logdata.disp_steps_au)
                        self.mode_disp_seq.append(index)
                    except ValueError:
                        print(f"\033[91mMode# {imode} not found in {self.file_path}\033[00m")
                        sys.exit(0)
                self.disp_steps = np.array(disp_steps) * disp_scale        
          except UnboundLocalError:
             phonon_file = self.file_path 
             ph_file = open(phonon_file,'r+')
             root_tag = ph_file.readline()
             ph_file.close()

             if "<simulation" in root_tag:
                inp = ipi_info(file_path=phonon_file)
             elif "<pyepfd" in root_tag:
                inp = read_pyepfd_info(file_path = phonon_file)
             else: 
                raise SyntaxError("Supplied file is not a pyepfd log file or restart file")

             if self.asr is None: 
                self.asr = inp.asr
                print(f"\033[95m asr is not supplied. Setting it to {self.asr}\n"+\
                        f" as in {self.file_path}.\033[00m")

             if (self.mode is None) | (self.deltax is None) | \
                    (self.deltae is None) | (self.ngrid is None):
                self.mode = 'ENMFD'; self.deltax = 0.005
                self.deltae = 0.001; self.ngrid = 1        
                print(f"\033[95mmode, deltax, deltae and ngrid is not supplied\n"+\
                        f"Trying the default values:\n"+\
                        f"mode = {self.mode}; deltax = {self.deltax};"+\
                        f"deltae = {self.deltae}; ngrid = {self.ngrid}\n"+\
                        f"for computing the displacements from {self.file_path}.\033[00m")

             nm_disp = nm_sym_displacements(dynmat = inp.ref_dynmatrix,
                     mass = inp.mass, mode = self.mode.lower(),
                     deltax = self.deltax, deltae = self.deltae)
             disp_steps = nm_disp.displacements
             del(nm_disp)
             if self.nmode_only is None: 
                self.disp_steps = disp_steps
                self.mode_list = [i+1 for i in range(len(disp_steps))]
             else:
                self.disp_steps = np.array(
                        [disp_steps[i-1] for i in self.nmode_only])
                self.mode_list = self.nmode_only
             self.nmode = len(self.disp_steps)
             self.mode_disp_seq = [i for i in range(self.nmode)]
             if ( self.ngrid >=1 ) & (self.ngrid <= 4 ):
                self.ndisp = 2*self.ngrid
                self.disp_indices = [i+1 for i in range(self.ndisp)] 
             else:
                raise ValueError(
                 f"\033[91mAllowed values of ngrid = 1,2,3,4\033[00m") 
              

      
      def arrange_energies_dipoles(self,energies, dipole_total):
          """
          This class method accepts numpy arrays containing energies and dipoles
          and arrange them to make it consistent with the displacements 
          obtained using the other keys to instantiate the **ir** object.

          **Arguments:** 

            **energies** = A 1D numpy float array of length M+1 containing the 
            energies of the optimized geometry and the M displaced configurations
 
            **dipole_total** = A 2D numpy float array of shape (M+1,3) containing
            the cartesian total dipole moment components of the the optimized 
            geometry and the M displaced configurations

          **Returns:**

            Creats **ir.energies** and **ir.dipole_total** objects within the
            class.
          """

          if len(energies) != len(dipole_total):
             raise ValueError(f"\033[91mir_freq_osc_str: lengths of"+\
                   f" energies and dipole_total should be same.\033[00m")

          len_data = self.ndisp*self.nmode+1
          len_energy = len(energies)
          len_dipole = len(dipole_total)
          if len_energy != len_data :   
             raise ValueError(f"\033[91mir_freq_osc_str: length of"+\
                     f" energies is {len_energy}, expected length"+\
                     f" {len_data}.\033[00m")
          if len_energy != len_dipole :                    
             raise ValueError(f"\033[91mir_freq_osc_str: length of"+\
                     f" dipole_total is {len_dipole}, expected length"+\
                     f" {len_data}.\033[00m")   
          self.energies = np.array([energies[0]])
          self.dipole_total = np.reshape(dipole_total[0],(1,3))   
          for imode in self.mode_disp_seq:
              for ind in self.disp_indices:
                  self.energies = \
                    np.append(self.energies, energies[imode*self.ndisp+ind])
                  self.dipole_total = \
                    np.row_stack((self.dipole_total, dipole_total[imode*self.ndisp+ind]))
          #print(self.energies)          
          

      def calc_freq_osc_str(self, freq_unit = 'cm-1'):
          """
          This class method calculates the frequency and oscilator strength 
          using the the global method **calc_ir_freq_osc_str()** 
          described above.

          **Arguments:**

             **freq_unit** = A string defining the desired unit of IR frequency

          **Returns the following objects:**

             **omega** = 1D numpy array of frequencies

             **osc_str** = oscillator strengths using central difference
 
             **osc_str_f** = oscillator strength using forward difference 

             **osc_str_b** = oscillator strength using forward difference

             For **osc_str**, **osc_str_f**, and **osc_str_b**,
             each array has 4 rows. First three rows are
             Cartesian X, Y and Z components of the oscillator strengths
             while the last row is their sum, *i.e.* total oscillator strengths.
          """

          self.omega, self.osc_str, self.osc_str_f, self.osc_str_b =\
          calc_ir_freq_osc_str(
                            energies = self.energies, 
                            dipole_total = self.dipole_total, 
                            disp_steps = self.disp_steps, 
                            ngrid = self.ngrid, 
                            freq_unit = freq_unit)          
          self._refine()

      def print_freq_osc_str(self):
          """
          This class method prints the frequency and oscillator strengths in 
          the standard output
          """

          vib_freq = self.omega; osc_str_c = self.osc_str[-1]

          if self.osc_str_f is not None:
             osc_str_f = self.osc_str_f[-1]; osc_str_b = self.osc_str_b[-1] 
             print("\033[92m#       Normal Mode Frequency and Dipole Oscillator Strength(IR)          ")
             print("#-------------------------------------------------------------------------------------------------")
             print("#   Mode No           Freq(cm-1)           Oscillator Strength (Central/Forward/Backword)         |")
             print("#------------------------------------------------------------------------------------------------\033[00m")
             for i in range(len(vib_freq)):
                 imode = self.mode_list[self.mode_disp_seq[i]]
                 print(f"  {imode:6d}           {vib_freq[i]:10.2f}            " +
                         f"   {osc_str_c[i]:15.8g}" + f"   {osc_str_f[i]:15.8g}" + f"   {osc_str_b[i]:15.8g}")

          else:
             print("\033[92m#       Normal Mode Frequency and Dipole Oscillator Strength(IR)          ")
             print("#--------------------------------------------------------------------------------")
             print("#   Mode No           Freq(cm-1)           Oscillator Strength (Central)         |")
             print("#--------------------------------------------------------------------------------\033[00m")
             for i in range(len(vib_freq)):
                 imode = self.mode_list[self.mode_disp_seq[i]]
                 print(f"  {imode:6d}           {vib_freq[i]:10.2f}            " +
                         f"   {osc_str_c[i]:15.8g}")

      def _refine(self):
          """
          This private class method refines the frequencies and oscillator
          strengths based on user defined ``asr``, ``diff_cut`` and ``ratio_cut``

          **Returns the following object:**

            **omega_osc_str** = This is a list of 5 numpy arrays.
            
            (1) normal mode frequency (omega)

            (2) oscillator strength (osc_str)

            (3) Cartesian X component of oscillator strengths

            (4) Cartesian Y component of oscillator strengths

            (5) Cartesian Z component of oscillator strengths

          """
          if self.asr == 'crystal': self.nmstart = 3
          elif self.asr == 'lin':   self.nmstart = 5
          elif self.asr == 'poly':  self.nmstart = 6
          else:                     self.nmstart = 0
          vib_freq = self.omega
          # Initializing central difference results 
          osc_str = np.copy(self.osc_str[-1])
          osc_str_x = np.copy(self.osc_str[0])
          osc_str_y = np.copy(self.osc_str[1])
          osc_str_z = np.copy(self.osc_str[2])
          # Deciding b/w central , forward and backward differences if available
          refine = (self.osc_str_f is not None) & (self.diff_cut is not None) &\
                   (self.ratio_cut is not None)
          if refine:
             for i in range(len(osc_str)):
                 diff = np.abs(self.osc_str_f[-1,i] - self.osc_str_b[-1,i])
                 ratio = self.osc_str_f[-1,i]/self.osc_str_b[-1,i]
                 if diff < self.diff_cut: pass
                 elif (ratio <= self.ratio_cut) & (ratio >= 1/self.ratio_cut): pass
                 else:
                      if ratio > 1:   # We choose osc_str_b as it is smaller
                         osc_str[i] = self.osc_str_b[-1,i]
                         osc_str_x[i] = self.osc_str_b[0,i]
                         osc_str_y[i] = self.osc_str_b[1,i]
                         osc_str_z[i] = self.osc_str_b[2,i]
                      else:
                         osc_str[i] = self.osc_str_f[-1,i]
                         osc_str_x[i] = self.osc_str_f[0,i]
                         osc_str_y[i] = self.osc_str_f[1,i]
                         osc_str_z[i] = self.osc_str_f[2,i]

          indices_to_remove = np.where(np.array(self.mode_list) <= self.nmstart)[0]
          self.omega_osc_str = []
          for obj in [vib_freq, osc_str, osc_str_x, osc_str_y, osc_str_z]:
              self.omega_osc_str.append(np.delete(obj, indices_to_remove))
      
      def save(self):
          """
          This class method saves the **omega_osc_str** object as an 
          numpy .npz file to the path defined by ``save_path`` key for
          the **ir** class.

          **Keys to access the data from the .npz files are:**

            **omega** = Frequencies

            **osc_str** = Total oscillator strength

            **osc_str_x** = Cartesian X component of the oscillator strength

            **osc_str_y** = Cartesian Y component of the oscillator strength

            **osc_str_z** = Cartesian Z component of the oscillator strength

          """
          np.savez(self.save_path, 
                   omega = self.omega_osc_str[0], 
                   osc_str = self.omega_osc_str[1],
                   osc_str_x = self.omega_osc_str[2],
                   osc_str_y = self.omega_osc_str[3],
                   osc_str_z = self.omega_osc_str[4])

      def calc_spectra(self, line_profile='Lorentzian',
                        line_param = 10, step = 10, 
                        save_path = 'ir_spectra.npz'):
          """
          This class method caculates the IR spectra from the class object
          **omega_osc_str** using the global method **add_broadening()**.
          
          **Arguments:**

            **line_profile** = A string: 'Lorentzian' (Default) or 'Gaussian'

            **line_param** = A float defining width of the profile, Default
            value is 10.0

            **step** = A float defining the size of the bin of the
            returned spectra, default value is 10.0

            **save_path** = Full path to an .npz file where the spectra data
            would be saved. Default value is ir_spectra.npz.

          **Returns:**

            All of the following objects are numpy 2D arrays with 2 rows:

            (1) The first row contains frequencies (X-axis of the IR spectra).

            (2) The second row contains intensities (Y-axis of the spectra)

            The created objects names (as well as keys to access the data
            from the *.npz. files) are:

                **spectra** = Total IR spectra

                **spectra_x** = IR spectra contributed by X-component 
                of the oscillator strength

                **spectra_y** = IR spectra contributed by Y-component
                of the oscillator strength

                **spectra_z** = IR spectra contributed by Y-component
                of the oscillator strength
          """

          self.spectra =  add_broadening(
                          freq = self.omega_osc_str[0],
                          osc_str = self.omega_osc_str[1])
          self.spectra_x = add_broadening(
                          freq = self.omega_osc_str[0],
                          osc_str = self.omega_osc_str[2])
          self.spectra_y = add_broadening(
                          freq = self.omega_osc_str[0],
                          osc_str = self.omega_osc_str[3])
          self.spectra_z = add_broadening(
                          freq = self.omega_osc_str[0],
                          osc_str = self.omega_osc_str[4])
          np.savez(save_path, 
                   spectra = self.spectra,
                   spectra_x = self.spectra_x,
                   spectra_y = self.spectra_y,
                   spectra_z = self.spectra_z)
          

class qbox_ir(ir):
      """
      ===================================================
      CLASS Qbox IR
      ===================================================
      This class parses qbox outputs from *NMFD/ENMFD/NMS/ENMS* calculations and 
      can calculate normal mode frequencies, IR oscillator strengths, IR 
      spectra etc. Base class **qbox_ir** class is **ir** class described above.
      Therefore, **qbox_ir** contains all the methods that **ir** contains 
      and their usage, keys arguments or internal objects are similar. 
      Therefore, they wont be described again for **qbox_ir**. 
      Below we will discuss the arguments that are specific to the **qbox_ir** 
      class.

      **Arguments:**

        **qb_output_path** = This is a mandatory argument accepting a string
        defining the *full directory path** to the qbox outputs containing
        NMFD/ENMFD/NMS/ENMS calculations

        **qb_prefix** = This is another mandatory argument accepting a string
        defining the prefix of the qbox calculations.

        .. tip::
           If your qboux outputs are: *enmfd-1.r, enmfd-2.r, enmfd-3.r,...,* 
           then your input would be ``qb_prefix = 'enmfd'``.

        **n_qb_skip** = The number of first qbox scf calculations (in each output 
        file) to discard. The default value is 0.

        .. tip::
           Here is a scenario when we may need this argument by making it non-zero.
           For low band gap system, often the first SCF cannot be converged without
           ``set nempty <nonzero>``. However, this should not be used while 
           calculating dipole moment. In this case a work around is performing first
           SCF calculation with non-zero nempty value. After converging this 
           calculations; we recompute dipole moment by setting the nempty to 0 
           for the first frame and subsequent frames. 
           In this case, within one output, we should discard the 
           first SCF calculation for the IR spectra calculation. 
           We can do that by setting ``n_qb_skip = 1``.

        **corr_dipole_mom** = If true, dipole moment shifts (jumps) of the 
        undisplaced structure with respect to the geometry optimized structure 
        is corrected. Default is True.
      """
      def __init__(self, file_path, qb_output_path, qb_prefix,
                  n_qb_outfile = 10000, n_qb_skip = 0, corr_dipole_mom = True,
                  mode = None, deltax = None, deltae = None, ngrid = None, # required if xml file is input
                  disp_indices = None, nmode_only = None, asr = None,  # required if the log file is supplied
                  diff_cut = 1e-3, ratio_cut = 3,
                  save_path = 'ir_freq_osc_str.npz'): 
          super(qbox_ir,self).__init__(file_path,mode,deltax,deltae,
                  ngrid, disp_indices, nmode_only, asr, diff_cut, ratio_cut,save_path)

          self.qb_output_path = qb_output_path
          self.qb_prefix = qb_prefix
          self.n_qb_outfile = n_qb_outfile; self.skip = n_qb_skip
          self.corr_dipole_mom = corr_dipole_mom
          self._get_energy_dipole()

      def _get_energy_dipole(self):
          """
          This private class method parse the qbox outputs and arrange the
          total dipole moments, energies etc.
          """
          qbouts = []
          for i in range(self.n_qb_outfile):
              try:
                 qb_out_path = f"{self.qb_output_path}/{self.qb_prefix}-{i+1}.r"
                 qbouts.append(qbox(file_path = qb_out_path, io = 'r'))
              except FileNotFoundError:
                 break

          if qbouts[0].dipole_total is not None:
             dipole_total = qbouts[0].dipole_total[self.skip:]
          else:
             dipole_total = None
          energies = qbouts[0].etotals[self.skip:]
          cell = qbouts[0].cell

          for i in range(1,len(qbouts)):
              if dipole_total is not None:
                 dipole_total = np.vstack((dipole_total,qbouts[i].dipole_total[self.skip:]))
              energies = np.concatenate((energies,qbouts[i].etotals[self.skip:]))

          ## Removing the discontinuity of dipole_moment by removing the jumps
          if dipole_total is not None:
             if self.corr_dipole_mom: 
                dipole_total = remove_dipole_jumps(dipole_total, cell)
             else: pass
          else:
             print("Dipole moments are not found in qbox outputs. Only frequencies can be calculated.")
             dipole_total = np.zeros(forces.shape,np.float64)      
          self.arrange_energies_dipoles(energies,dipole_total)

          del qbouts, energies, dipole_total, cell

