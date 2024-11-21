import sys, os, time
from pyepfd.pyepfd_io import *
from pyepfd.constants import *
from pyepfd.elph_classes import *

def parse_orca_hess(filepath):
    data = {
        'atoms': [],  # Initialize atom data
        'vibrational_frequencies': [],
        'hessian': None
    }

    with open(filepath, 'r') as f:
        lines = f.readlines()

    # Parse atoms
    reading_atoms = False
    for line in lines:
        if "$atoms" in line.lower():  # Start of atom data
            reading_atoms = True
            continue
        if reading_atoms:
            if "$" in line.lower():  # End of atom data
                reading_atoms = False
                continue
            parts = line.split()
            if len(parts) == 5:  # Assuming the format is: Symbol Mass X Y Z
                symbol, mass, x, y, z = parts
                data['atoms'].append({
                    'symbol': symbol,
                    'mass': float(mass),
                    'coordinates': (float(x), float(y), float(z))
                })

    # Parse vibrational frequencies
    reading_frequencies = False
    for line in lines:
        if "$vibrational_frequencies" in line.lower():
            reading_frequencies = True
            continue
        if reading_frequencies:
            if "$" in line.lower():
                reading_frequencies = False
                continue
            try:
                data['vibrational_frequencies'].append(float(line.split()[-1]))
            except (ValueError, IndexError):
                pass

    # Parse Hessian matrix (placeholder; similar logic can be added)
    reading_hessian = False
    read_nmode = False
    read_col_indices = False
    for line in lines:
        if "$hessian" in line.lower():
            reading_hessian = True
            continue
        if reading_hessian:
            if "$" in line.lower():
                reading_hessian = False
                continue
            parts = line.split()
            if (not read_nmode) & (len(parts) == 1):
               nmode = int(parts[0])
               #print(f"nmode = {nmode}")
               data['hessian'] = np.zeros((nmode,nmode),np.float64)
               read_nmode = True  
            elif not read_col_indices:    
               if (len(parts) == 5) | (len(parts) == nmode % 5):
                  j = [int(element) for element in parts]
                  #print(j)
                  read_col_indices = True
                  continue
            if read_col_indices:
               i = int(parts[0])
               if i == nmode-1: read_col_indices = False
               for ind in range(len(j)):
                   data['hessian'][i,j[ind]] = parts[ind+1]
                      
    return data

init_time = time.time()
if (len(sys.argv) < 2) or (len(sys.argv) > 4):
   sys.exit("\033[91mUsage: python orca2pyepfd.py path_to_orca.hess " + \
           "path_to_pyepfd_restart.xml <freq_scale_factor>[optional]")
   
# Usage

file_path = sys.argv[1]
restart_file = sys.argv[2]
if len(sys.argv)==4:
    freq_scale = float(sys.argv[3])
else:
    freq_scale = 1.0
print("-----------------------------------------------------")
print(f"Converting {file_path} to {restart_file}")
print("-----------------------------------------------------")

parsed_data = parse_orca_hess(file_path)
# Access atom information
atom_data = parsed_data['atoms']
atoms = []; mass = []; coord = []
for atom in atom_data:
    atoms.append(atom['symbol'])
    mass.append([float(atom['mass'])*amu, \
            float(atom['mass'])*amu, float(atom['mass'])*amu])
    coord.append(atom['coordinates'])
opt_coord = np.array(coord).flatten()
mass = np.array(mass).flatten()
massinv = np.array([1/np.sqrt(mass[i]) for i in range(len(mass))])
hessian = np.array(parsed_data['hessian'], dtype=np.float64)
hessian_shape = np.shape(hessian)
dynmatrix = np.zeros(hessian_shape,np.float64)
for imode in range(hessian_shape[0]):
    dynmatrix[imode] = hessian[imode] * massinv[imode] * massinv 
dynmatrix *= np.square(freq_scale)
dm=dm(dynmat=dynmatrix, mass=np.array(mass))

# determining asr from the list of frequencies
vibrational_frequencies = parsed_data['vibrational_frequencies']
count_freq_zero = np.sum(np.abs(vibrational_frequencies) < eps)

if count_freq_zero == 3: asr = 'crystal'
elif count_freq_zero == 5: asr = 'lin'
elif count_freq_zero == 6: asr = 'poly'
else: asr = 'none'

dm.apply_asr(opt_coord = opt_coord, asr=asr)
print("#Mode    Frequency(cm-1)")
for i in range(len(dm.refomega)):
    print(f"{i:5d} {dm.refomega[i]*ha2unit['cm-1']:10.2f}")

# Since orca is not a periodic code, 
# We are assuming a cubic cell of 100 Angstrom

cell = [1.88972599e+02,  1.88972599e+02,  1.88972599e+02, 90, 90, 90]

write_pyepfd_info(inp_dynmat = None,\
   dynmat = dm.dynmatrix,\
   ref_dynmat = dm.refdynmatrix,\
   mass = np.array(mass), 
   atoms = atoms,\
   opt_coord = opt_coord,\
   cell = cell,\
   file_name=restart_file,\
   mode='orca',\
   deltax=0.000,\
   ngrid=0,\
   deltae=0.000,\
   asr = asr)

print(f"\033[92mSuccessfully written {restart_file}.\n" + 
"\033[91mChange the values of <phonon mode>, <deltax>, <deltae>, \n"+ 
"<ngrid> and <cell> if needed.")
final_time = time.time()
exec_time = final_time - init_time
print("\033[00mTotal time required (s): " + str(exec_time))
