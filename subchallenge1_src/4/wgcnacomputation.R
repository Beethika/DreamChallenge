library("WGCNA")
library("cluster")
data <- read.table("4modifiedcoexp.txt",sep="\t", header=FALSE)
mat=matrix(0,12588,12588)
el <- cbind(a=data[,1], b=data[,2], c=data[,3])
mat[el[,1:2]] <- el[,3]
mat[el[,2:1]] <- el[,3]
TOM = TOMsimilarity(mat);
dissTOM = 1-TOM
geneTree = hclust(as.dist(dissTOM), method = "average");
minModuleSize = 3;
dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,
deepSplit = 2, pamRespectsDendro = FALSE,
minClusterSize = minModuleSize);
dynamicColors = labels2colors(dynamicMods)
MEList = moduleEigengenes(mat, colors = dynamicColors)
MEs = MEList$eigengenes
MEDiss = 1-cor(MEs);
METree = hclust(as.dist(MEDiss), method = "average");
MEDissThres = 0.55
merge = mergeCloseModules(mat, dynamicColors, cutHeight = MEDissThres, verbose = 3)
mergedColors = merge$colors;
dynamicColors
sink("newlist.txt")
cat(sapply(mergedColors, toString), file, sep="\n")
sink()


