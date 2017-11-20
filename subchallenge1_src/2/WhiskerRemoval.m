data=importdata('../data/subchallenge1/2_ppi_anonym_v2.txt');
Removed=[];
while true
    u=unique([data(:,1),data(:,2)]);
    degree=[];
    for i =1:length(u)
        [a1,~]=ismember(data(:,1),u(i));
        [a2,~]=ismember(data(:,2),u(i));
        degree(i)=sum(a1)+sum(a2);
    end
    whisker=[];
    for i=1:length(degree)
        if degree(i)==1
            whisker=[whisker;i];
        end
    end
    if isempty(whisker)
        break;
    end
    whiskernodes=u(whisker);
    Removed=[Removed;whiskernodes];
    [rem1,~]=ismember(data(:,1),whiskernodes);
    [rem2,~]=ismember(data(:,2),whiskernodes);
    rem=rem1|rem2;
    data(rem,:)=[];
end
dlmwrite(strcat('2.RemovedNodes'),Removed,'\n');
dlmwrite('2.txt',data,'\t');
