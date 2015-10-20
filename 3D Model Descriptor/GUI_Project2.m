function varargout = GUI_Project2(varargin)
% GUI_PROJECT2 MATLAB code for GUI_Project2.fig
%      GUI_PROJECT2, by itself, creates a new GUI_PROJECT2 or raises the existing
%      singleton*.
%
%      H = GUI_PROJECT2 returns the handle to a new GUI_PROJECT2 or the handle to
%      the existing singleton*.
%
%      GUI_PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PROJECT2.M with the given input arguments.
%
%      GUI_PROJECT2('Property','Value',...) creates a new GUI_PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Project2

% Last Modified by GUIDE v2.5 14-Oct-2015 15:10:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Project2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Project2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_Project2 is made visible.
function GUI_Project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Project2 (see VARARGIN)

% Choose default command line output for GUI_Project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Project2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
contents = get(handles.popupmenu1,'String'); 
popupmenu1value = contents{get(handles.popupmenu1,'Value')};
handles.popupmenu1value = popupmenu1value;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
contents = get(handles.popupmenu2,'String'); 
popupmenu2value = contents{get(handles.popupmenu2,'Value')};
handles.popupmenu2value = popupmenu2value;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Compute_pushbutton.
function Compute_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Compute_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
descriptor = handles.popupmenu1value;
dataset = handles.popupmenu2value;

switch dataset
    case 'smallTOSCAClean'
        folder = 'smallTOSCA/';
    case 'smallTOSCANoise'
        folder = 'smallTOSCAwithNoise/';
    case 'smallTOSCAIncomplete'
        folder = 'smallTOSCAwithCutFull/';
end

pathGET = get(handles.edit1,'String');
targetPath = pathGET{1};
[vin, fin] = read_off(targetPath);
%source graph
axes(handles.axes1)
cla(handles.axes1,'reset')
plot3(vin(1,:),vin(2,:),vin(3,:),'r.'), hold on, axis equal

if strcmp(descriptor,'Euclidean Distance Descriptor') && strcmp(dataset,'smallTOSCAClean')
    load('EDfvsClean.mat');
    fvs = EDfvsClean;
    files = dir('smallTOSCA/*.off');
    filecells = struct2cell(files);
    fvin = getEDFeatureVector(vin);
end

if strcmp(descriptor,'Euclidean Distance Descriptor') && strcmp(dataset,'smallTOSCANoise')
    load('EDfvsNoise.mat');
    fvs = EDfvsNoise;
    files = dir('smallTOSCAwithNoise/*.off');
    filecells = struct2cell(files);
    fvin = getEDFeatureVector(vin);
end

if strcmp(descriptor,'Euclidean Distance Descriptor') && strcmp(dataset,'smallTOSCAIncomplete')
    load('EDfvsIncomplte.mat');
    fvs = EDfvsIncomplete;
    files = dir('smallTOSCAwithCutFull/*.off');
    filecells = struct2cell(files);
    fvin = getEDFeatureVector(vin);
end

if strcmp(descriptor,'Geodesic Distance Descriptor') && strcmp(dataset,'smallTOSCAClean')
    load('GDfvsClean.mat');
    fvs = GDfvsClean;
    files = dir('smallTOSCA/*.off');
    filecells = struct2cell(files);
    fvin = getGDFeatureVector(vin,fin);
end

if strcmp(descriptor,'Geodesic Distance Descriptor') && strcmp(dataset,'smallTOSCANoise')
    load('GDfvsNoise.mat');
    fvs = GDfvsNoise;
    files = dir('smallTOSCAwithNoise/*.off');
    filecells = struct2cell(files);
    fvin = getGDFeatureVector(vin,fin);
end

if strcmp(descriptor,'Geodesic Distance Descriptor') && strcmp(dataset,'smallTOSCAIncomplete')
    load('GDfvsIncomplete.mat');
    fvs = GDfvsIncomplete;
    files = dir('smallTOSCAwithCutFull/*.off');
    filecells = struct2cell(files);
    fvin = getGDFeatureVector(vin,fin);
end

%%% angle descriptor
if strcmp(descriptor,'Angle Descriptor') && strcmp(dataset,'smallTOSCAClean')
    load('AnglefvsClean.mat');
    fvs = AnglefvsClean;
    files = dir('smallTOSCA/*.off');
    filecells = struct2cell(files);
    fvin = getAngleFeatureVector(vin);
end

if strcmp(descriptor,'Angle Descriptor') && strcmp(dataset,'smallTOSCANoise')
    load('AnglefvsNoise.mat');
    fvs = AnglefvsNoise;
    files = dir('smallTOSCAwithNoise/*.off');
    filecells = struct2cell(files);
    fvin = getAngleFeatureVector(vin);
end

if strcmp(descriptor,'Angle Descriptor') && strcmp(dataset,'smallTOSCAIncomplete')
    load('AnglefvsIncomplete.mat');
    fvs = AnglefvsIncomplete;
    files = dir('smallTOSCAwithCutFull/*.off');
    filecells = struct2cell(files);
    fvin = getAngleFeatureVector(vin);
end
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
[d1,d2] = sort(finalList(:,2));
orderedList = finalList(d2,:);

file1 = cell2mat(filecells(1,orderedList(1,1)));
file2 = cell2mat(filecells(1,orderedList(2,1)));
file3 = cell2mat(filecells(1,orderedList(3,1)));    
file4 = cell2mat(filecells(1,orderedList(4,1)));    
file5 = cell2mat(filecells(1,orderedList(5,1)));

%file1
file1path = strcat(folder,file1)
[v1,f1] = read_off(file1path);
axes(handles.result1)
cla(handles.result1,'reset')
plot3(v1(1,:),v1(2,:),v1(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title(file1)
%file2
file2path = strcat(folder,file2);
[v2,f2] = read_off(file2path);
axes(handles.result2)
cla(handles.result2,'reset')
plot3(v2(1,:),v2(2,:),v2(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title(file2)
%file3
file3path = strcat(folder,file3);
[v3,f3] = read_off(file3path);
axes(handles.result3)
cla(handles.result3,'reset')
plot3(v3(1,:),v3(2,:),v3(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title(file3)
%file4
file4path = strcat(folder,file4);
[v4,f4] = read_off(file4path);
axes(handles.result4)
cla(handles.result4,'reset')
plot3(v4(1,:),v4(2,:),v4(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title(file4)
%file5
file5path = strcat(folder,file5);
[v5,f5] = read_off(file5path);
axes(handles.result5)
cla(handles.result5,'reset')
plot3(v5(1,:),v5(2,:),v5(3,:),'b.'), hold on, axis equal
plot3([1 1 0],[0 1 1],[0 0 0],'r-',[1 1],[1 1],[0 1],'r-','LineWidth',2)
title(file5)


guidata(hObject,handles);
