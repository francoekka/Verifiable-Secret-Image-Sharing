%%read data from a file
function [A] = partread()
% type - to show contents of a file
fid = fopen('details.txt','r');
A = fscanf(fid,'%s',[32 inf]); %get values from file
A=A';%% for transpose
end
