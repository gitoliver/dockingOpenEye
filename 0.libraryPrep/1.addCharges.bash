#!/bin/bash
if [ $# -ne 1 ]; then
   echo "Usage: $0 file.csv"
   echo "Exmpl: $0 shortNameLibraryList.csv"
   exit 1
fi
csvFile=$1

>shortNameList.txt
for line in $(cat "$csvFile");
do
    shortName=$(echo $line | cut -f1 -d ,)
    lib=$(echo $line | cut -f2 -d ,)
    printf "%s, %s\n" $shortName $lib
    echo $shortName >> shortNameList.txt
    echo "Adding charges for ${lib} using molcharge."
    molcharge -in $lib -out ${shortName}_charge.oeb.gz
    echo "Charges completed for ${lib}"
done
echo "$fin"
