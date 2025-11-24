#!/bin/bash
if [ $# -ne 1 ]; then
   echo "Usage: $0 library file list"
   echo "Exmpl: $0 shortNameList.txt"
   exit 1
fi
libFile=$1

for lib in $(cat "$libFile");
do
    echo "Adding charges for ${lib} using molcharge."
    molcharge -in $lib -out ${lib}_charge.oeb.gz
    echo "Charges completed for ${lib}"
done
echo "$fin"
