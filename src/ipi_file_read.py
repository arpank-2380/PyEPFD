import xml.etree.ElementTree as ET
import numpy as np
import sys, os, time


class ipi_info:
      """
        This class reads and store essential information from an iPI restart file,
        that has been created after a successful completion of an 
        iPI NMFD/ENMFD phonon calculation
        Arg: Only the path of the iPI file
      """
      def __init__(self,file_path="RESTART"):
          init_time = time.time()
          file_tree = ET.parse(file_path)
          file_root = file_tree.getroot()
          
          ### Reading motion related informations
          motion_tree = file_tree.find("./system/motion")
          motion_mode = motion_tree.attrib["mode"]
          
          if motion_mode != "vibrations":
             sys.exit("Motion mode is not vibrations")
          
          vibrations_tree = motion_tree.find("vibrations")
          try: self.vibration_mode = vibrations_tree.attrib["mode"]
          except KeyError: self.vibration_mode = 'fd'   
          self.asr = vibrations_tree.find("asr")
          if self.asr is not None:
             self.asr = self.asr.text.strip()
          self.pos_shift = vibrations_tree.find("pos_shift")
          if self.pos_shift is not None:
             self.pos_shift =  float(self.pos_shift.text.strip())
          self.energy_shift = vibrations_tree.find("energy_shift")
          if self.energy_shift is not None:
             self.energy_shift = float(self.energy_shift.text.strip())
          
          dynmat_tree = vibrations_tree.find("dynmat")
          try: 
             if dynmat_tree.attrib["mode"] == "file":
                self.dynmatrix = np.loadtxt(dynmat_tree.text.strip())
          except KeyError:
                self.dynmatrix = None
          try:
             dynmat_shape = eval(dynmat_tree.attrib["shape"])
          except KeyError:
             dynmat_shape = None
          
          if (self.dynmatrix is None) & (dynmat_shape is not None):
             self.dynmatrix = np.array([float(element.strip(",")) \
             for element in dynmat_tree.text.split()[1:-1]]).reshape(dynmat_shape)
          
          ### Reading self.mass related informations
          self.mass_tree = file_tree.find("./system/beads/m")
          #print(self.mass_tree)
          if self.mass_tree is None:
             sys.exit("Mass information not found in file" + file_path)
          else:
             self.mass_shape = eval(self.mass_tree.attrib["shape"])   
             self.mass = np.array([[float(element.strip(",")), float(element.strip(",")),float(element.strip(","))] \
             for element in self.mass_tree.text.split()[1:-1]]).reshape(3*self.mass_shape)
  
          ### Reading self.coord ==> coordinates
          self.coord_tree = file_tree.find("./system/beads/q")
          if self.coord_tree is None:
              sys.exit("Optimized geometry coordinates not found in file" + file_path)
          else:
              self.coord_shape = eval(self.coord_tree.attrib["shape"])[1]
              #print(self.coord_shape)
              self.coord = np.array([float(element.strip(",")) for element in self.coord_tree.text.split()[1:-1]])
              #print(self.coord[0])

          ### Reading  atoms
          self.atom_tree = file_tree.find("./system/beads/names")
          self.atoms = []
          if self.atom_tree is None:
              sys.exit("Atoms not found in file" + file_path)
          else:
              for element in self.atom_tree.text.split()[1:-1]:
                  self.atoms.append(element.strip(","))
          #print(self.atoms)

          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on ipi_info class: " + str(exec_time) + " s.")

