%% creates an ensemble of clustering using hamming distance
Z=creatingEnsembleMatrix;
p=Z(:,2:end);
dist=pdist(p,'hamming');
strength=2;
d1=dist;
d1(d1<(strength/10))=0;
l = linkage(d1);
    c=cluster(l,'Cutoff',eps);
    data=[];
    for k=1:max(c)
        d=Z(c==k,1);
        for i=1:length(d)
            data(end+1,1)=d(i);
            data(end,2)=k;
        end
    end
dlmwrite('6.n2c',data,'\t');
creatingSmallRemainingNetwork('6.n2c');