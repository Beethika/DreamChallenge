data=importdata('2.deepwalknew');
Removed=importdata('2.RemovedNodes');
[rem1,~]=ismember(data(:,1),Removed);
[rem2,~]=ismember(data(:,2),Removed);
rem=rem1|rem2;
data(rem,:)=[];
dlmwrite('2.new',data,'\t');
