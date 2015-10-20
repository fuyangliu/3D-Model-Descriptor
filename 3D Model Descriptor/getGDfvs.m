function [fvs] = getGDfvs(path)


fileType = '*.off';
files = dir(strcat(path,fileType));

fvs = [];

filecells = struct2cell(files);
iter = size(filecells,2);

for i = 1:iter
   filename = cell2mat(filecells(1,i));
   fileToRun = strcat(path,filename);
   [v,f] = read_off(fileToRun);
   fv = getGDFeatureVector(v,f);
   fvs = [fvs;fv];
end