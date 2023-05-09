#!/usr/bin/python3
# generate a Qbox input file from an xyz file
# use: python3 xyz2qbox.py file.xyz

# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

import sys, math
import numpy as np
from functools import lru_cache

###### Length conversion divisor
conv2bohr= {
  "angstrom":    0.529177,
  "atomic_unit": 1.000000
           }

color = True
#### Put the correct path where you keep your pseudopotentials
pseudo_dir="../pseudos/"

###### Default unit parameters, Qbox commands, Qbox variables ########
pos_unit= "angstrom"
cell_unit="angstrom" 
default_qbox_1st_cmd = " randomize_wf, run -atomic_density 0 100 10"
default_qbox_cmd = " run 0 60 10"   
default_plot_cmd = None          #" plot -density den"           
default_spectrum_cmd = None       
ecut_default = 50.0
wf_dyn_default = "JD"
xc_default = "PBE"
scf_tol_default = 1.e-8
nempty_default = 100
nspin_default = 1
delta_spin_default = None
net_charge_default = 0
pseudo_default = 'ONCV_PBE-1.0'
qbox_cell_cmd = " set cell "
save_wf_default = 'n'


###### Reading xyz file ###############################
if len(sys.argv) < 2:
    sys.exit("\033[91mNo xyz file given as input. \nUsage: xyz2qbox.py file.xyz\033[00m")

infilname = sys.argv[1]
infil = open(infilname)
lines= infil.readlines()
buf = lines[0].split()
nat = int(buf[0])
total_frames = int(len(lines)/(nat+2))
remainder = len(lines)%(nat+2)

if remainder != 0:
   sys.exit("\033[91mFile: "+str(sys.argv[1])+ " is truncated\033[00m")

##### color escape sequence variables ##########################################
if color:
   warning = "\033[91m"                ## Red for warning
   statement = "\033[95m"             ## Pink for printing statements
   prompt = "\033[92m"                ## Green promt for asking input
   cached = "\033[94m"                ## White for printing default/cached value
   colorexit="\033[00m"               ## Exiting color
else:
   warning = ""; statement = ""; prompt = ""; cached = ""; colorexit = ""
################################################################################

info_print=True
exit=False
if len(sys.argv) == 3:
   if sys.argv[2].lower() == 'quit' :              ### A way to exit the code after reading only the input file
      exit=True                                    ### Or skipping the info section
   elif sys.argv[2].lower() == 'no-info' :
      info_print=False

if info_print:   
   print(statement+"File "+cached + str(infilname)+ statement +" has "+ cached + str(nat) + \
      statement + " number of atoms in each frame and a total "+ cached+ \
      str(total_frames) + statement + " number of frames."+ colorexit)

########## Reading 1st frame and checking different species present in the xyz file 
species_set = set()
for iline in range(2,nat+2):
    species_name = lines[iline].split()[0]
    species_set.add(species_name)

if info_print:
   print(statement+"No of species: "+cached+str(len(species_set))+colorexit)

all_species=''
for species in species_set:
    all_species=all_species+'\n'+species+"_species"

if info_print:
   print(statement+"Present species are: "+cached+all_species +colorexit)


########## Checking cell mode and deciding whether it is an i-pi output 
cell_tag = None
buf = lines[1].split()
if 'CELL(abcABC):' in buf:
   cell_tag='CELL(abcABC):'

if cell_tag is not None:
   if ('x_centeroid{atomic_unit}' in buf) or ('positions{atomic_unit}' in buf):
       pos_unit='atomic_unit'
   if 'cell{atomic_unit}' in buf:
       cell_unit='atomic_unit'
   if info_print:
      print(statement+"The file " +cached+infilname + statement+" is an i-PI output with" +prompt+\
         " pos_unit: "+ cached + pos_unit + statement + " and "+prompt+"cell_unit: " + cached +\
           cell_unit + colorexit)

if exit:                              ### A way to exit the code after reading only the input file
   if cell_tag is None:
      print('\n'+warning+"Cell parameters are not present/understood. \nPlease remember to use "+cached+\
        "set cell "+warning+"command once for cell parameters input."+colorexit)
   sys.exit("Exiting xyz2qbox.py")

### Reading user inputs or default values
start_frame = int(input(prompt+"Enter start frame number: "+statement+"(Default = "+ cached+\
                        "1" + statement + ") "+colorexit) or "1") -1
try:
    end_frame = int(input(prompt+"Enter last frame number: "+statement+"(Default = "+cached+\
                          str(total_frames) +statement+ ") "+colorexit))
except ValueError:
    end_frame = total_frames   

