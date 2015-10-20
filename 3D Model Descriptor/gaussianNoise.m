 
function [varargout]=gaussianNoise(varargin)
%Add normal noise to an existing mesh; The noise level is taken as a
%percentage of the maximum dimension of the bounding box for the model.
%This function takes in either a struct or individual arguments and will
%either output a struct or the arguments shown below
%[meshStruct]=addNoise2(meshStruct);
%[coord,tri]=addNoise2(coord,tri,fName,noiselevel);
%[coord,tri,fName]=addShotNoise2(coord,tri,fName,noiselevel)
%This function written by Andrew Polk
%07/25/2011 
if isstruct(varargin{1})
    surface=varargin{1};
    coord=[surface.X,surface.Y,surface.Z];
    tri=surface.TRIV;
    fName=surface.fName;
    noiseLevel=surface.noiseLevel;
else
    coord=varargin{1};
    tri=varargin{2};
    fName=varargin{3};
    noiseLevel=varargin{4};
end





normals = compute_normal(coord',tri');
    rho = randn(1,size(coord',2))*noiseLevel*max((max(coord)-min(coord)));
    %rho=abs(rho);
    coord = coord' + repmat(rho,3,1).*normals;
    coord=coord';
   fName=[fName,'Noise',num2str(round(noiseLevel*100))]; 
    
if nargout==1
    surface.X=coord(:,1);
    surface.Y=coord(:,2);
    surface.Z=coord(:,3);
    surface.TRIV=tri;
    surface.fName=fName;
    varargout{1}=surface;
elseif nargout==2
    varargout{1}=coord;
    varargout{2}=tri;
else
    varargout{1}=coord;
    varargout{2}=tri;
    varargout{3}=fName;
end

function [normal,normalf] = compute_normal(vertex,face)

% compute_normal - compute the normal of a triangulation
%
%   [normal,normalf] = compute_normal(vertex,face);
%
%   normal(i,:) is the normal at vertex i.
%   normalf(j,:) is the normal at face j.
%
%   Copyright (c) 2004 Gabriel Peyré

[vertex,face] = check_face_vertex(vertex,face);

nface = size(face,2);
nvert = size(vertex,2);
normal = zeros(3, nvert);

% unit normals to the faces
normalf = crossp( vertex(:,face(2,:))-vertex(:,face(1,:)), ...
    vertex(:,face(3,:))-vertex(:,face(1,:)) );
d = sqrt( sum(normalf.^2,1) ); d(d<eps)=1;
normalf = normalf ./ repmat( d, 3,1 );

% unit normal to the vertex
normal = zeros(3,nvert);
for i=1:nface
    f = face(:,i);
    for j=1:3
        normal(:,f(j)) = normal(:,f(j)) + normalf(:,i);
    end
end
% normalize
d = sqrt( sum(normal.^2,1) ); d(d<eps)=1;
normal = normal ./ repmat( d, 3,1 );

% enforce that the normal are outward
v = vertex - repmat(mean(vertex,1), 3,1);
s = sum( v.*normal, 2 );
if sum(s>0)<sum(s<0)
    % flip
    normal = -normal;
    normalf = -normalf;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function z = crossp(x,y)
% x and y are (m,3) dimensional
z = x;
z(1,:) = x(2,:).*y(3,:) - x(3,:).*y(2,:);
z(2,:) = x(3,:).*y(1,:) - x(1,:).*y(3,:);
z(3,:) = x(1,:).*y(2,:) - x(2,:).*y(1,:);


function [vertex,face] = check_face_vertex(vertex,face, options)

% check_face_vertex - check that vertices and faces have the correct size
%
%   [vertex,face] = check_face_vertex(vertex,face);
%
%   Copyright (c) 2007 Gabriel Peyre

vertex = check_size(vertex,2,4);
face = check_size(face,3,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function a = check_size(a,vmin,vmax)
if isempty(a)
    return;
end
if size(a,1)>size(a,2)
    a = a';
end
if size(a,1)<3 && size(a,2)==3
    a = a';
end
if size(a,1)<=3 && size(a,2)>=3 && sum(abs(a(:,3)))==0
    % for flat triangles
    a = a';
end
if size(a,1)<vmin ||  size(a,1)>vmax
    error('face or vertex is not of correct size');
end

