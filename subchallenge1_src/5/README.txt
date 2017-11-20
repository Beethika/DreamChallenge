# computing modularity at different resolutions
for res in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1; do python modularitynetwork.py ../data/subchallenge1/5_cancer_anonym_v2.txt '$res' > '$res'.mod; done;
#Ensembling
Ensemble_KMedoid.m
#Reclustering Larger Modules
python modularitynetwork.py 5.tmp 0.1 > 5_0.1.n2c
#Merging the previous and reclustered results
MergingCluster.m

#Postprocessing
#Computing CEIL score for the community
python ceilscore.py ../data/subchallenge1/5_cancer_anonym_v2.txt 5.final1 5.ceil

#Discarding clusters based on CEIL Score
DiscardingBasedOnCEIL.m
#Core
(python coremoduleidentification.py 5.final ../data/subchallenge1/5_cancer_anonym_v2.txt)>5_cancer_anonym_v2.txt

