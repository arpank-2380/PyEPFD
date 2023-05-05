#!/bin/bash 
##### Script that collects eigenvalues of different orbitals during molecular dynamics runs ##########
# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.

prefix=enmfd
norb_strt=1
norb_end=6
md_start=1
md_end=1

ispin=0
kp1=0
kp2=0
kp3=0
max_proc=10   #%of the available processors would be used
root_dir=`pwd`
column_only=false

skip_default=true

###############    Command line options for this script    ###############
read_arg=0
total_arg=`echo "$#"`
 #echo "total_arg=${total_arg}"

for cmd_arg in `seq 1 8`
do

if [ $read_arg -ge $total_arg ]; then
   break
fi

if   [ $1 == "-orb" ]; then         # Orbital number from (lower value) to (higher value)
        norb_strt=$2
        norb_end=$3
        shift 3
        let read_arg=$read_arg+3
elif [ $1 == '-seq' ]; then           # file sequence from (lower value) to (higher value)
        md_start=$2
        md_end=$3
        shift 3
        let read_arg=$read_arg+3
elif [ $1 == '-ispin' ]; then        # ispin value for qbox_eig.py
        ispin=$2
        shift 2
        let read_arg=$read_arg+2
elif [ $1 == '-kp' ]; then      # Kpoints values for qbox_eig.py code
       kp1=$2
       kp2=$3
       kp3=$4
       shift 4
       let read_arg=$read_arg+4
elif [ $1 == '-col' ]; then
       column_only=true
       shift
       let read_arg=$read_arg+1
elif [ $1 == '-prefix' ]; then
       prefix=$2
       shift 2
       let read_arg=$read_arg+2
elif [ $1 == '-skip' ]; then
       skip=$2
       shift 2
       skip_default=false
       let read_arg=$read_arg+2
elif [ $1 == '-max_proc' ]; then
       max_proc=$2
       shift 2
       let read_arg=$read_arg+2
fi
done

function conv_eigval {
   file=$1
   let skip_row=$2+1
   ## If error messages before XML starting line, removing them
   xml_start_line=`grep -n "UTF-8" $file | awk -F[:] '{print $1}'`
   if [ "$xml_start_line" -eq 0 ]; then
      echo "Not a valid XML file."
      exit
   fi
   tot_line=`wc -l $file| awk '{print $1}'`
   iter_1st=`grep -m $skip_row -n '</iteration>' $file | awk -F[:] '{print $1}' | tail -n 1`
   eigval_last=`head -n $iter_1st $file | grep -n '<eigenset' | tail -n 1 | awk -F[:] '{print $1}'`
   let line_2_print=${iter_1st}-${eigval_last}+1
   #echo iter_1st=$iter_1st
   #echo eigval_last=$eigval_last
   #echo line_2_print=$line_2_print
   if [ "${skip_row}" -eq 1 ] ; then
      grep -B${line_2_print} '</iteration>' $file | sed '/iteration/d' | sed '/--/d' >  tmp_eigval
   else
      sed -n "${eigval_last},${tot_line}p" $file | grep -B${line_2_print} '</iteration>' | sed '/iteration/d' | sed '/--/d' > tmp_eigval
   fi
   
   {
   sed -n "${xml_start_line},${xml_start_line}p" $file
   echo '<root>'
   } > tmp_header
   
   { echo '</root>' 
   } > tmp_footer
   
   cat tmp_header tmp_eigval tmp_footer
   rm -rf tmp*
                    }

############ Setting default values for skip ##############
if $skip_default; then
   no_setxc=`grep -c "set xc" ${prefix}-${md_start}.r`
   #echo no_setxc=$no_setxc
   if [ "$no_setxc" -le 1 ]; then
      skip=0
   elif [ "$no_setxc" -eq 2 ]; then
      skip=1
   else
      echo "Exchange correlation is set more than twice."
      echo "If you are sure what you are doing then use -skip <n> option to skip first <n> eigenvalues"
      exit
   fi
fi


#module load qbox
cd $root_dir

if [[ -d 'Eigenvalues' ]]; then
   echo "Directory Eigenvalues exists"
else
   mkdir Eigenvalues
fi

##### Extracting the converged eigenvalues only inside the Eigenvalues directory for each MD simulation ############
cd Eigenvalues

#module load parallel

sem --max-procs ${max_proc}% -L 14                                                 #parallely spwaning many processes
#sem -j +0
for mdjob in `seq ${md_start} ${md_end}`
do
  if [[ -f ../${prefix}-${mdjob}.r ]]; then
    if [[ -f eigvals.${prefix}-${mdjob} ]]; then
       echo "File eigvals.${prefix}-${mdjob} exists"
       echo "Skipping extracting eigenvalues from ${prefix}-${mdjob}.r"
    else
       conv_eigval ../${prefix}-${mdjob}.r ${skip} > eigvals.${prefix}-${mdjob}
    fi
  else
    echo "File ${prefix}-${mdjob}.r doesn't exist"
  fi 
done
#sem --wait

if [[ -d "Orbital_energy_time_evol_kp_${kp1}_${kp2}_${kp3}" ]]; then
   echo "Directory Eigenvalues/Orbital_energy_time_evol_kp_${kp1}_${kp2}_${kp3} exists"
else
   mkdir Orbital_energy_time_evol_kp_${kp1}_${kp2}_${kp3}
fi

##### Extracting eigenvalues for a particular orbital inside Orbital_energy_time_evol directory  ##################
cd Orbital_energy_time_evol_kp_${kp1}_${kp2}_${kp3}

sem --max-procs ${max_proc}% -L 16                       #parallely spawining many processes
for mdjob in `seq ${md_start} ${md_end}`
do
    for norb in `seq -w $norb_strt $norb_end`
    do 
        if [[ -f ../eigvals.${prefix}-${mdjob} ]]; then
          if [[ -f orbital${norb}.${prefix}-${mdjob} ]]; then
             echo "File orbital${norb}.${prefix}-${mdjob} exists"
             echo "Skipping extracting eigenvalues for Orbital-${norb} from eigvals.${prefix}-${mdjob}"
          else
             qbox_eig.py $ispin $kp1 $kp2 $kp3 $norb  ../eigvals.${prefix}-${mdjob} > orbital${norb}.${prefix}-${mdjob} 
          fi
        else
           echo "File Eigenvalues/eigvals.${prefix}-${mdjob} doesn't exist"
        fi
    done
done
#sem --wait

#######   Concatinating results for all md  ##################
paste_arg=''
for norb in `seq -w $norb_strt $norb_end`
do
   echo "#Orbital-${norb}" > header
   cat_arg=''
   for mdjob in `seq ${md_start} ${md_end}`
   do
       cat_arg=${cat_arg}'orbital'${norb}.${prefix}-${mdjob}' '
   done
   sem --max-procs ${max_proc}% cat header ${cat_arg} | sed '/ispin=/d' > orbital${norb}.tmp
   paste_arg=${paste_arg}'orbital'${norb}'.tmp '
done
if  $column_only;  then
cat $paste_arg > col_orbital.dat
mv col_orbital.dat $root_dir/col_orbital_kp_${kp1}_${kp2}_${kp3}.dat
else
paste $paste_arg  > orbital.dat
mv orbital.dat $root_dir/orbital_kp_${kp1}_${kp2}_${kp3}.dat
fi

rm -rf *.tmp header 

cd $root_dir
