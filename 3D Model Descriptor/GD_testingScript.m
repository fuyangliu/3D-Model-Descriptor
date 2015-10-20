clear;
[v,f] = read_off('/Users/fuyangliu/Desktop/3D_ComputerVision/Project2/smallTOSCA/cat0.off');
sparseMatrix = buildSparseMatrix(v,f);
iter = size(v,2);
AllGD = [];
for i = 1:3400
   [d,DD] = dijkstra(sparseMatrix,i);
   AllGD = [AllGD; d];
end
    
    