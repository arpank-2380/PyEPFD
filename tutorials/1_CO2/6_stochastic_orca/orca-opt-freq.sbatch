#!/bin/bash
#SBATCH --account=pi-gagalli
#SBATCH -J co2
#SBATCH --time=2:00:00
#SBATCH --partition=gagalli-csl2
#SBATCH --qos=gagalli-debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=28GB
#SBATCH --cpus-per-task=1 #increase this comensurate with number of threads

#
# SET OMP_NUM_THREADS 
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#
module load orca/5.0.4
orca=/software/orca-5.0.4-el8-x86_64/bin/orca
#
# NTASKS BELOW IS SET FOR GNU PARALLEL TO KNOW HOW MANY CORES IT HAS TO WORK WITH
NTASKS=$(($SLURM_NTASKS_PER_NODE * $SLURM_JOB_NUM_NODES))
echo "NTASKS IS $NTASKS"

start_time=$(date +%s)

${orca} orca-opt-freq.inp > orca-opt-freq.out

end_time=$(date +%s)
total_time=$((end_time - start_time))
echo "Total execution time: $total_time seconds"
