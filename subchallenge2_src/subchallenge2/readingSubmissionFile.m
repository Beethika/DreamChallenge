function [list] = readingSubmissionFile(path)
%% Converts 'each line representing nodes in a community' to 'node and community;  format
fid=fopen(path);
tline = fgetl(fid);
i=1;
list={};
tlines = cell(0,1);
while ischar(tline)
    if ~isempty(tline)
        tlines = tline;
        c = strsplit(tlines);
        d=str2double(c);
        list{i}=d(3:end);
    end
    i=i+1;
    tline = fgetl(fid);
end
fclose(fid);