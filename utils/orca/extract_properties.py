#!/usr/bin/env python
# This file is part of PyEPFD
# Copyright (c) 2024 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

"""
This script is an example of how orca Kohn-Sham eigenvalues 
and various other properties (energies, forces, charge- &
spin- populations can be extracted and stored into files 
that can be post-processed with pyepfd.
"""

import sys, os, time
import numpy as np
from pyepfd.coord_util import *
from pyepfd.constants import *

def get_patterns(filepath):
    """
    It gets the pattern of the line where eigenvalues, Mulliken and
    Lowdin charges are written. It also gets the atom_symbols
    Should be used only for the first trajectory file

    Args:
        filepath = Full path to the orca single point output

    Returns:
        atom_symbols = A list of atom symbols
        spin_polarized = A boolin. True if its a 
                         spin polarized calculation
        population_pattern = A pattern where charge (Mulliken, Loewdin) 
                         info are printed.
        orb_pattern = A list of strings containing first 17 characters 
                      of the lines where orbital energies are printed
        orb_down_pattern = A list of strings. This would be non-empty
                      for an UKS calculation. Like before, it contains
                      the pattern for the down spin orbital energies.
                 
    """
    fil = open(filepath,'r')
    lines = fil.readlines()
    nlines = len(lines)
    i_orb_header = None; i_orb_up_header = None; i_orb_down_header = None
    orb_pattern = []
    orb_down_pattern = []
    population_pattern = []
    atom_symbols = []
    for iline,line in enumerate(lines):
        if 'ORBITAL ENERGIES' in line: i_orb_header = iline
        if 'MULLIKEN POPULATION ANALYSIS' in line: i_mull_header = iline
        if 'SPIN UP ORBITALS' in line: i_orb_up_header = iline
        if 'SPIN DOWN ORBITALS' in line: i_orb_down_header = iline
    
    if i_orb_up_header is None:
       spin_polarized = False 
       for iline in range(i_orb_header+4,i_mull_header-2):
           if bool(re.fullmatch(r'^[^a-zA-Z]*$', lines[iline])):
               orb_pattern.append(lines[iline][:17])
           else:
               break
    else:
       spin_polarized = True 
       for iline in range(i_orb_up_header+2,i_orb_down_header-1):
           if bool(re.fullmatch(r'^[^a-zA-Z]*$', lines[iline])):
              orb_pattern.append(lines[iline][:17])
           else:
              break
       for iline in range(i_orb_down_header+2,i_mull_header-2):
           if bool(re.fullmatch(r'^[^a-zA-Z]*$', lines[iline])):
              orb_down_pattern.append(lines[iline][:17])
           else:
              break
    for iline in range(i_mull_header+6,nlines):
        if 'Sum of atomic charges' in lines[iline]: break
        pattern = lines[iline].split(':')[0]
        population_pattern.append(pattern+":")
        atom_symbols.append(pattern.split()[1])

    return atom_symbols, spin_polarized, population_pattern,\
           orb_pattern, orb_down_pattern 


def extract_eigenvalue(filepath, pattern, ispin=0, repeat_pattern=False):
    """ Returns one eigenvalue in eV from an orca output"""
    value = grep(filepath, pattern, cols = 3)
    if value.ndim == 0:
       eigenvalue = float(value)
    else: 
       if repeat_pattern: eigenvalue = value[-2:][ispin]
       else: eigenvalue = value[-1] 
    return eigenvalue

def extract_etotal(filepath):
    """ Returns final single point energy in Ha from orca output """
    value = grep(filepath, 'FINAL SINGLE POINT ENERGY', cols = 4)
    return value


