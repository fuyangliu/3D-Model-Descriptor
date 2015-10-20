clear;
load('AnglefvsIncomplete.mat');
fvs = AnglefvsIncomplete;
files = dir('smallTOSCAwithCutFull/*.off');
filecells = struct2cell(files);

path = 'smallTOSCAwithCutFull/';
iter = size(filecells,2);
finalhit = [];

for N = 1:iter
    filename = cell2mat(filecells(1,N));
   input = strcat(path,filename);
    %get input featuer vector

    [vin, fin] = read_off(input);
    fvin = getAngleFeatureVector(vin);


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



    hit = zeros(size(orderedList,1),1);

    matchFile=cell2mat(filecells(1,orderedList(1,1)));

    if isempty(strfind(matchFile,'cat')) ~= 1
        matchType = 'cat';
    end

    if isempty(strfind(matchFile,'centaur')) ~= 1
        matchType = 'centaur';
    end

    if isempty(strfind(matchFile,'david')) ~= 1
        matchType = 'david';
    end

    if isempty(strfind(matchFile,'dog')) ~= 1
        matchType = 'dog';
    end

    if isempty(strfind(matchFile,'gorilla')) ~= 1
        matchType = 'gorilla';
    end

    if isempty(strfind(matchFile,'horse')) ~= 1
        matchType = 'horse';
    end

    if isempty(strfind(matchFile,'lioness')) ~= 1
        matchType = 'lioness';
    end

    if isempty(strfind(matchFile,'michael')) ~= 1
        matchType = 'michael';
    end

    if isempty(strfind(matchFile,'seahorse')) ~= 1
        matchType = 'seahorse';
    end

    if isempty(strfind(matchFile,'victoria')) ~= 1
        matchType = 'victoria';
    end

    if isempty(strfind(matchFile,'wolf')) ~= 1
        matchType = 'wolf';
    end

    for i = 1:size(orderedList,1)
        filename = cell2mat(filecells(1,orderedList(i,1)));
        A = strfind(filename,matchType);
        if(isempty(A) ~= 1)
            hit(i,1) = 1;
        end
    end

    totalmatch = sum(hit);
    totalmodel = size(hit,1);
    p = 0;
    hit(1,4) = 1;
    for i = 1:size(hit,1)
        if hit(i,1) == 1
            p = p + 1;
        end
        hit(i,2) = p/i;
        hit(i,3) = p/totalmatch;
        if i > 1 && hit(i,3) == hit(i-1,3)
            hit(i,4) = hit(i-1,4);
        else
            hit(i,4) = hit(i,2);
        end
    end

    if N == 1 
        finalhit = [hit(:,3),hit(:,4)];
    else
        finalhit = [mean([finalhit(:,1),hit(:,3)],2), mean([finalhit(:,2),hit(:,4)],2)];
    end
end

plot(finalhit(:,1),finalhit(:,2))

        