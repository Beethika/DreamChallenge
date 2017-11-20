#Preprocessing
#Download the deepwalk code from https://github.com/phanein/deepwalk
deepwalk --input 2_ppi_anonym_v2.txt --format edgelist --output 2.embedding
#Remove first line from 2.embedding
python computeeuclideandist.py 2.embedding > 2.deepwalk
WhiskerRemoval.m
#For threshold run ComputeThreshold.m 
#Sparsifying the distance matrix threshold is 6.9
(awk -F " " '$3>6.9' 2.deepwalk)>2.deepwalknew
#Removing whisker nodes from deepwalk distance matrix
RemovingWhiskerFormDWEmbed.m

#Method
python __init__Subset.py 2.txt 2.new 0.1 > 2.final

#Core
(python coremoduleidentification.py 2.final ../data/subchallenge1/2_ppi_anonym_v2.txt)>2.output
