#!/bin/bash
if [ $# -ne 2 ]; then
   echo "Usage: $0 library file list ncpus"
   echo "Exmpl: $0 shortNameList.txt 10"
   exit 1
fi
libFile=$1
ncpus=$2
for lib in $(cat "$libFile");
do
    echo "Adding conformers for ${lib} using omega. Note mpirun must be available."
    oeomega classic -maxconfs 25 -in ${lib}_charge.oeb.gz -out ${lib}_charge_conf.oeb.gz -mpi_np $ncpus
    echo "Conformers completed for ${lib}"
done
echo "$fin"
