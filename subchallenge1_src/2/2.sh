#!/bin/bash
#Download the deepwalk code from https://github.com/phanein/deepwalk
#deepwalk --input 2_ppi_anonym_v2.txt --format edgelist --output 2.embedding
#Remove first line from 2.embedding
python computeeuclideandist.py 2.embedding > 2.deepwalk
matlab -nodesktop -nosplash -r "WhiskerRemoval;quit;"
#For threshold run matlab -nodesktop -nosplash -r "ComputeThreshold;quit;" 
#Sparsifying the distance matrix threshold is 6.6046
(awk -F " " '$3>=6.6046' 2.deepwalk)>2.deepwalknew
#Removing whisker nodes from deepwalk distance matrix
matlab -nodesktop -nosplash -r "RemovingWhiskerFormDWEmbed;quit;"
#Method
python __init__Subset.py 2.txt 2.new 0.6 > 2.final
#Core
(python coremoduleidentification.py 2.final ../data/subchallenge1/2_ppi_anonym_v2.txt)>2_ppi_anonym_v2.txt
sed -i 's/\(.*\)\t/\1/' 2_ppi_anonym_v2.txt
sed -i 's/ //g' 2_ppi_anonym_v2.txt
