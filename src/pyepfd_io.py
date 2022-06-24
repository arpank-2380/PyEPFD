import xml.etree.ElementTree as ET
import numpy as np
import sys, os, time

class write_pyepfd_info:
      """
      Write informations regarding a phonon calculation into a xml file. 
      """
      def __init__(self,inp_dynmat=None,dynmat=None,ref_dynmat=None,mass=None,etotals=None,\
              file_name='test.xml',mode='enmfd',deltax=0.001,deltae=0.001,ngrid=1, asr='crystal'):
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
          self.outfile.write('</pyepfd>')
          self.outfile.close()
          final_time = time.time()
          exec_time = final_time - init_time
          print("Time spent at write_info %12.4f s"%exec_time)
      
      def _dynmat2xml(self,dynmat,key):
          dynmat_shape = str(dynmat.shape)
          dynmat = dynmat.flatten()
          self._array2xml(array=dynmat,key=key,shape = dynmat_shape,buf='  ')

      def _array2xml(self,array,key,shape,buf=''):
          init_time = time.time()
          #print(len(array))
          self.outfile.write(buf+'  <'+key+' shape=\''+ shape + '\'>\n')
          self.outfile.write('[ ')
          ind = 0
          for row in range(len(array)//5):
              for col in range(5):
                  if ind != len(array)-1:
                     self.outfile.write('%15.8e, '%(array[5*row+col]))
                  else:
                     self.outfile.write('%15.8e ]\n'%(array[5*row+col]))
                  ind += 1
              self.outfile.write('\n  ')
          for i in range(ind,len(array)):
              if ind != len(array)-1:
                 self.outfile.write('%15.8e, '%(array[ind]))
              else:
                 self.outfile.write('%15.8e ]\n'%(array[5*row+col])) 
          self.outfile.write(buf+'  </'+key+'>\n')       
          final_time = time.time()
          return        

class read_pyepfd_info:
      """
      Read informations and stores them 
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
             
              
      def _read_dynmat(self,type='dynmat'):
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

 
         
      
