%calculate distance between 2 vertices using dijkstra algorithm

function [route,GD] = getGD(s,d,v,f)
    GD = 0;
    route = [s];
    u = s;
    sparseMatrix = buildSparseMatrix(v,f);
    
    while (isempty(find(route==d))==1)
        %find shortest path of u's neighbors which not in route
        
        temp = sparseMatrix(u,:);
        [row,neighbors] = find(temp ~= Inf);
        neighborsNotInRoute = setdiff(neighbors,route);
        
        if(isempty(neighborsNotInRoute) == 1)
            GD = Inf;
            break;
        end
        M = min(temp(neighborsNotInRoute));
        
        u = find(temp == M);
        GD = GD + M;
        route = [route u];
    end
end
    


