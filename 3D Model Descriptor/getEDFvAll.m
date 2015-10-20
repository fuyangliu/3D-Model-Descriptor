function [fv] = getEDFvAll(v)
iter = size(v,2);

edres=[];

for i = 1:iter
    for j = 1:iter
        disMat = [v(:,i)';v(:,j)'];
        ed = pdist(disMat);
        edres = [edres ed];
    end
end

a = hist(edres,500);

fv = a*3400/iter; % normalization multiply 3400 for every fv

end
        