step_frame = int(input(prompt+"Enter step frame: "+statement+"(Default = "+cached+\
                        "1"+statement+") "+colorexit) or "1")
qbox_1st_cmd = str(input(prompt+"Enter qbox command for 1st iteration: "+statement+"(Default = "+cached+"' " +\
                     default_qbox_1st_cmd+ "'" + statement+\
           ")\nHint: more than one commands should be separated by a comma.\n"+colorexit)\
             or default_qbox_1st_cmd)

qbox_cmd = str(input(prompt+"Enter qbox run command: "+statement+"(Default = "+cached+"' " +\
                     default_qbox_cmd+ "'" + statement+\
           ")\nHint: more than one commands should be separated by a comma.\n"+colorexit)\
             or default_qbox_cmd) 

plot_cmd = str(input(prompt+"Enter qbox plot command: "+statement+"(Default = "+cached+"' " +\
                     str(default_plot_cmd)+ "'" + statement+")\n\
Hints:\n \
     (1) Example:"+cached+" plot options filename"+statement+" (without .cube extension) \n \
     (2) More than one commands should be separated by a comma.\n"+colorexit))\
             or default_plot_cmd

spectrum_cmd = str(input(prompt+"Enter qbox spectrum command: "+statement+"(Default = "+cached+"' " +\
                     str(default_spectrum_cmd)+ "'" + statement+")\n\
Hints:\n \
     (1) Example:"+cached+" spectrum options filename"+statement+" (without .dat extension) \n " +colorexit))\
             or default_spectrum_cmd

save_wf = str(input(prompt+"Do you want to save sample for each configurations (y/n)? "+\
          statement+"(Default = "+ cached+save_wf_default+statement+") "+colorexit) or save_wf_default)
                                     
outfn = str(input(prompt+"Enter filename of qbox input: "+statement+"(Default = "+cached+\
           "qbox.i"+statement+") "+colorexit) or "qbox.i")

#Qbox variable settings
xc = str(input(prompt+"Enter xc: "+statement+"(Default = "+cached+xc_default+statement+")"+\
               colorexit) or xc_default)
wf_dyn = str(input(prompt+"Enter wf_dyn: "+statement+"(Default = "+cached+wf_dyn_default+\
                    statement+") "+colorexit) or wf_dyn_default)
ecut = float(input(prompt+"Enter ecut (Ry): "+statement+"(Default = "+cached+str(ecut_default)+\
                   statement+") "+colorexit) or ecut_default)
scf_tol = float(input(prompt+"Enter scf_tol (Ry): "+statement+"(Default = "+cached+\
                 str(scf_tol_default)+statement+") "+colorexit) or scf_tol_default)
nempty = int(input(prompt+"Enter nempty: "+statement+"(Default = "+cached+str(nempty_default)+\
                   statement+") "+colorexit) or nempty_default)
nspin = int(input(prompt+"Enter nspin (1/2): "+statement+"(Default = "+cached+str(nspin_default)+\
                   statement+") "+colorexit) or nspin_default)
delta_spin = input(prompt+"Enter delta_spin: "+statement+"(Default = "+\
             cached+str(delta_spin_default)+statement+") "+colorexit) or delta_spin_default
net_charge = int(input(prompt+"Enter net_charge: "+statement+"(Default = "+\
             cached+str(net_charge_default)+statement+") "+colorexit) or net_charge_default)

pseudo = str(input(prompt+"Enter pseudopotential: "+statement+"(Default = "+cached+\
                   pseudo_default+statement+") "+colorexit) or pseudo_default)


### Opening output file
outfil = open(outfn,"w+")

@lru_cache(maxsize=32)
def abc2h(a, b, c, alpha, beta, gamma):
    # Returns a lattice vector matrix in upper triangular form 
    # given a description in terms of the lattice vector lengths 
    # and the angles in between. 

    h = np.zeros((3, 3), float)
    h[0, 0] = a
    h[0, 1] = b * math.cos(gamma)
    h[0, 2] = c * math.cos(beta)
    h[1, 1] = b * math.sin(gamma)
    h[1, 2] = (b * c * math.cos(alpha) - h[0, 1] * h[0, 2]) / h[1, 1]
    h[2, 2] = math.sqrt(c**2 - h[0, 2]**2 - h[1, 2]**2)
    return h


