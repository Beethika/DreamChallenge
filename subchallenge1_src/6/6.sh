#!/bin/bash
# computing modularity at different resolutions
for res in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1; do python modularitynetwork.py ../data/subchallenge1/6_homology_anonym_v2.txt $res > $res.mod; done;
#Ensembling
matlab -nodesktop -nosplash -r "Ensemble_Hierarchical;quit;"

#Reclustering Larger Modules
python modularitynetwork.py 6.tmp 0.6 > 6_0.6.n2c
matlab -nodesktop -nosplash -r "creatingSmallRemainingNetwork('6_0.6.n2c');quit;"
python modularitynetwork.py 6.tmp 1 > 6_0.6_1.n2c
#Merging the previous and reclustered results
matlab -nodesktop -nosplash -r "MergingCluster;quit;"
#Core
(python coremoduleidentification.py 6.final ../data/subchallenge1/6_homology_anonym_v2.txt)>6_homology_anonym_v2.txt
sed -i 's/\(.*\)\t/\1/' 6_homology_anonym_v2.txt
sed -i 's/ //g' 6_homology_anonym_v2.txt

