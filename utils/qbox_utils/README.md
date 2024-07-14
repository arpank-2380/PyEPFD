-----------------------------------------------------------------------------------------------------------------
xyz2qb and extract_eigval command line tools. 
-----------------------------------------------------------------------------------------------------------------


xyz2qb samples an XYZ trajectory and create an input file containing qbox 
command stream.This can be used to resample a trajectory and run specific 
things such as Kohn-Sham eigenvalues with an user specified sampling frequency.  
The code would ask specific questions in command prompt which are self 
explanatory.

extract_eigval script samples the converged Kohn-Sham eigenvalues of a set of s
pecific bands using the python tool qbox_eigval.py
Suppose you have 4 output files fd-1.r fd-2.r fd-3.r fd-4.r relavant to a finite
difference phonon calculations. Let us assume you want to extract the Kohn-Sham
eigenvalues of bands 101 102 103 104. Then you should use:

/path/to/extract_eigval.sh -prefix fd- -seq 1 4 -orb 101 104 

-----------------------------------------------------------------------------------------------------------------
File                     description
-----------------------------------------------------------------------------------------------------------------
xyz2qb.py        This is the main code. In line 21 put the correct 
		   path to your pseudopotentials.

many_xyz2qb.sh   A bash wrapper where A trajectory can be divided into many 
	           input files so that they can be submitted as separate qbox 
                   jobs. This too will use xyz2qb.py script. 
                   Please put the full path of the xyz2qb.py script 
                   in line 38.

extract_eigval.sh  Bash wrapper script that extracts converged eigenvalues 
                   by running qbox_eigval.py script several times.
	           
qbox_eigval.py        This python script extracts Kohn-Sham eigenvalues during
		   each SCF iteration as well as each ionic iteration.
