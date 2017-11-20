#Preprocessing
StatisticsOfGraph.m

#Run MCL code
mcl 1.txt --abc -I 6.0 -o 1.mcl

#Postprocessing
#Converting to Node to Community format
creatingN2C.m
#Reclustering Larger Modules
CreatingRemainingNetwork.m 1.n2c
python modularitynetwork.py 1.tmp 0.1 > 1_0.1.n2c
CreatingRemainingNetwork.m 1_0.1.n2c
python modularitynetwork.py 1_0.1.tmp 0.1 > 1_0.1_0.1.n2c
CreatingRemainingNetwork.m 1_0.1_0.1.n2c
python modularitynetwork.py 1_0.1_0.1_0.1.tmp 0.1 > 1_0.1_0.1_0.1_0.1.n2c
MergingCluster.m
#Forming Core
