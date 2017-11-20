%% creates an ensemble of clustering using hamming distance
Z = creatingEnsembleMatrix;
k = 600;
p = Z(:,2:end);
idx = kmedoids(p,k,'Distance','jaccard') ;
n2c = [Z(:,1) idx];
dlmwrite('5.n2c',n2c,'\t');
creatingRemainingNetwork('5.n2c');
