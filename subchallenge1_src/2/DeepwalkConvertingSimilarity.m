data=importdata('2.deepwalk');
unq=unique([data(:,1),data(:,2)]);
[~,p1]=ismember(data(:,1),unq);
[~,p2]=ismember(data(:,2),unq);
A=sparse(p1,p2,data(:,3),length(unq),length(unq));
A=full(A);
dlmwrite('2.deepwalkAdj',A,'\t');
end