def extract_population(filepath, patterns, nspin=1):
    """
    Args: 
        filepath = Full path to the file
        pattern = A list of population pattern
        nspin = 1 for spin-unpolarized; 2 for spin-polarized

    Returns:
        mulliken = muliken populations
        loewdin = loewdin populations
    """
    mulliken_charge = []; loewdin_charge = [] 
    mulliken_spin = []; loewdin_spin = []
    for pattern in patterns:
        col = len(pattern.split())
        if nspin == 1: 
            value = grep(filepath, pattern, cols = col)[-2:]
            mulliken_charge.append(value[0])
            loewdin_charge.append(value[1])
        elif nspin == 2:
            value = grep(filepath, pattern, cols = (col,col+1))[-2:]
            mulliken_charge.append(value[0,0])
            loewdin_charge.append(value[1,0])
            mulliken_spin.append(value[0,1])
            loewdin_spin.append(value[1,1])
        else:
            raise ValueError(
            "orca_util/extract_population: Allowed values of nspin are 1 or 2") 
            
    return np.array(mulliken_charge), np.array(loewdin_charge), \
           np.array(mulliken_spin), np.array(loewdin_spin) 


def read_engrad(filepath):
    """ This function extracts the atomic symbols, coordinates and
        forces from an orca engrad file 
        Args:
            filepath = full path of the orca.engrad

        Returns:
            atoms = List of atomic symbols
            coords = An np array of length 3*N containing forces
            forces = An np array of length 3*N containing forces
            etotal = Total energy 
    """
    if os.path.exists(filepath):
       fil = open(filepath, 'r')
       lines = fil.readlines()
       nline = len(lines)
       for iline,line in enumerate(lines):
           if 'coordinates' in line: 
              breakpoint = iline
              break
       len_block2 = nline - breakpoint   
       block1_data = np.genfromtxt(filepath,
                skip_footer=len_block2, dtype=np.float64)
       natoms = int(block1_data[0])
       etotal = block1_data[1]
       forces = block1_data[2:]
       block2_data = np.genfromtxt(filepath,
                skip_header=breakpoint, dtype=np.float64)
       
       atoms = [atom_symbols[int(element)] \
               for element in block2_data[:,0]]
       coords = block2_data[:,1:4].flatten()
                  
    else:
       atoms = None; forces = None; coords = None; etotal = None
    return atoms, coords, forces, etotal   


