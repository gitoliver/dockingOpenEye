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
    libFile=$(echo $line | cut -f2 -d ,)
    printf "%s, %s\n" $shortName $libFile
    echo $shortName >> shortNameList.txt
    ln -s $libFile $shortName
done

echo "fin"
