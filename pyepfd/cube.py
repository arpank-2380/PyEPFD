# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

import sys 
import copy
import numpy as np

class cube_data:
      """
      This includes methods to read cube files and perform a set of
      operations on them, e.g., squaring, integrating a cube file
      """

      def __init__(self,fname=None):
          if fname is not None:
             try:
                self.read_cube_file(fname)
             except IOError as e:
                print( "File used as input: %s" % fname )
                print( "File error ({0}): {1}".format(e.errno, e.strerror))
                exit()
          else:
             print("cube_data class cannot be initiated without a file name.")
             exit()
          #print(self.data)
          self.integral = self.cube_integrate()
          #self.calc_ipr()

      def calc_ipr(self):
          """
          Calculates inverse participation ratio (IPR) 
          """
          square_integral,square = self.power_cube(power=2)
          power4_integral,power4 = self.power_cube(power=4)
          ipr = power4_integral/(square_integral**2)           
          return ipr
      
      def read_cube_file(self,fname):
          """
          Method to read cube file.

          Argument: fname => filename
          """
      
          infil = open(fname, 'r')
          for iline in range(0,2):
              infil.readline()
          info = infil.readline().split() # information regarding no of atoms and origins
          self.natom = int(info[0]) #Number of Atoms
          self.origin = np.array([float(info[1]),float(info[2]),float(info[3])]) #Position of Origin
          self.na = np.zeros(3,np.int32)            ### number ov voxels along lattice direction a[0],a[1] and a[2]
          self.a = np.zeros((3,3),np.float64)       ### lattice vectors
          lattice_vec = 0
          for iline in range(3,6):
              voxel_info = infil.readline().split() 
              self.na[lattice_vec] = int(voxel_info[0])
              self.a[lattice_vec,:] = float(voxel_info[1]),float(voxel_info[2]),float(voxel_info[3])
              lattice_vec += 1
          self.atoms = []
          self.coord = np.zeros((self.natom,3),np.float64)
          for atom in range(self.natom):
              atom_info = infil.readline().split()
              self.atoms.append(atom_info[0])
              self.coord[atom,:] = float(atom_info[2]), float(atom_info[3]), float(atom_info[4])

          self.data = np.zeros((self.na[0],self.na[1],self.na[2]),np.float64)
          ivoxel = 0
          for line in infil:
              for value in line.split():
                  self.data[ivoxel//(self.na[1]*self.na[2]), (ivoxel//self.na[2])%self.na[1], ivoxel%self.na[2]] = float(value)
                  ivoxel += 1  
          return None



      def power_cube(self,power=2,integrate=True):

          """
          Function to raise cube data to a power. Squares cube data by default.
          And to integrate the new data
          """
          power=self.data**power
          if integrate:
             integral = self.cube_integrate(power)
             return integral, power
          else:
             return power          


      def cube_integrate(self,data=None):
          """
           Integrate the entire cube data.
          """
          if data is None:
             data = self.data
          vol=np.linalg.det(self.a)
          density=np.sum(data)
          integral=vol*density
          return integral

def write_cube(natom, atoms, coord, origin, na, a, data, fname,comment='Written by PyEPFD\n '):
    '''
    -----------------------------------------
    Function for Writing a Gaussian Cube File
    ----------------------------------------
    It takes number of atoms (natom), atomic numbers (atoms), atomic xyz coordinates (coord), 
    number of grid along a direction (na), lattice vectors (a), cube voxel data (data), 
    output filename (fname) and a 2-line comment.

    '''
    print(f"Writing {fname}")
    try:
        with open(fname,'w') as fout:
            if len(comment.split('\n')) != 2:
                raise ValueError( 'write_cube: comment needs to be 2 lines')
            fout.write(f"{comment}\n")
            fout.write(f"{natom:4d} {origin[0]:.6f} {origin[1]:.6f} {origin[2]:.6f}\n")
            fout.write(f"{na[0]:4d} {a[0,0]:.6f} {a[0,1]:.6f}, {a[0,2]:.6f}\n")
            fout.write(f"{na[1]:4d} {a[1,0]:.6f} {a[1,1]:.6f} {a[1,2]:.6f}\n")
            fout.write(f"{na[2]:4d} {a[2,0]:.6f} {a[2,1]:.6f} {a[2,2]:.6f}\n")
            for atom, c in zip(atoms,coord):
                fout.write(f"{atom} 0 {c[0]:8.4f} {c[1]:8.4f} {c[2]:8.4f}\n")
            for ix in range(na[0]):
                for iy in range(na[1]):
                    for iz in range(na[2]):
                        fout.write(f"{data[ix,iy,iz]:.5e} ")
                        if (iz % 6 == 5): fout.write('\n')
                    fout.write("\n")
    except IOError as e:
        print( f"File used as output does not work: {fname}" )
        print( f"File error ({e.errno}): {e.strerror}")
        exit()
    return None


def cube_multiplication(files):
    """
    This function multiplies the cube files that are supplied as
    arguments.

        Arguments: files = A list of file names.
    """
    cube_datas = [cube_data(infil) for infil in files]
    cube_out = copy.deepcopy(cube_datas[0])
    for cube_tmp in cube_datas[1:]:
        cube_out.data *= cube_tmp.data
        return cube_out 


def overlap_integral(files):
    """
      Calculates the overlap integral between two cube files

      Arguments: files = A list of two file names.
    """
    if len(files) != 2:
       print("Overlap integral can be calculated between 2 cube files only!.")
       exit()
    norm1, density = cube_data(files[0]).power_cube()
    norm2, density = cube_data(files[1]).power_cube()
    norm = np.sqrt(norm1*norm2)
    overlap_integral = cube_multiplication(files).cube_integrate()/norm
    return overlap_integral


def main():
    cubedata = cube_data(fname='../penta/wf66-frame-0.cube')
    print(cubedata.integral)
    print(cubedata.calc_ipr())

if __name__ == "__main__":
     main()

