from pyepfd.coord_util import xyz2qe

xyz2qe(xyzdata_path='../../300K.xyz',
       pw_opt_path='pwopts.in',
       frames=(1,200),
       pw_path='PWINPs/')

