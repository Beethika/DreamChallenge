%% these are node to community assignment to find out the largset cluster and recluster them
clear all;
path='../data/subchallenge2/';
str1='communitiesset1.txt';
list=readingSubmissionFile(str1);
nodes=[];
for i=1:length(list)
    nodes=[nodes,list{i}];
end
nodes=unique(nodes);
nodes=nodes';
network={'1_ppi_anonym_aligned_v2.txt','2_ppi_anonym_aligned_v2.txt','3_signal_anonym_aligned_directed_v3.txt','4_coexpr_anonym_aligned_v2.txt','5_cancer_anonym_aligned_v2.txt','6_homology_anonym_aligned_v2.txt'};
for iter = 1:6
    str2=num2str(iter);    
    data=importdata(strcat(path,network{iter}));
    data(:,3)=data(:,3)/max(data(:,3));
    u=unique([data(:,1);data(:,2)]);
    lc=setdiff(u,nodes);
    [a1,~]=ismember(data(:,1),lc);
    [a2,~]=ismember(data(:,2),lc);
    a=a1&a2;
    nw=data(a,:);
    dlmwrite(strcat(str2,'.tmp'),nw,'\t');
end
