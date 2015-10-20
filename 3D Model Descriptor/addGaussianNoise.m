%% This function is used to create noise for the mesh files %%
function addGaussianNoise(inputFile,outputFile, noiseLevel)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% inputFile:  the input mesh file path ( '*.mat' or '.off' format)     %%%%%%%%%%
%%% outputFile: the noised mesh file ( '*.mat' or '.off' format)       %%%%%%%%%%%%
%%% noiseLevel: typically 0.001~0.01                                   %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% EXAMPLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  addGaussianNoise('./example/b0.mat','./example/b0_noise.off', 0.005);  %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  


 [~, ~, infileExt] = fileparts(inputFile);    %% get the extension of the input file
 [~, ~, outfileExt] = fileparts(outputFile);  %% get the extension of the input file
%%%%%%%%%%%%% read file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(infileExt, '.off') || strcmp(infileExt, '.OFF')
        %read mesh from the off file
        fid=fopen(inputFile);
        fgetl(fid);
        nos = fscanf(fid, '%d %d  %d', [3 1]);
        nopts = nos(1);
        notrg = nos(2);
        coord = fscanf(fid, '%g %g  %g', [3 nopts]);
        coord = coord';
        surface.X = coord(:, 1);
        surface.Y = coord(:, 2);
        surface.Z = coord(:, 3);
        
        triang=fscanf(fid, '%d %d %d %d',[4 notrg]);
        triang=triang';
        triang=triang(:,2:4)+1; %%we have added 1 because the vertex indices start from 0 in off format
        surface.TRIV = triang;
        fclose(fid);
   
    elseif strcmp(infileExt, '.mat') || strcmp(infileExt, '.MAT')
        % read bronstein model
        mesh = open(inputFile);
        surface = mesh.surface;
        coord =[surface.X surface.Y surface.Z];
        triang = surface.TRIV;
   
%     load(inputFile);
%     coord = [mesh.surface.X mesh.surface.Y mesh.surface.Z];
%     triang = mesh.surface.TRIV;
 
        nopts = length(coord);
        notrg = length(triang);
 
    elseif strcmp(infileExt, '.ply') || strcmp(infileExt, '.PLY')
        [triang, coord] = ply_read(inputFile, 'tri');
        triang = triang';
        coord = coord';
        surface.X = coord(:, 1);
        surface.Y = coord(:, 2);
        surface.Z = coord(:, 3);
        surface.TRIV = triang;
        nopts = length(coord);
        notrg = length(triang);
end
%%%%%%%%%%%%% end of reading %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%% add noise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            surface.fName='meshLabel'; %% you can replace it with anything, or just ignore it
            surface.noiseLevel=noiseLevel;
            surface=gaussianNoise(surface);
%%%%%%%%% end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%% save file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(outfileExt, '.mat') || strcmp(outfileExt, '.MAT')
       save(outputFile, 'surface');
elseif strcmp(outfileExt, '.off') || strcmp(outfileExt, '.OFF')
    ofid = fopen(outputFile,'w');
    fprintf(ofid, 'OFF\n');

    coord =[surface.X surface.Y surface.Z];
    triang = surface.TRIV;
    
    nopts = length(coord);
    notrg = length(triang);  
    
    
    line1=[nopts notrg 0];
    fprintf(ofid,'%d %d %d\n',line1);


    fprintf(ofid,'%g %g %g\n', coord');
    fprintf(ofid,'3 %d %d %d\n', triang'-1);

    fclose(ofid);
end

    
    
        
        
