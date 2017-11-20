clear;
data=importdata('2.txt');
u=unique([data(:,1),data(:,2)]);
a = 1;
b = length(u);
ra = int32((b-a).*rand(1000,1)) + a;
degree=[];
for i =1:length(ra)
    [a1,~]=ismember(data(:,1),ra(i));
    [a2,~]=ismember(data(:,2),ra(i));
    degree(i)=sum(a1)+sum(a2);
end
avgdeg=int32(sum(degree)/length(degree));
fid = fopen('2.deepwalkAdj');
tline = fgets(fid);
embed=[];
threshold=[];
count =1;
tlines = cell(0,1);
while ischar(tline)
    if ~isempty(tline)
        tlines = tline;
        c = strsplit(tlines);
        embed(count,:)=str2double(c(1:length(u)));
        d=sort(embed(count,:),'descend');
        threshold(count)=d(avgdeg);
        count=count+1;
    end
    if count > 1000
        break;
    end
    tline = fgetl(fid);
end
fclose(fid);
avgthresh=sum(threshold)/length(threshold)
%% Remove elements below threshold using  shell script
% (awk -F " " '$3>6.9' 2.deepwalk)>2.deepwalknew

