%Script to PICK 5 most alike
clear;

%get Dataset feature vector matrix 
files = dir('/Users/fuyangliu/Desktop/3D_ComputerVision/Project2/smallTOSCA/*.off');
path = '/Users/fuyangliu/Desktop/3D_ComputerVision/Project2/smallTOSCA/';

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



%get input featuer vector
input = '/Users/fuyangliu/Desktop/3D_ComputerVision/Project2/smallTOSCA/gorilla7.off';
[vin, fin] = read_off(input);
fvin = getEDFeatureVector(vin);


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
[d1 d2] = sort(finalList(:,2));
orderedList = finalList(d2,:);

file1 = cell2mat(filecells(1,orderedList(1,1)));
file2 = cell2mat(filecells(1,orderedList(2,1)));
file3 = cell2mat(filecells(1,orderedList(3,1)));    
file4 = cell2mat(filecells(1,orderedList(4,1)));    
file5 = cell2mat(filecells(1,orderedList(5,1)));
    

