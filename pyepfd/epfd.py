"""
This Module contains the metods and epfd class that an user would need to 
compute Electron Phonon Renormalization using  frozen phonon finite 
difference method.
"""
import sys
import numpy as np
from pyepfd.ipi_file_read import ipi_info
from pyepfd.pyepfd_io import *
from pyepfd.constants import *
from pyepfd.degeneracy_class import degeneracy
from pyepfd.elph_classes import *

inp_dir = "./"
out_dir = "./"

class fph:
      """
      ===========================================================
      Class Frozen Phonon Harmonic
      ===========================================================
      This class instantiates ipi_info, degeneracy and epce_calculators
      to do the all essentials calculations. This class also has the methods
      a user might require.

        **Arguments:**

         **eigval_file** =  Name of the file containing Kohn-Sham eigen values (band energies).

         **etotal_file** =  Name of the file containing BO energies (<etotal> for qbox). 

         **phonon_info_file** = Name of the file that contains information after an (E)NMFD phonon calculation.
         It should be an i-PI RESTART file is i-PI is used. Other wise it should be a pyepfd restart file.

         **overlap_file** = Name file containing overlap integrals. Default ``None``.

         **output_prefix** = Prefix of the output files

            .. warning::
                Here file names or prefixes are name but not full path
                file path should be given in **pyepfd.inp_dir** & **pyepfd.out_dir**.

         **degeneracy_cutoff** = *Float.* If energies of two or more bands within a set is smaller than this value
         they would be considered degenerate and their average band energy would be used.

         **vib_freq_unit** = Output unit for vibrational frequencies.
            Options are:
            **(1)** ``'Ha'`` , **(2)** ``'cm-1'``, **(3)** ``'eV'``, **(4)** ``'meV'``,
            **(5)** ``'kcal/mol'``, **(6)** ``'kJ/mol'``, **(7)** ``'K'``, **(8)** ``'THz'``.
            Default: ``'cm-1'``

         **epce_unit** = Output unit for  EPCE. Options are same as **vib_freq_unit**.
         Default: ``'meV'``
      """

      def __init__(self,eigval_file,etotal_file="etotal.dat",
                        phonon_info_file="phonon.xml", overlap_file=None,
                        degeneracy_cutoff=0.5,output_prefix = "epfd",
                        epce_unit="meV", vib_freq_unit="cm-1"):
        
          global inp_dir, out_dir
          if inp_dir[-1] != "/":
             inp_dir = inp_dir+"/"
          if out_dir[-1] != "/":
             out_dir = out_dir + "/"
    
          self.output_prefix = output_prefix
          self.epce_unit = epce_unit
          self.vib_freq_unit = vib_freq_unit

          energy = np.loadtxt(inp_dir+etotal_file)

          ph_file = open(inp_dir+phonon_info_file,'r+')
          root_tag = ph_file.readline()
          ph_file.close()
          if "<simulation" in root_tag:
             ipi = ipi_info(file_path=inp_dir+phonon_info_file)
             dynmat = ipi.dynmatrix; mode=ipi.vibration_mode
             mass = ipi.mass; asr = ipi.asr
             deltax = ipi.pos_shift; deltae = ipi.energy_shift
          elif "<pyepfd" in root_tag:
             pyepfd = read_pyepfd_info(file_path = inp_dir+phonon_info_file)
             dynmat = pyepfd.inp_dynmatrix; mode = pyepfd.phonon_mode
             mass = pyepfd.mass; asr = pyepfd.asr
             deltax = pyepfd.deltax; deltae = pyepfd.deltae
          else: raise SyntaxError("Root tag of the phonon_info file not understood.")    

          if overlap_file is not None:
             overlap_file = inp_dir + overlap_file
          self.logfile = open(out_dir+output_prefix+".pyepfd.log","w")
          self.epcefile = open(out_dir+output_prefix+".epce.dat","w")


          self.__get_orbital_info__(eigval_file=inp_dir+eigval_file)
          orbitals = degeneracy(eigval_file=inp_dir+eigval_file,\
                                overlap_file = overlap_file,\
                                degeneracy_cutoff = degeneracy_cutoff,\
                                logfile = self.logfile)

          self.eph = epce_calculator(dynmat = dynmat, mass = mass,\
                                     energy=energy, eigval=orbitals.eigval,\
                                     logfile = self.logfile,
                                     mode=mode, asr=asr,\
                                     deltax = deltax, deltae = deltae,\
                                     epce_unit=epce_unit, vib_freq_unit = vib_freq_unit)
          #self.eph.zpr.sort() 
          print("ZPR ("+ self.eph.epce_unit + ") for "+ output_prefix + ":") 
          for col in range(self.eph.no_of_orbitals):
              print(str(self.orbital_info[col])+"  "+str(self.eph.zpr[col]*ha2unit[self.eph.epce_unit]))
          self.__write_epce__()

      def eigval_at_temp(self,temp_grid,eigval_unit="eV"):
          """
          This method computes the electron-phonon renormalized band energies 
          (Kohn-sham eigenvalues) at finite temperature

            **Arguments:**

                **temp_grid** = A python *float* list containig several temperatures

                **eigval_unit** = Unit in which renormalized band energies/ eigenvalues 
                should be returned. Default ``'eV'``. Options are same as **vib_freq_unit**.

            **Returns:**
                **output_prefix.tscan.eigval** file containing temperatures and renormalized
                band energies (Kohn-Sham eigenvalues).
                
          """
          self.renorm_eigval = np.zeros((len(temp_grid),self.eph.no_of_orbitals),np.float64)   
          for itemp in range(len(temp_grid)):
              self.renorm_eigval[itemp,:] = self.eph.renorm_eigval_at_temp(temp_grid[itemp])*ha2unit[eigval_unit]
          write_temp_vs_energy(temp_grid,self.renorm_eigval,self.orbital_info,self.output_prefix)
   
      def __get_orbital_info__(self,eigval_file):
          """
          Collects orbital informations such as indices from
          eigval files.
          """
          eigval_file_object = open(eigval_file,"r")
          eigval_file_header = eigval_file_object.readline()
          eigval_file_object.close()
          orbital_info = eigval_file_header.split()
          self.orbital_info = []
          for element in orbital_info:
              self.orbital_info.append(element[1:])

      def __write_epce__(self):
          """
          This method writes EPCE information in a dile named **output_prefix.epce.dat**.
          """
          self.epcefile.write("# Column-1 ==> Normal Mode Number\n" )
          self.epcefile.write("# Column-2 ==> Normal Mode Frequency (" + self.vib_freq_unit +")")
          self.epcefile.write("calculated based on normal mode hessian.\n")
          for col in range(self.eph.no_of_orbitals):
              self.epcefile.write("# Column-"+str(col+3)+" ==> EPCE: value("+ self.epce_unit+ \
                                    ") [percentage] for " + self.orbital_info[col] +"\n")
          for mode in range(len(self.eph.nm_disp)-self.eph.nmstart):
              self.epcefile.write("%6d  %14.6f"\
              %(mode+self.eph.nmstart+1,self.eph.vib_freq[mode]*ha2unit[self.vib_freq_unit])) 
              for orbital in range(self.eph.no_of_orbitals):
                  epce_val = self.eph.epce[mode,orbital]*ha2unit[self.epce_unit]
                  epce_frac = self.eph.epce[mode,orbital]/self.eph.epce_sum[orbital]*100
                  self.epcefile.write("%12.6g [ %7.3f ]  "%(epce_val, epce_frac)) 
              self.epcefile.write("\n")

          self.epcefile.write("#   EPCE SUM (" + self.epce_unit + ") =   ")
          for orbital in range(self.eph.no_of_orbitals):
              self.epcefile.write("%12.6g [ 100.000 ]  "%(self.eph.epce_sum[orbital]*ha2unit[self.epce_unit]))
          self.epcefile.write("\n")
          self.epcefile.write("#      ZPR (" + self.epce_unit + ") =     ")
          for orbital in range(self.eph.no_of_orbitals):
              self.epcefile.write("%12.6g [ 100.000 ]  "%(self.eph.zpr[orbital]*ha2unit[self.epce_unit]))
          self.epcefile.write("\n")


