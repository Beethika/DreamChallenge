# computing modularity at different resolutions
for res in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1; do python modularitynetwork.py 6_homology_anonym_v2.txt '$res' > '$res'.mod; done;
#Ensembling
Ensemble_Hierarchical.m
#Reclustering Larger Modules
python modularitynetwork.py 6.tmp 0.6 > 6_0.6.n2c
#Merging the previous and reclustered results
MergingCluster.m

#Core
(python coremoduleidentification.py 5.final ../data/subchallenge1/6_homology_anonym_v2.txt)>6_homology_anonym_v2.txt


