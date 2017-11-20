%% Converts 'each line representing nodes in a community' to 'node and community;  format
fid=fopen('1.mcl');
tline = fgetl(fid);
i=1;
cluster=[];
while ischar(tline)
    if ~isempty(tline)
        tlines = tline;
        c = strsplit(tlines);
        d=str2double(c);
    end
    for e=1:length(c)
        cluster(end+1,1)=d(e);
        cluster(end,2)=i;
    end
    i=i+1;
    tline = fgetl(fid);
end
fclose(fid);
dlmwrite('1.n2c',cluster,'\t');
