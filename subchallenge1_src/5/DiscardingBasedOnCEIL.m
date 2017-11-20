c2s=importdata('5.ceil');
score=sort(c2s(:,2),'DESCEND');
mean=sum(score)/length(score);
variance=var(score);
rem=(c2s(:,2)<mean-(variance));
removed=sum(rem);
left=length(c2s)-removed
c2s(rem,:)=[];
dlmwrite('coms.txt',c2s(:,1),'\t');
