#!/bin/bash
##### To prepare many inputs for qbox from an xyz file using xyz2qbox.sh but avoiding the prompt
##### It is basically a wrapper for xyz2qb.py

# This file is part of PyEPFD
# Copyright (c) 2023 Arpan Kundu
# See the LICENCE.md in root directory for full license information.


#default values for qbox variables
## Change them according to your needs

cell_param_default=" 38.000008  0.000000  0.000000  0.000000  38.000008  0.000000  0.000000  0.000000  38.000008"
qbox_cmd1='  randomize_wf, run -atomic_density 0 80 5'  # placeholder for qbox command for 1st iteration 
qbox_cmd2='   randomize_wf, run -atomic_density 0 80 5'       # run command for other iteration  
cube_dir='WF'
plot_cmd="" #" plot -wf 66 ${cube_dir}/wf66, plot -wf 67 ${cube_dir}/wf67, plot -wf 68 ${cube_dir}/wf68" #" plot -wf 401 ${cube_dir}/wf401"
#for i in `seq 402 408`; do plot_cmd=${plot_cmd}", plot -wf ${i} ${cube_dir}/wf${i}"; done
spectrum_dir="" #'spectrum/'
spectrum_cmd="" #"spectrum spectrum/spec"
save_wf=''
xc='PBE'
wf_dyn='JD'
ecut='85.0'
scf_tol='1.00e-8'
nempty='100'
nspin="2"
delta_spin="1"
net_charge="-1"
pseudo='ONCV_PBE-1.0'



#### Deriving the path to xyz2qb.py  ###
echo "${BASH_SOURCE[0]}"
BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo $BASE
executable=${BASE}/xyz2qb.py

### Loading python, 
# if python is loaded already comment the following 2 lines
module unload python
module load python

clear

function xyz2qbox {
python3 $executable $1 $2
                  }

tot_arg=`echo "$#"`
if [ "$tot_arg" -lt 1 ]; then
   echo -e "\e[31m No xyz file given as input. Use: many_xyz2qbox.sh file.xyz\e[39m"
   exit
fi

xyz2qbox $1 quit

prompt="\e[32m"
colorexit="\e[39m"
statement="\e[34m"
warning="\e[31m"

echo 
echo
echo -e "${statement}-----------------------------------${colorexit}"
echo -e "${statement}        File related inputs        ${colorexit}"
echo -e "${statement}-----------------------------------${colorexit}" 

echo -n -e "${prompt}File prefix: ${colorexit}"
read file_prefix
echo -n -e "${prompt}File start index: ${colorexit}"
read it_start
echo -n -e "${prompt}File end index: ${colorexit}"
read it_end

echo -e "${statement}---------------------------------------------${colorexit}"
echo -e "${statement}     XYZ2QBOX related inputs       ${colorexit}"
echo -e "${statement}---------------------------------------------${colorexit}" 
echo -n -e "${prompt} Enter start frame number : ${colorexit}"
read shift_from_origin
echo -n -e "${prompt} Trajectory length (in terms of $1) you want to put in a single qbox input : ${colorexit}"
read length
echo -n -e "${prompt} Enter step frame number : ${colorexit}"
read step_frame
echo -n -e "${prompt} Cell parameter string (inactivated for i-PI output) : ${colorexit}"
read cell_param
if [ -z "$cell_param" ]; then
   #echo "cell_param empty"
   cell_param=`echo $cell_param_default`
fi

echo -e "$statement-----------------------------------------------------$colorexit"
echo -e "$statement         Starting preparing Qbox input               $colorexit"
echo -e "$statement  using $executable  $colorexit"
echo -e "$statement-----------------------------------------------------$colorexit"




for it in `seq ${it_start} ${it_end}`
do
    let start_frame=(${it}-${it_start})*${length}+${shift_from_origin}
    let end_frame=(${it}-${it_start}+1)*${length}+${shift_from_origin}-1
    printf "$start_frame\n$end_frame\n$step_frame\n$qbox_cmd1\n$qbox_cmd2\n$plot_cmd\n$spectrum_cmd\n$save_wf\n${file_prefix}-${it}.i\n$xc\n$wf_dyn\n$ecut\n$scf_tol\n$nempty\n$nspin\n$delta_spin\n$net_charge\n$pseudo\n" | xyz2qbox $1 no-info
    if [ `grep -c 'set cell' ${file_prefix}-${it}.i` -eq 0 ]; then 
      sed -i "/# Frame/a \ set cell $cell_param" ${file_prefix}-${it}.i
      echo -e "\e[44m For all configurations, cell parameters (in bohr) are set to: $cell_param \e[49m" 
    fi
    echo -e "$statement-----------------------------------------------------$colorexit"
    echo -e "$statement          Iteration No $it finished                  $colorexit"
    echo -e "$statement-----------------------------------------------------$colorexit"
done

module unload python
