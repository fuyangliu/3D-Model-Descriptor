function [sparseMatrix] = buildSparseMatrix(v,f)
Nv = size(v,2);
Nf = size(f,2);

sparseMatrix = ones(Nv);
sparseMatrix(:) = Inf;

for i = 1:Nf
    %ith triangle
    triPoints = f(:,i);
    %distance of 1 and 2 points of triangle
    disMat1 = [v(:,triPoints(1,1))'; v(:,triPoints(2,1))'];
    sparseMatrix(triPoints(1,1),triPoints(2,1)) = pdist(disMat1);
    sparseMatrix(triPoints(2,1),triPoints(1,1)) = pdist(disMat1);
    %distance of 2 and 3 points of triangle
    disMat2 = [v(:,triPoints(2,1))'; v(:,triPoints(3,1))'];
    sparseMatrix(triPoints(2,1),triPoints(3,1)) = pdist(disMat2);
    sparseMatrix(triPoints(3,1),triPoints(2,1)) = pdist(disMat2);
    %distance of 1 and 3 points of triangle
    disMat3 = [v(:,triPoints(1,1))'; v(:,triPoints(3,1))'];
    sparseMatrix(triPoints(1,1),triPoints(3,1)) = pdist(disMat3);
    sparseMatrix(triPoints(3,1),triPoints(1,1)) = pdist(disMat3);
end