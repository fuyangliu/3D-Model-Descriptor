function [GDfv] = getGDFeatureVector(v,f)
iter = size(v,2);

a = mean(v(1,:));
b = mean(v(2,:));
c = mean(v(3,:));
centroid = [a;b;c];

edFromCenter = [];

for i=1:iter
    temp = v(:,i);
    disMat = [temp';centroid'];
    ed = pdist(disMat);
    edFromCenter = [edFromCenter ed];
end

[M I] = min(edFromCenter);

sparseMatrix = buildSparseMatrix(v,f);
[GD,DD] = dijkstra(sparseMatrix, I);

GDfv = hist(GD, 500)*3400/iter;

end


