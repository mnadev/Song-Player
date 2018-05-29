
function varargout = guisong(varargin)
% GUISONG MATLAB code for guisong.fig
%      GUISONG, by itself, creates a new GUISONG or raises the existing
%      singleton*.
%
%      H = GUISONG returns the handle to a new GUISONG or the handle to
%      the existing singleton*.
%
%      GUISONG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUISONG.M with the given input arguments.
%
%      GUISONG('Property','Value',...) creates a new GUISONG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guisong_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guisong_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guisong

% Last Modified by GUIDE v2.5 29-May-2018 17:09:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guisong_OpeningFcn, ...
                   'gui_OutputFcn',  @guisong_OutputFcn, ...
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

% --- Executes just before guisong is made visible.
function guisong_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guisong (see VARARGIN)

% Choose default command line output for guisong
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes guisong wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guisong_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% create global vars filename and player 
% which is filename string and audioplayer variable


% --- Executes on button press in rewind.
function rewind_Callback(hObject, eventdata, handles)
% hObject    handle to rewind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play_btn.
function play_btn_Callback(hObject, eventdata, handles)
% hObject    handle to play_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
player = handles.player;

resume(handles.player);
handles.player = player;
guidata(hObject, handles);


% --- Executes on button press in pause_btn.
function pause_btn_Callback(hObject, eventdata, handles)
% hObject    handle to pause_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
player = handles.player;

pause(player);
handles.player = player;
guidata(hObject, handles);


% --- Executes on button press in browse_btn.
function browse_btn_Callback(hObject, eventdata, handles)
% hObject    handle to browse_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% allow user to browse and only choose an mp3 file
[file, path] = uigetfile('*.mp3','Select an Audio File:');
filename = strcat(path, file);
set(handles.data_panel, 'Title', file);
[data, rate] = audioread(filename);
player = audioplayer(data, rate);
handles.filename = filename;
handles.player = player;
guidata(hObject, handles);
