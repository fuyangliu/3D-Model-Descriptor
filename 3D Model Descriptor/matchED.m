function [file1,file2,file3,file4,file5] = matchED(targetPath,path,fvs)
input = targetPath;
[vin, fin] = read_off(input);
fvin = getEDFeatureVector(vin);

fileType = '*.off';
files = dir(strcat(path,fileType));
filecells = struct2cell(files);

%Compare feature vectors with every model in dataset
Nfv = size(fvs,1);

finalList=[];

for i = 1:Nfv
    disMat = [fvin; fvs(i,:)];
    fvDis = pdist(disMat);
    ListIn = [i fvDis];
    finalList = [finalList; ListIn];
end

%Select the neareast 5
[d1,d2] = sort(finalList(:,2));
orderedList = finalList(d2,:);

file1 = cell2mat(filecells(1,orderedList(1,1)));
file2 = cell2mat(filecells(1,orderedList(2,1)));
file3 = cell2mat(filecells(1,orderedList(3,1)));    
file4 = cell2mat(filecells(1,orderedList(4,1)));    
file5 = cell2mat(filecells(1,orderedList(5,1)));



