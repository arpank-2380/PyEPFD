#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --partition=gagalli-csl
#SBATCH --qos=gagalli-small
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
##SBATCH --array=0-7


export nframe=25

module load intel/19.1.1
module load intelmpi/2019.up7+intel-19.1.1
module load mkl/2020.up1
module load python/cpython-3.8.5

#export I_MPI_PMI_LIBRARY=/software/slurm-current-$DISTARCH/lib/libpmi.so
export LD_LIBRARY_PATH=/software/python-3.8.5-el7-x86_64/lib:$LD_LIBRARY_PATH
export OMP_NUM_THREADS=1

QEDIR=/project2/gagalli/jinyu/WEST-Develop/WEST-5.4.0-TDDFT/QEdir12/bin


start_time=$(date +%s)

let begin=151 #${nframe}*${SLURM_ARRAY_TASK_ID}+1
let end=200 #${nframe}*${SLURM_ARRAY_TASK_ID}+${nframe}
workdir=`pwd`
for (( i=$begin; i<=$end; i++ )); do
    #mkdir frame-${i}
    cd frame-${i}
    #mpirun -n 80 ${QEDIR}/pw.x -nb 2 < ${workdir}/PWINPs/pw${i}.in > pw.out
    #mpirun -n 40 ${QEDIR}/wbse_init.x -ni 2 -i ${workdir}/wbse_init.in > wbse_init.out
    #mpirun -n 80 ${QEDIR}/wbse.x -nb 2 -i ${workdir}/wbse_singlet.in > wbse_singlet.out
    #mv pwscf.wbse.save singlet.wbse.save
    #mpirun -n 80 ${QEDIR}/wbse.x -nb 2 -i ${workdir}/wbse_triplet.in > wbse_triplet.out
    #mv pwscf.wbse.save triplet.wbse.save
    mpirun -n 40 ${QEDIR}/westpp.x -i ${workdir}/westpp_singlet.in > westpp_singlet.out
    mpirun -n 40 ${QEDIR}/westpp.x -i ${workdir}/westpp_triplet.in > westpp_triplet.out
    cd ${workdir}
done

end_time=$(date +%s)
total_time=$((end_time - start_time))
echo "Total execution time: $total_time seconds"