def extract_properties(path, frames, orbitals, orca_prefix = 'orca-sp', atom_indices=None):
    """ 
    Args:
        path = full path to the root directory where collection of
                  directories of orca single-point calculations 
                  of each frames are presnet.
        frames = A tuple defining the ranges of frames to be extracted

        orbitals = A tuple defining the ranges of orbital energies to 
                   be extracted
        
        atom_indices = A python list of atom indices 
                       (like orca uses; starting from 0)
    """
    init_time = time.time()
    print(f"Extracting properties from orca calculations")
    print(f"Frame range: \033[94m{frames}\033[00m")


    # For engrad.npz files
    frame_indices = []; coords = []; forces = []; etotals = [] 

    if frames is None: 
       frames = (0,0,1) 
       full_path = True # Is supplied path is the full path of calculations?
    else: full_path = False

    nframes = (frames[1]-frames[0]+1)//(frames[2])
    progress = nframes//10

    for i_progress, iframe in enumerate(range(frames[0],frames[1]+1, frames[2])):
        if full_path:
           outpath = f"{path}/{orca_prefix}.out" 
           engrad  = f"{path}/{orca_prefix}.engrad"
        else:
           outpath = f"{path}/frame-{iframe}/{orca_prefix}.out"
           engrad  = f"{path}/frame-{iframe}/{orca_prefix}.engrad"   
        coords = []; forces = []; etotals = []
        if iframe == frames[0]:
           atom_symbols, spin_polarized, population_pattern, \
           up_pattern, down_pattern = get_patterns(outpath)

           if atom_indices == None:
              atom_indices = list(range(len(atom_symbols))) 

           etotalfile = open(f"{path}/etotals.dat", 'w+')
           etotalfile.write(f"# Total Energy (Eh) for frames: {frames} \n")

           eigvalfile = \
            open(f"{path}/is_0_orb-{orbitals[0]}-{orbitals[1]}.dat", 'w+')  
           for iorb in range(orbitals[0],orbitals[1]+1,orbitals[2]):
               eigvalfile.write(f"#Orbital-{iorb}   ")
           eigvalfile.write("\n")    

           m_charge_file = open(f"{path}/mulliken_charges.dat", 'w+')
           l_charge_file = open(f"{path}/loewdin_charges.dat", 'w+')
           m_charge_file.write("# "); l_charge_file.write("# ")
           for iatom in atom_indices:
               m_charge_file.write(f"{atom_symbols[iatom]} ")
               l_charge_file.write(f"{atom_symbols[iatom]} ")
           m_charge_file.write("\n"); l_charge_file.write("\n")

           if spin_polarized:
              eigvalfile2 = \
                open(f"{path}/is_1_orb-{orbitals[0]}-{orbitals[1]}.dat", 'w+') 
              for iorb in range(orbitals[0],orbitals[1]+1,orbitals[2]):
                  eigvalfile2.write(f"#Orbital-{iorb}   ")
              eigvalfile2.write("\n")    
                
              m_spin_file = open(f"{path}/mulliken_spins.dat", 'w+')
              l_spin_file = open(f"{path}/loewdin_spins.dat", 'w+')
              m_spin_file.write("# "); l_spin_file.write("# ")
              for iatom in atom_indices:
                  m_spin_file.write(f"{atom_symbols[iatom]} ")
                  l_spin_file.write(f"{atom_symbols[iatom]} ")
              m_spin_file.write("\n"); l_spin_file.write("\n")

        etotal = extract_etotal(outpath)

        if etotal.ndim == 0:
           etotals.append(etotal)
           etotalfile.write(f" {etotal:20.12g} \n")
        else:
           etotals.append(etotal[-1])
           etotalfile.write(f" {etotal[-1]:20.12g} \n")

        for iorb in range(orbitals[0], orbitals[1]+1, orbitals[2]):
            repeat_pattern = up_pattern[iorb] in down_pattern
            eigenvalue = extract_eigenvalue(outpath,up_pattern[iorb],0, repeat_pattern)
            eigvalfile.write(f"{eigenvalue:13.8g} ")
            if iorb == orbitals[1]: eigvalfile.write("\n")
            if spin_polarized:
               repeat_pattern = down_pattern[iorb] in up_pattern 
               eigenvalue = extract_eigenvalue(outpath,down_pattern[iorb],1,repeat_pattern)
               eigvalfile2.write(f"{eigenvalue:13.8g} ")
               if iorb == orbitals[1]: eigvalfile2.write("\n")

        if spin_polarized: nspin = 2
        else: nspin = 1
        mulliken_charge, loewdin_charge, mulliken_spin, loewdin_spin = \
            extract_population(outpath,population_pattern,nspin)

        for iatom in atom_indices:
            m_charge_file.write(f" {mulliken_charge[iatom]:12.6f}  ")
            l_charge_file.write(f" {loewdin_charge[iatom]:12.6f}  ")
            if spin_polarized:
               m_spin_file.write(f" {mulliken_spin[iatom]:12.6f}  ") 
               l_spin_file.write(f" {loewdin_spin[iatom]:12.6f}  ")
        m_charge_file.write(" \n"); l_charge_file.write("\n")
        if spin_polarized:
           m_spin_file.write("\n"); l_spin_file.write("\n") 

        #Reading engrad files if exists
        if os.path.exists(engrad):
           frame_indices.append(iframe) 
           _, coord, force, _ = read_engrad(engrad) 
           coords.append(coord); forces.append(force)

        if (i_progress % progress == 0) & (i_progress != 0):
           current_time = time.time()
           elapsed_time = current_time - init_time
           print(f"\033[94m{i_progress}/{nframes}\033[00m"+\
                   f" frames processed in \033[94m{elapsed_time:9.3f}\033[00m s.") 
    
    # closing files
    etotalfile.close(); eigvalfile.close()
    m_charge_file.close(); l_charge_file.close()
    if spin_polarized:
       eigvalfile2.close(); m_spin_file.close(); l_spin_file.close()
    
    # writing engrad.npz file
    if len(forces) != 0:
       np.savez(f"{path}/engrad.npz",
                atoms = np.array(atom_symbols),
                frames = np.array(frame_indices),
                coords = np.array(coords),
                forces = np.array(forces),
                etotals = np.array(etotals))
    final_time = time.time()
    elapsed_time = final_time - init_time
    print("\033[92m\nProperty extraction" + \
            f" finished in {elapsed_time:9.3f} s.\033[00m")   
    print("*************************************************")    


    print(f"Total single-point energies are written at: \n\033[92m" +\
          f"   {path}/etotals.dat\033[00m")
    if not spin_polarized:
        print(f"Orbital energies are written at : \n\033[92m" +\
              f"   {path}/is_0_orb-{orbitals[0]}-{orbitals[1]}.dat\033[00m")
    else:
        print(f"SPIN UP orbital energies are written at : \n\033[92m" +\
              f"   {path}/is_0_orb-{orbitals[0]}-{orbitals[1]}.dat\033[00m")
        print(f"SPIN DOWN orbital energies are written at : \n\033[92m" +\
              f"   {path}/is_1_orb-{orbitals[0]}-{orbitals[1]}.dat\033[00m")
    print(f"Mulliken charges are written at: \n\033[92m" +\
          f"   {path}/mulliken_charges.dat\033[00m")
    print(f"Loewdin charges are written at: \n\033[92m" +\
          f"   {path}/loewdin_charges.dat\033[00m")
    if spin_polarized:
            print(f"Mulliken spin populations are written at: \n\033[92m" +\
                  f"   {path}/mulliken_spins.dat\033[00m")
            print(f"Loewdin spin populations are written at: \n\033[92m" +\
                  f"   {path}/loewdin_spins.dat\033[00m")

    if len(forces) != 0:
       print("*************************************************") 
       print(f"EnGrad informations are written at: \n\033[92m" +\
             f"   {path}/engrad.npz\033[00m")
       print(f"Keywords for the engrad.npz file are:\n" +\
             f"   atoms   = a list of atoms symbols,\n" +\
             f"   frames  = a list of original frame indices,\n"+\
             f"   coords  = a 2D numpy of coordinates (au),\n" +\
             f"   forces  = a 2D numpy of forces (au),\n" +\
             f"   etotals = a 1D numpy of energies (au)\n"+\
             f"In the last 3 arrays, \n   0-th dimension corresponds to frames")
      
    print("*************************************************")
    return 

