# Scripts for Docking with OpenEye

## OpenEye Strategy
Round 1: Do a quick and dirty screening of many compounds using FRED. Default charges, max 25 rotamers, FRED. Will screen many sites and up to 10 receptor shapes from MD, cryoEM and alphaFold.  
Round 2: Take the top hits for each docking site and repeat with better charges, pKa, tautomer assessments.

## Steps
Downloaded sdf formatted libraries from Enamine and mcule websites. Placed sdf files into a folder with these scripts.
Created a shortened list [shortNameLibraryList.csv](0.libraryPrep/shortNameLibraryList.csv) as input for [0.createSimLinks.bash](0.libraryPrep/0.createSimLinks.bash).

### [0.createSimLinks.bash](0.libraryPrep/0.createSimLinks.bash)  
Creates easier to read/handle file names for the libraries using the info in [shortNameLibraryList.csv](0.libraryPrep/shortNameLibraryList.csv)

### [1.addCharges.bash](0.libraryPrep/1.addCharges.bash)
Uses molcharges with default settings to quickly add charges to the compounds.

### [2.addConformers.bash](0.libraryPrep/2.addConformers.bash)
Uses omega to add max 25 rotamers per compound. This runs in parallel with 10 processes. See -mpi_np flag in script if you want to change this.