### Processing comment line if cell_tag != None; i.e., file is an i-pi output
def get_ipi_cell(line2):    #line2 is a string which is 2nd line of each trajectory frame
    cell_tag_index = line2.index(cell_tag)
    a = float(line2[cell_tag_index+1])
    b = float(line2[cell_tag_index+2])
    c = float(line2[cell_tag_index+3])
    alpha = np.deg2rad(float(line2[cell_tag_index+4]))
    beta  = np.deg2rad(float(line2[cell_tag_index+5]))
    gamma = np.deg2rad(float(line2[cell_tag_index+6]))

    h = abc2h(a, b, c, alpha, beta, gamma).flatten('F')/conv2bohr[cell_unit]

    cell_string = qbox_cell_cmd
    for i in range(9):
        cell_string = cell_string +' %12.6f'%h[i]
    return cell_string


### frame based coordinate string function
def write_string(frame,name,atom_index,x,y,z):
    if frame == 0:
       write_string = str(" atom   "+name+str(atom_index+1).zfill(len(str(nat)))+"   "+\
                      name+"_species"+' %12.6f   %12.6f   %12.6f\n' %(x,y,z))
    else:
       write_string = str(" move   "+name+str(atom_index+1).zfill(len(str(nat)))+\
                      "   to   "+' %12.6f   %12.6f   %12.6f\n' %(x,y,z))
    return write_string

#### Writing variables in Qbox input
outfil.write(" set xc "+xc+" \n"+\
             " set wf_dyn "+wf_dyn+" \n"+\
             " set ecut %6.2f\n"%(ecut)+\
             " set scf_tol %8.2e\n"%(scf_tol))
#if nempty>0:
#   outfil.write(" set nempty %4d\n"%(nempty))

#outfil.write(" randomize_wf\n")

#### Species and pseudo files
all_species_files=''
for species in species_set:
    all_species_files=all_species_files+'\n'+species+"_"+pseudo+".xml"
    outfil.write(" species  "+species+"_species "+pseudo_dir+species+"_"+pseudo+".xml\n")

#### Warning print
print(warning+"Warning!\nFiles: "+cached+ all_species_files + warning+\
       "\nmust be present in the following pseudo-potential directory.\n"+colorexit+pseudo_dir)
if cell_tag is None:
   print('\n'+warning+"Cell parameters are not present/understood. \nPlease remember to use "+cached+\
        "set cell "+warning+"command once for cell parameters input."+colorexit)  

### Reading XYZ file and preparing Qbox input
iframe = -1
for frame in range(start_frame,end_frame,step_frame):
    comment_string = "# Frame "+ str(frame+1) + "/"+ str(total_frames) + " from " + infilname

    iframe+=1

    if iframe == 0:
       iline=start_frame*(nat+2)+1
    else:
       iline+= (nat+2)*(step_frame-1)+2
 
    if cell_tag is None:
       comment_string = comment_string + '   ##'+ lines[iline].strip('\n')+'\n'
       outfil.write(comment_string)
    else:
       line2=lines[iline].split()  
       try:  bead_index = line2.index("Bead:")
       except ValueError: bead_index = len(line2)
       try:  step_index = line2.index("*Step:")
       except ValueError: step_index = len(line2)
       try:
          comment_string = comment_string + ' Step:  '+ line2[step_index+1] +\
                        " i-PI-Bead: " + line2[bead_index+1]+"\n"
       except ValueError:
          comment_string = comment_string +'#\n' 
       except IndexError:
          comment_string = comment_string +'#\n'
       cell_string = get_ipi_cell(line2)+"\n"
       outfil.write(comment_string+cell_string)

    for atom_index in range(nat):
        iline+=1
        buf = lines[iline].split()
        name=buf[0]
        x = float(buf[1])/conv2bohr[pos_unit]
        y = float(buf[2])/conv2bohr[pos_unit]
        z = float(buf[3])/conv2bohr[pos_unit]
        outfil.write(write_string(iframe,name,atom_index,x,y,z))

    if iframe == 0:
       if nempty>0:
          outfil.write(" set nempty %4d\n"%(nempty))

       if nspin != 1:
          outfil.write(" set nspin %4d\n"%(nspin))

       if delta_spin is not None:
          outfil.write(" set delta_spin " + str(delta_spin) + "\n")

       if net_charge != 0:
          outfil.write(" set net_charge %5d\n"%(net_charge))

       for cmd in qbox_1st_cmd.split(','):
           outfil.write(cmd+"\n")
    else:
       for cmd in qbox_cmd.split(','):
           outfil.write(cmd+"\n")

    if plot_cmd is not None:
       for cmd in plot_cmd.split(','):
           outfil.write(cmd+"_frame-"+str(frame+1)+".cube"+"\n")

    if spectrum_cmd is not None:
       outfil.write(spectrum_cmd+"_frame-"+str(frame+1)+".dat"+"\n")
    
    if save_wf[0].lower() == 'y':
       outfil.write(" save sample_frame-"+str(frame+1)+".xml \n")
