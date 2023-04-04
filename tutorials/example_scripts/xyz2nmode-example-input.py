import sys,os
pyepfd_path = '/home/arku/Work_UChicago/Code-developments/EPFD/pyepfd/src'
sys.path.insert(0,pyepfd_path)
from xyz2nmode import *

dia64 = prob_dist_on_nm (ipi_restart_file="test_data_nm_proj/RESTART",
                         ref_struc="test_data_nm_proj/geoopt.xyz",
                         traj_file="test_data_nm_proj/dia216-100K.2.combined.xyz",
                         prefix="test-par",
                         par_exec = True,
                         nmode_traj = False,
                         start_frame = 1,
                         #end_frame = 20000,
                         mode_list = [mode for mode in range(501,649)]) #[637,638,639,640,641,642])
                         
