%% these are node to community assignment to find out the largset cluster and recluster them
function [] = creatingSmallRemainingNetwork(path)
n2c=importdata(path);
list=cell(max(unique(n2c(:,2))),1);
for i =1:length(n2c)
    com=n2c(i,2);
    temp=list{com};
    list{com}=[temp,n2c(i,1)];
end    
lc=[];
ind=[];
for i=1:length(list)
    temp=list{i};
    if length(temp)<3
       ind=[ind;[i length(temp)]]; 
        lc=[lc temp];
    end
end
data=importdata('../data/subchallenge1/6_homology_anonym_v2.txt');
[a1,~]=ismember(data(:,1),lc);
[a2,~]=ismember(data(:,2),lc);
a=a1&a2;
nw=data(a,:);
dlmwrite('6.tmp',nw,'\t');
