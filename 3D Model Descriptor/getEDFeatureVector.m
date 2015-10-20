function [fv] = getEDFeatureVector(v)
iter = size(v,2);

a = mean(v(1,:));
b = mean(v(2,:));
c = mean(v(3,:));
centroid = [a;b;c];

edres = [];

for i=1:iter
    temp = v(:,i);
    disMat = [temp';centroid'];
    ed = pdist(disMat);
    edres = [edres ed];
end

fv = hist(edres,500)*3400/iter;

end