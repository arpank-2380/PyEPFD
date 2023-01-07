"""
This module contains classes the deals with I/O operations
based on a finite-difference phonon calculations performed
using PyEPFD's **coord_util.ionic_mover** and **elph_classes.phonon_calculator** classes.
"""

import xml.etree.ElementTree as ET
import numpy as np
import sys, os, time

class write_pyepfd_info:
      """
      This class writes a checkpoint xml file containing crucial informations after 
      a phonon calculation.

        **Arguments:**

            **inp_dynmat** = Input dynamical matrix for NMFD/ENMFD phonon.
            It is a numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

            **dynmat** = Obtained dynamical matrix after FD/NMFD/ENMFD phonon calculation.
            It is also numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

            **ref_dynmat** = Refined dynamical matrix after FD/NMFD/ENMFD phonon calculation.
            Refinement is done applying asr to **dynmat**.
            It is also a numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

            **mass** = (3 *N* ) numpy array of mass matrix
            
            **etotals** = (6 *N* + 1) numpy array of Born-Openheimer energies (<etotals> for qbox)

            **opt_coord** = (3 *N*) numpy array of Cartesian coordinates of optimized geometry.

            **atoms** = List of strings of length *N* containing atom-symbols.

            **mode** = Finite displacement mode. 

            **deltax** = A displacement (*float*) in atomic unit (Bohr)

            **deltae**  = Energy scaled displacement (*float*) in atomic_unit (Hartree)

            **ngrid** = Number of displacement grid points for central difference

            **asr** Acoustic sum rule. 

            **file_name** = Output/ checkpoint file name

        **Returns**
            An output with file name **file_name**.

      """
      def __init__(self,inp_dynmat=None,dynmat=None,ref_dynmat=None,mass=None,etotals=None,
              opt_coord=None, atoms=None, mode='enmfd',deltax=0.001,deltae=0.001,ngrid=1,\
              file_name='test.xml', asr='crystal'):
          init_time = time.time()
          self.outfile = open(file_name, 'w+')
          self.outfile.write('<pyepfd>\n')
          self.outfile.write('  <phonon mode=\''+mode+'\'>\n')
          self.outfile.write('    <ngrid> '+str(ngrid)+' </ngrid>\n')
          self.outfile.write('    <deltax> '+str(deltax)+' </deltax>\n')
          if deltae is not None:
             self.outfile.write('    <deltae> '+str(deltae)+' </deltae>\n')
          if asr is not None:
             self.outfile.write('    <asr> '+asr+' </asr>\n')
          if inp_dynmat is not None:
             self._dynmat2xml(dynmat = inp_dynmat, key = 'inp_dynmat')
          if dynmat is not None:   
             self._dynmat2xml(dynmat = dynmat, key = 'dynmat')
          if ref_dynmat is not None:   
             self._dynmat2xml(dynmat = ref_dynmat, key = 'ref_dynmat') 
          self.outfile.write('  </phonon>\n')
          if mass is not None:
             self._array2xml(array=mass,key='mass',shape = '('+str(len(mass))+')')
          if opt_coord is not None:
             self._array2xml(array=opt_coord,key='opt_coord',shape = '('+str(len(opt_coord))+')') 
          if atoms is not None:
             self._array2xml(array=atoms,key='atoms',data_type='char',\
                     shape = '('+str(len(atoms))+')') 
          self.outfile.write('</pyepfd>')
          self.outfile.close()
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent at write_info %12.4f s"%exec_time)
      
      def _dynmat2xml(self,dynmat,key):
          dynmat_shape = str(dynmat.shape)
          dynmat = dynmat.flatten()
          self._array2xml(array=dynmat,key=key,shape = dynmat_shape,buf='  ')

      def _array2xml(self,array,key,shape,buf='',data_type='float'):
          """
          Converts an array into an xml.
          
            **Arguments:**

                **array** = A float, int or character array

                **key** = A key to be used in xml. A *string*

                **shape** = Array Shape 

                **buf** = A *string* buffer to separate array elements

                **data_type** = Options ``'float'``, ``'int'``, ``'char'``
          """
          init_time = time.time()
          #print(len(array))
          
          if data_type=='float': str_fmt ='%15.8e'
          elif data_type=='char': str_fmt ='%s'
          elif data_type=='int': str_fmt ='%6d'
          else: raise ValueError("data_type not understood. \
              Options: 'float', 'int' , 'char'")

          self.outfile.write(buf+'  <'+key+' shape=\''+ shape + '\'>\n')
          self.outfile.write('[ ')
          ind = 0
          for row in range(len(array)//5):
              for col in range(5):
                  if ind != len(array)-1:
                     self.outfile.write(str_fmt%(array[5*row+col]) + ', ')
                  else:
                     self.outfile.write(str_fmt%(array[5*row+col]) + ' ]\n')
                  ind += 1
              self.outfile.write('\n  ')

          #Writing the last row if it has less than 5 columns
          for i in range(ind,len(array)):
              if i != len(array)-1:
                 self.outfile.write(str_fmt%(array[i]) + ', ')
              else:
                 self.outfile.write(str_fmt%(array[i]) + ' ]\n')
          self.outfile.write(buf+'  </'+key+'>\n')       
          final_time = time.time()
          return        

class read_pyepfd_info:
      """
      This class reads a checkpoint/restart file created by pyepfd after a
      phonon calculation. This information is stored in several objects within
      this class.

        **Arguments:**
            **file_path** = Path to the restart/ checkpoint file

        **Returns:**
            Creates following objects within the class.

                **asr** = A *string* storing asr information.

                **deltax** = Normal mode displacement (
                **deltax** in other classes) information.

                **deltae** = Energy scaled displacement
                (**deltae** in other classes) in atomic_unit (Hartree)

                **ngrid** = Number of displacement grid points for central difference

                **inp_dynmatrix** = Input dynamical matrix for NMFD/ENMFD phonon.
                It is a numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

                **dynmatrix** = Obtained dynamical matrix after FD/NMFD/ENMFD phonon calculation.
                It is also numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

                **ref_dynmatrix** = Refined dynamical matrix after FD/NMFD/ENMFD phonon calculation.
                Refinement is done applying asr to **dynmat**.
                It is also a numpy array of 3 *N* x 3 *N*; where *N* is the number of atoms.

                **mass** = Mass matrix

                **coord** = Coordinates of optimized geometry.
                A *float* array of length *N*.

                **atoms** = A list of atoms with length *N* .

      """
      def __init__(self,file_path="RESTART"):
          init_time = time.time()
          file_tree = ET.parse(file_path)
          file_root = file_tree.getroot()
          self.phonon_tree = file_tree.find("./phonon")
          self.phonon_mode = self.phonon_tree.attrib["mode"]
          self.asr = self.phonon_tree.find("asr")
          if self.asr is not None:
             self.asr = self.asr.text.strip()
          self.deltax = self.phonon_tree.find("deltax")
          if self.deltax is not None:
             self.deltax =  float(self.deltax.text.strip())
          self.ngrid = self.phonon_tree.find("ngrid")
          if self.ngrid is not None:
             self.ngrid =  int(self.ngrid.text.strip())
          self.deltae = self.phonon_tree.find("deltae")
          if self.deltae is not None:
             self.deltae = float(self.deltae.text.strip())   
          
          self.dynmatrix = None
          self.inp_dynmatrix = None
          self.ref_dynmatrix = None
          self._read_dynmat('inp_dynmat')
          self._read_dynmat('dynmat')
          self._read_dynmat('ref_dynmat')

             
          self.mass_tree = file_tree.find("./mass")
          if self.mass_tree is None:
             sys.exit("Mass information not found in file" + file_path)
          else:
             self.mass_shape = eval(self.mass_tree.attrib["shape"])
             self.mass = np.array([float(element.strip(",")) \
             for element in self.mass_tree.text.split()[1:-1]])

          ### Reading self.coord ==> coordinates
          self.coord_tree = file_tree.find("./opt_coord")
          if self.coord_tree is None:
              sys.exit("Optimized geometry coordinates not found in file" + file_path)
          else:
              self.coord_shape = eval(self.coord_tree.attrib["shape"])
              self.coord = np.array([float(element.strip(",")) for element in self.coord_tree.text.split()[1:-1]])

          ### Reading  atoms
          self.atom_tree = file_tree.find("./atoms")
          self.atoms = []
          if self.atom_tree is None:
              sys.exit("Atoms not found in file" + file_path)
          else:
              for element in self.atom_tree.text.split()[1:-1]:
                  self.atoms.append(element.strip(","))

          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent on read_pyepfd_info class: " + str(exec_time) + " s.")

      def _read_dynmat(self,type='dynmat'):
          """
          Method to read dynamical Matrix
          """
          dynmat_tree = self.phonon_tree.find(type)
          if dynmat_tree is None: return
          try:
             if dynmat_tree.attrib["mode"] == "file":
                dynmatrix = np.loadtxt(dynmat_tree.text.strip())
          except KeyError:
                dynmatrix = None
          try:
             dynmat_shape = eval(dynmat_tree.attrib["shape"])
          except KeyError:
             dynmat_shape = None

          if (dynmatrix is None) & (dynmat_shape is not None):
             dynmatrix = np.array([float(element.strip(",")) \
             for element in dynmat_tree.text.split()[1:-1]]).reshape(dynmat_shape)
          
          if type == 'dynmat': self.dynmatrix = dynmatrix
          elif type == 'inp_dynmat': self.inp_dynmatrix = dynmatrix
          elif type == 'ref_dynmat':  self.ref_dynmatrix = dynmatrix
          else: raise ValueError("dynmat type not understood")

          return
