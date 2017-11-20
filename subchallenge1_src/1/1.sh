#!/bin/bash
matlab -nodesktop -nosplash -r "StatisticsOfGraph;quit;"
mcl 1.txt --abc -I 6.0 -o 1.mcl
matlab -nodesktop -nosplash -r "creatingN2C;quit;"
matlab -nodesktop -nosplash -r "CreatingRemainingNetwork('1.n2c');quit;"
python modularitynetwork.py 1.tmp 0.1 > 1_0.1.n2c
matlab -nodesktop -nosplash -r "CreatingRemainingNetwork('1_0.1.n2c');quit;"
python modularitynetwork.py 1.tmp 0.1 > 1_0.1_0.1.n2c
matlab -nodesktop -nosplash -r "CreatingRemainingNetwork('1_0.1_0.1.n2c');quit;"
python modularitynetwork.py 1.tmp 0.1 > 1_0.1_0.1_0.1.n2c
matlab -nodesktop -nosplash -r "CreatingRemainingNetwork('1_0.1_0.1_0.1.n2c');quit;"
python modularitynetwork.py 1.tmp 0.1 > 1_0.1_0.1_0.1_0.1.n2c
matlab -nodesktop -nosplash -r "MergingCluster;quit;"
(python coremoduleidentification.py 1.final ../data/subchallenge1/1_ppi_anonym_v2.txt)>1_ppi_anonym_v2.txt
sed -i 's/\(.*\)\t/\1/' 1_ppi_anonym_v2.txt
sed -i 's/ //g' 1_ppi_anonym_v2.txt
