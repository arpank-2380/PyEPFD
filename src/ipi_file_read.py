import xml.etree.ElementTree as ET
import numpy as np
import sys


class ipi_info:
      """
        This class reads and store essential information from an iPI restart file,
        that has been created after a successful completion of an 
        iPI NMFD/ENMFD phonon calculation
        Arg: Only the path of the iPI file
      """
      def __init__(self,file_path="RESTART"):
          file_tree = ET.parse(file_path)
          file_root = file_tree.getroot()
          
          ### Reading motion related informations
          motion_tree = file_tree.find("./system/motion")
          motion_mode = motion_tree.attrib["mode"]
          
          if motion_mode != "vibrations":
             sys.exit("Motion mode is not vibrations")
          
          vibrations_tree = motion_tree.find("vibrations")
          self.vibration_mode = vibrations_tree.attrib["mode"]
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
   
