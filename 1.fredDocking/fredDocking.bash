#!/bin/bash
if [ $# -ne 3 ]; then
   echo "Usage: $0 csvFileWithLibrariesAndHitlistCounts receptor.oeb.gz ncpus"
   echo "Exmpl: $0 library_hitlistSize.csv 6b3rEditCapToBladeBox.oedu 10"
   exit 1
fi

libraryHitnFile=$1
receptor=$2
ncpu=$3

for line in $(cat $libraryHitnFile)
do
    libPath=$( echo "$line" | cut -d , -f1 )
    lib=$( echo "$line" | cut -d , -f2 )
    hitN=$( echo "$line" | cut -d , -f3 )
    echo "fred -mpi_np $ncpu -receptor $receptor -dbase ${libPath}/$lib -hitlist_size $hitN -settings_file ${lib}.settings.param -report_file ${lib}.report.txt -score ${lib}.score.txt"
    #fred -mpi_np $ncpu -receptor $receptor -dbase ${libPath}/$lib -hitlist_size $hitN -settings_file ${lib}.settings.param -report_file ${lib}.report.txt -score ${lib}.score.txt
    fred -mpi_np ${ncpu} -receptor ${receptor} -dbase ${libPath}/${lib} -hitlist_size $hitN -prefix ${lib}
done
echo "fin"
