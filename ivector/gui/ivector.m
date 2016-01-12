function varargout = ivector(varargin)
% IVECTOR MATLAB code for ivector.fig
%      IVECTOR, by itself, creates a new IVECTOR or raises the existing
%      singleton*.
%
%      H = IVECTOR returns the handle to a new IVECTOR or the handle to
%      the existing singleton*.
%
%      IVECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IVECTOR.M with the given input arguments.
%
%      IVECTOR('Property','Value',...) creates a new IVECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ivector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ivector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ivector

% Last Modified by GUIDE v2.5 12-Dec-2014 23:54:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ivector_OpeningFcn, ...
                   'gui_OutputFcn',  @ivector_OutputFcn, ...
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


% --- Executes just before ivector is made visible.
function ivector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ivector (see VARARGIN)

% Choose default command line output for ivector
handles.output = hObject;
handles.audiorec = audiorecorder(16000,8,1);
v = load('v_fin');
v = v.V;
pla = load('pla_fin');
pla = pla.pla;
handles.v = v;
handles.pla = pla;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ivector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ivector_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
%Enrollment record
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record(handles.audiorec);
disp('recording enrollment message');
set(handles.text6,'String','Recording');



% --- Executes on button press in pushbutton2.
%Enrollment playback button
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
file = handles.lastenrollsave;
[y,fs] = wavread(file)
player = audioplayer(y,fs);
playblocking(player);
catch err
    msgbox('No sample to play back','Error');
end


% --- Executes on button press in pushbutton3.
%Enrollment record stop
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
stop(handles.audiorec);
y = getaudiodata(handles.audiorec);
answer = inputdlg('Write a name for your model','Model Name');
file = strcat('Recordings\Enrollment\enrollment',answer,'.wav');
wavwrite(y,16000,char(file{1}));
set(handles.text6,'String','Stopped');
handles.lastenrollsave = char(file{1});
guidata(hObject, handles);
catch err
    msgbox('Not recording','Error');
end

% --- Executes on button press in pushbutton4.
%Enrollment button
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
V = handles.v;
pla =handles.pla;
file = handles.lastenrollsave;
f1 = strsplit(char(file),'\\');
f = strsplit(char(f1(3)),'\.');
fname = f(1);
model = enroll(file,V,pla,'n');
modname = strcat(fname,'.mod');
modsave =  strcat('models\',char(modname));
save(modsave,'model');
fid = fopen('modellist', 'at');
fprintf(fid, '%s\n', char(modname));
fclose(fid);
catch err
    msgbox('No sample to enroll','Error');
end
% --- Executes on button press in pushbutton5.
%Scoring record
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record(handles.audiorec);
disp('recording scoring message');
set(handles.text8,'String','Recording');


% --- Executes on button press in pushbutton6.
%Scoring playback
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
file = handles.lastscoresave;
[y,fs] = wavread(file);
player = audioplayer(y,fs);
playblocking(player);
catch err
    msgbox('No sample to play back','Error');
end
% --- Executes on button press in pushbutton7.
%Scoring stop recording
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
stop(handles.audiorec);
y = getaudiodata(handles.audiorec);
answer = inputdlg('Write a name for your model','Model Name');
file = strcat('Recordings\Scoring\scoring',answer,'.wav');
wavwrite(y,16000,char(file{1}));
set(handles.text8,'String','Stopped');
handles.lastscoresave = char(file{1});
guidata(hObject, handles);
catch err
    msgbox('Not recording','Error');
end

% --- Executes on button press in pushbutton8.
%Scoring button
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
V = handles.v;
pla =handles.pla;
file = handles.lastscoresave;
model = [];
score1 = score(model,file,V,pla,'y');
disp('done scoring');
score1 = transpose(score1);
score1 = sortrows(score1,2);
score1 = transpose(score1);
score1 = fliplr(score1);
data = get(handles.uitable1,'data');
data = score1';
set(handles.uitable1,'data',data);
disp('done');
i = length(score1);
mat = cell2mat(score1(2,1:i));
mat2 = cell2mat(score1(1,1:i));
bar(handles.axes1, mat(1,1:end));  
catch err
    msgbox('No sample to score','Error');
end


% modsave =  strcat('models\',char(modname));
% save(modsave,'model');
% fid = fopen('modellist', 'at');
% fprintf(fid, '%s\n', char(modname));
% fclose(fid);