def print_help():
    sys.exit(f"================================================\n"+\
            f"      ORCA EXTRACT_PROPERTIES HELP MESSAGES \n"+\
            f"=================================================\n"+\
            f"\033[91mUsage (optional arguments in [...]):\n"+\
            f"extract_properties.py -p \033[92m<full_path>\033[91m "+\
            f"-n \033[92m<n_orbital>\033[91m"+\
            f" [-f \033[92m<frames>\033[91m] "+\
            f"[-o \033[92m<prefix>\033[91m] [-a \033[92m<atom_indices>\033[91m] \n\033[00m"+\

            f"\nCommand line argunemts: \n\n"+\
            f"\033[91m -h, --help   =\033[00m prints help message.\n\n"+\
            f"\033[91m -p, --path   =\033[00m \033[92m<full_path>\033[00m"+\
            f" to the orca calculations.\n"+\
            f"                For a single frame \033[92m<full_path>\033[00m of the directory"+\
            f" where .out file \n"+\
            f"                is present.\n"+\
            f"                For many frames, \033[92m<full_path>\033[00m of the directory"+\
            f" where individual \n"+\
            f"                frame directories exist.\n\n"

            f"\033[91m -o, --orca   =\033[00m"+\
            f" A string defining \033[92m<prefix>\033[00m of orca outputs.\n"+\
            f"                The default is 'orca-sp'.\n\n"+\

            f"\033[91m -n, --n_orb  =\033[00m The range of orbital indices"+\
            f"(\033[92m<n_orbital>\033[00m) to be extracted.\n"+\
            f"                The indices are the same as with orca-output (starts with 0)\n"+\
            f"                The argument \033[92m<n_orbital>\033[00m"+\
            f" may take 3 integers separated by ':'.\n"+\
            f"                These integers define \033[92mstart:end:step\033[00m"+\
            f" of the orbital indices.\n"+\
            f"                  [a] only providing \033[92mstart\033[00m"+\
            f" would extract start orbital only.\n"+\
            f"                  [b] if only \033[92mstart:end\033[00m"+\
            f" provided then \033[92mstep = 1\033[00m.\n\n"+\

            f"\033[91m -f, --frames =\033[00m The range of \033[92m<frames>\033[00m.\n"+\
            f"                The argument \033[92m<frames>\033[00m"+\
            f" may take 3 integers separated by ':'.\n"+\
            f"                These integers define \033[92mstart:end:step\033[00m"+\
            f" of the trajectory frames.\n"+\
            f"                  [a] only providing \033[92mstart\033[00m"+\
            f" would extract start frame only.\n"+\
            f"                  [b] if only \033[92mstart:end\033[00m"+\
            f" provided then \033[92mstep = 1\033[00m.\n\n"+\

            f"\033[91m -a, --atoms  =\033[00m The list of \033[92m<atom_indices>\033[00m "+\
            f"(starting with 0 as orca output)\n"+\
            f"                for which we want to extract (charge/spin) populations.\n"+\
            f"                The argument \033[92m<atom_indices>\033[00m either takes\n"+\
            f"                    (1) many integers separated by ',' defining "+\
            f"the list of atom indices,\n"+\
            f"                or\n"+\
            f"                    (2) Integers (max. 3) separated by ':' defining ranges.\n"+\
            f"                     See the frames above for definition of ranges."
            )
    return

