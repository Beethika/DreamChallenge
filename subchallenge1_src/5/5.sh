#!/bin/bash
# computing modularity at different resolutions
for res in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1; do python modularitynetwork.py ../data/subchallenge1/5_cancer_anonym_v2.txt $res > $res.mod; done;
#Ensembling
matlab -nodesktop -nosplash -r "Ensemble_KMedoid;quit;"

#Reclustering Larger Modules
python modularitynetwork.py 5.tmp 0.1 > 5_0.1.n2c
#Merging the previous and reclustered results
matlab -nodesktop -nosplash -r "MergingCluster;quit;"
#Core
(python coremoduleidentification.py 5.final1 ../data/subchallenge1/5_cancer_anonym_v2.txt)> 5.final
sed -i 's/\(.*\)\t/\1/' 5.final
sed -i 's/ //g' 5.final

#Postprocessing
#Computing CEIL score for the community
python ceilscore.py ../data/subchallenge1/5_cancer_anonym_v2.txt 5.final 5.ceil

#Discarding clusters based on CEIL Score
matlab -nodesktop -nosplash -r "DiscardingBasedOnCEIL;quit;"

(nawk '{FS="\t"} NF==1 {acc[$1]=1} NF>1 {if( ( $1 in acc ) ) {print $0} }' coms.txt 5.final)>5prefinal.txt
(python printcommunities.py 5prefinal.txt)>5_cancer_anonym_v2.txt
sed -i 's/\(.*\)\t/\1/' 5_cancer_anonym_v2.txt
sed -i 's/ //g' 5_cancer_anonym_v2.txt