def temp_grid(T_start, T_end, NT):
          """
            Given a start-temperature (T_start), end-temperature (T_end) and 
            number of temperature points (NT) this method creates a temperature grid 
            and returns as a numpy array
          """  
          if NT != 1:
             grad_T = float(T_end - T_start)/float(NT-1)
          else:
             grad_T = 0.00000000
          T = np.array([ float(T_start)+float(itemp)*grad_T for itemp in range(NT)])
          return T

def write_temp_vs_energy(temp_grid,energy,col_header,output_prefix,energy_unit="eV"):
    """
      This function writes the temperature and thermal averages in a file

        **Arguments:**
         
            **temp_grid** = Numpy *float* array of temperature grid

            **energy** = A numpy *float* array of same length as of temp_grid.
            This contains the thermal averages. 

            **col_header** = A list of *string* that is used as column header to store 
            informaition regarding the columns.
         
            **output_prefix** =  output file prefix. Suffix would be tscan.dat 
         
            **energy_unit** = The unit in which received energies are. Default ``'eV'``.
    """
    outfile = open(out_dir+output_prefix+".tscan.eigval","w")

    outfile.write("# Thermally averaged energies ("+ energy_unit +") are sorted in increasing order.\n")
    outfile.write("# Column-1 ==> Temperature(K)\n")
    if len(energy[0]) == len(col_header):
       for col in range(len(col_header)):
           outfile.write("# Column-"+str(col+2)+" ==>  "+col_header[col]+"\n")
    else:
       outfile.write("#Number of columns in energy data and header data are inconsistent!\n")

    for itemp in range(len(temp_grid)):
        outfile.write(" %9.2f "%(temp_grid[itemp]))
        for col in range(len(energy[0])):
            outfile.write(" %14.6f "%(energy[itemp,col]))  
        outfile.write("\n")

