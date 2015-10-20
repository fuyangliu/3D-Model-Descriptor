function [fvs] = getEDfvs(path)


fileType = '*.off';
files = dir(strcat(path,fileType));

fvs = [];

filecells = struct2cell(files);
iter = size(filecells,2);

for i = 1:iter
   filename = cell2mat(filecells(1,i));
   fileToRun = strcat(path,filename);
   [v,f] = read_off(fileToRun);
   fv = getEDFeatureVector(v);
   fvs = [fvs;fv];
end