def extract_range(string):
    inputs = string.split(':')
    for inp in inputs:
        if bool(re.match(r'^[+]?\d+$', inp)):  #checking if inputs are valid integers
           pass
        else: 
           print("\033[91mInput range not understood. See below for help.\033[00m")
           print_help()
           break
    if   len(inputs) == 1: ranges = (int(inputs[0]),int(inputs[0]),1)
    elif len(inputs) == 2: ranges = (int(inputs[0]),int(inputs[1]),1)
    elif len(inputs) == 3: ranges = (int(inputs[0]), int(inputs[1]), int(inputs[2]))
    else:
        print("\033[91mInput range not understood. See below for help.\033[00m")
        print_help()
    return ranges    

def atom_lists(string):
    atom_lists = []
    if ':' in string: 
        ranges = extract_range(string)
        atom_lists = list(range(ranges[0],ranges[1]+1,ranges[2]))
    else:
        inputs = string.split(',')
        for i in inputs:
            if bool(re.match(r'^[+]?\d+$', i)):
               atom_lists.append(int(i))
            else:
               print("\033[91matom_indices list not understood. Extracting all atoms.\033[00m") 
               atom_lists = None
    return atom_lists         


def main():
    nargs = len(sys.argv)
    if (nargs <= 2): print_help()
    elif 'h' in sys.argv[1]: print_help()
    frames = None
    atom_indices = None
    orca_prefix = 'orca-sp'
    orbital_range_found = False

    for iarg in range(1,nargs,2):
        if   '-p' in sys.argv[iarg]: 
             path = sys.argv[iarg+1]
        elif '-o' in sys.argv[iarg]:
             orca_prefix = sys.argv[iarg+1]
        elif '-n' in sys.argv[iarg]: 
              orbitals = extract_range(sys.argv[iarg+1])
              orbital_range_found = True
        elif '-f' in sys.argv[iarg]:
             frames = extract_range(sys.argv[iarg+1])
        elif '-a' in sys.argv[iarg]:    
             atom_indices = atom_lists(sys.argv[iarg+1])
        else:
             print("\033[92mComman line arguments not understood. See below for help.\033[00m")
    if not orbital_range_found:
       print("\033[91mThe ranges of orbital indices is a mandatory input.\033[00m")
       print_help()

    #print(f"path = {path}\n orbitals = {orbitals} ")
    #print(f"orca_prefix = {orca_prefix}")
    #print(f"frames = {frames}")
    #print(f"atom_indices = {atom_indices}")

    extract_properties(path = path, \
                       orbitals = orbitals,\
                       orca_prefix = orca_prefix,\
                       frames = frames, \
                       atom_indices = atom_indices)

if __name__ == "__main__":
     main()
