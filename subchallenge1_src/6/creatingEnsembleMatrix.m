%% loading communities detected for different networks for each node
function [data] = creatingEnsembleMatrix()
a=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
str=num2str(a(1));
data=importdata(strcat(str,'.mod'));
for i=2:length(a)
    str=num2str(a(i));
    d=importdata(strcat(str,'.mod'));
    data=[data d(:,2)];
end
