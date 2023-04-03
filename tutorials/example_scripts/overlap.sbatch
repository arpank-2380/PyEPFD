#!/bin/bash
#SBATCH --job-name=overlap
#SBATCH --time=2:00:00             # MAXIMUM WALLTIME
#SBATCH --partition=gagalli-csl,gagalli-brdwl,gagalli-ivyb     # GALLI GROUP PRIVATE PARTITION
#SBATCH --ntasks=58
#SBATCH --qos=gagalli-debug

############################## Load distribution ######################################################
export I_MPI_PMI_LIBRARY=/software/slurm-current-el6-x86_64/lib/libpmi.so
export I_MPI_FABRICS=shm:dapl
export OMP_NUM_THREADS=1

################# Calculating number of cores and nodes ##########################################

module load python/3.6.1+intel-16.0
srun -n ${SLURM_NTASKS} overlap.py
