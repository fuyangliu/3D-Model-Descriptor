[v,f] = read_off('/Users/fuyangliu/Desktop/3D_ComputerVision/Project2/smallTOSCA/cat0.off');
a = mean(v(1,:));
b = mean(v(2,:));
c = mean(v(3,:));
centroid = [a;b;c];

iter = size(v,2);

edres = [];

for i=1:iter
    temp = v(:,i);
    disMat = [temp';centroid'];
    ed = pdist(disMat);
    edres = [edres ed];
end

featureVector = sort(edres);
