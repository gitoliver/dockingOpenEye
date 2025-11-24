#!/bin/bash
if [ $# -ne 1 ]; then
   echo "Usage: $0 library file list"
   echo "Exmpl: $0 shortNameList.txt"
   exit 1
fi
libFile=$1

for lib in $(cat "$libFile");
do
    echo "Adding conformers for ${lib} using omega."
    oeomega classic -maxconfs 25 -in ${lib}_charge.oeb.gz -out ${lib}_charge_conf.oeb.gz -mpi_np 10
    echo "Conformers completed for ${lib}"
done
echo "$fin"
