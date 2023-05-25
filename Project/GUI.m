function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 17-Dec-2022 04:07:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
img=imread('Wallpaper.jpg');

 % create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = img; imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');


% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
    global X
    filter ={'*.tif;*.tiff;*.bmp;*.jpg;*.jfif;*.jpeg;*.gif;*.png;*.eps;*.raw;*.cr2;*.nef;*.orf;*.srf','img(*.tif;*.tiff;*.bmp;*.jpg;*.jfif;*.jpeg;*.gif;*.png;*.eps;*.raw;*.cr2;*.nef;*.orf;*.srf'};
    [X,path,filterindex]=uigetfile(filter);
    set(handles.Upload_txt,'String',path);
    X=imread([path X]);
    axes(handles.axes1);
    imshow(X);
    
% --- Executes on selection change in From_Menu.
function From_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to From_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns From_Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from From_Menu


% --- Executes during object creation, after setting all properties.
function From_Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to From_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Binary_btn.
function Binary_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Threshold_txt, 'String')); 
if(L==3)
    result=RGBtoBinary( X,a );
else
    result=GraytoBinary( X,a );
end
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Grey_btn.
function Grey_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Option_txt, 'String'));
if(a>5||a<1)
    a=1;
end
if(L==3)
    result=RGBtoGray( X,a) ;
else
    result=X;
end
axes(handles.axes2);
imshow(result);




function Threshold_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Threshold_txt as text
%        str2double(get(hObject,'String')) returns contents of Threshold_txt as a double



% --- Executes during object creation, after setting all properties.
function Threshold_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Threshold_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Option_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Option_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Option_txt as text
%        str2double(get(hObject,'String')) returns contents of Option_txt as a double

% --- Executes during object creation, after setting all properties.
function Option_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Option_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Add_btn.
function Add_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Offset_txt, 'String'));
%Brightness( image , offset ,option)
if(L==3)
    result=Brightness_RGB( X , a ,1);
else
    result=Brightness( X , a ,1);
end
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Multiply_btn.
function Multiply_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Offset_txt, 'String'));
%Brightness( image , offset ,option)
if(L==3)
    result=Brightness_RGB( X , a ,2);
else
    result=Brightness( X , a ,2);
end
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Sub_btn.
function Sub_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Offset_txt, 'String'));
%Brightness( image , offset ,option)
if(L==3)
    result=Brightness_RGB( X , a ,3);
else
    result=Brightness( X , a ,3);
end
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Div_btn.
function Div_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Offset_txt, 'String'));
%Brightness( image , offset ,option)
if(L==3)
    result=Brightness_RGB( X , a ,4);
else
    result=Brightness( X , a ,4);
end
axes(handles.axes2);
imshow(result);



function Offset_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Offset_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Offset_txt as text
%        str2double(get(hObject,'String')) returns contents of Offset_txt as a double


% --- Executes during object creation, after setting all properties.
function Offset_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Offset_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Negative_btn.
function Negative_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
result=Transformation( X,0 ,1);
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Log_btn.
function Log_btn_Callback(hObject, eventdata, handles)
global X
global resul
[H W L]=size(X);
result=Transformation( X,1,1);
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Inv_Log_btn.
function Inv_Log_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
result=Transformation( X,2,1);
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Root_btn.
function Root_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
result=Transformation( X,4,1);
axes(handles.axes2);
imshow(result);
% --- Executes on button press in Power_btn.
function Power_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Gamma_txt, 'String'));
result=Transformation( X,3,a);
axes(handles.axes2);
imshow(result);



function Gamma_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gamma_txt as text
%        str2double(get(hObject,'String')) returns contents of Gamma_txt as a double


% --- Executes during object creation, after setting all properties.
function Gamma_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gamma_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Histogram_btn.
function Histogram_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
axes(handles.axes2);
Histogram(X);



% --- Executes on button press in Histogram_Equalization_btn.
function Histogram_Equalization_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
axes(handles.axes2);
Histogram_Equalization_Final(X);


function New_min_txt_Callback(hObject, eventdata, handles)
% hObject    handle to New_min_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of New_min_txt as text
%        str2double(get(hObject,'String')) returns contents of New_min_txt as a double


% --- Executes during object creation, after setting all properties.
function New_min_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to New_min_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function New_max_txt_Callback(hObject, eventdata, handles)
% hObject    handle to New_max_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of New_max_txt as text
%        str2double(get(hObject,'String')) returns contents of New_max_txt as a double


% --- Executes during object creation, after setting all properties.
function New_max_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to New_max_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Contrast_Streching_btn.
function Contrast_Streching_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.New_min_txt, 'String'));
b=str2double(get(handles.New_max_txt, 'String'));
if(L==3)
    result=ContrastStrechingRGB( X,a,b );
else
    result=ContrastStreching( X,a,b );
end
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Fourier_Transform_btn.
function Fourier_Transform_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
axes(handles.axes2);
if(L==3)
    result=FourierTransformation_RGB(X);
else
    result=FourierTransformation(X);
    result=mat2gray(result);
end

imshow(result);


% --- Executes on button press in Inverse_Fourier_Transform_btn.
function Inverse_Fourier_Transform_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
axes(handles.axes2);
if(L==3)
result=InverseFourierTransformation_RGB(X);

else
result=InverseFourierTransformation(fft2(X));
result=mat2gray(result);
end
imshow(result);

% --- Executes on button press in Fourier_Transform_Shifting_btn.
function Fourier_Transform_Shifting_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
axes(handles.axes2);
if(L==3)
    result=FourierTransformationShifting_RGB(X);
else
    result=FourierTransformationShifting(X);
result=mat2gray(result);
end

imshow(result);


% --- Executes on button press in Gaussian_Noise_btn.
function Gaussian_Noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Meu_txt, 'String'));
b=str2double(get(handles.Segma_txt, 'String'));
if(L==3)
    result=Gaussian_Normal_Noise_RGB( X,a,b );
else
    result=Gaussian_Normal_Noise( X,a,b );
end
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Erlang_Noise_btn.
function Erlang_Noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Erlang_A_txt, 'String'));
b=str2double(get(handles.Erlang_B_txt, 'String'));
if(L==3)
    result=Erlang_Gamma_Noise_RGB( X,a,b );
else
    result=Erlang_Gamma_Noise( X,a,b );
end
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Rayleigh_Noise_btn.
function Rayleigh_Noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Rayleigh_A_txt, 'String'));
b=str2double(get(handles.Rayleigh_B_txt, 'String'));
if(L==3)
    result=RayLeigh_Noise_RGB( X,a,b );
else
    result=RayLeigh_Noise( X,a,b );
end
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Exponential_Noise_btn.
function Exponential_Noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Exponential_A_txt, 'String'));
if(L==3)
    result=Exponential_Noise_RGB( X,a );
else
    result=Exponential_Noise( X,a );
end
axes(handles.axes2);
imshow(result);


% --- Executes on button press in Uniform_Noise_btn.
function Uniform_Noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.Uniform_A_txt, 'String'));
b=str2double(get(handles.Uniform_B_txt, 'String'));
if(L==3)
    result=Uniform_Noise_RGB( X,a,b );
else
    result=Uniform_Noise( X,a,b );
end
axes(handles.axes2);
imshow(result);

% --- Executes on button press in Bipolar_impulse_noise_btn.
function Bipolar_impulse_noise_btn_Callback(hObject, eventdata, handles)
global X
global result
[H W L]=size(X);
a=str2double(get(handles.PS_txt, 'String'));
b=str2double(get(handles.PP_txt, 'String'));
if(L==3)
    result=Bipoler_SaltandPepper_Noise_RGB( X,a,b );
else
    result=Bipoler_SaltandPepper_Noise( X,a,b );
end
axes(handles.axes2);
imshow(result);



function Meu_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Meu_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Meu_txt as text
%        str2double(get(hObject,'String')) returns contents of Meu_txt as a double


% --- Executes during object creation, after setting all properties.
function Meu_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Meu_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Segma_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Segma_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Segma_txt as text
%        str2double(get(hObject,'String')) returns contents of Segma_txt as a double


% --- Executes during object creation, after setting all properties.
function Segma_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Segma_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rayleigh_A_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Rayleigh_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rayleigh_A_txt as text
%        str2double(get(hObject,'String')) returns contents of Rayleigh_A_txt as a double


% --- Executes during object creation, after setting all properties.
function Rayleigh_A_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rayleigh_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rayleigh_B_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Rayleigh_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rayleigh_B_txt as text
%        str2double(get(hObject,'String')) returns contents of Rayleigh_B_txt as a double


% --- Executes during object creation, after setting all properties.
function Rayleigh_B_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rayleigh_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Erlang_A_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Erlang_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Erlang_A_txt as text
%        str2double(get(hObject,'String')) returns contents of Erlang_A_txt as a double


% --- Executes during object creation, after setting all properties.
function Erlang_A_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Erlang_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Erlang_B_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Erlang_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Erlang_B_txt as text
%        str2double(get(hObject,'String')) returns contents of Erlang_B_txt as a double


% --- Executes during object creation, after setting all properties.
function Erlang_B_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Erlang_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Exponential_A_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Exponential_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Exponential_A_txt as text
%        str2double(get(hObject,'String')) returns contents of Exponential_A_txt as a double


% --- Executes during object creation, after setting all properties.
function Exponential_A_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Exponential_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uniform_A_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Uniform_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Uniform_A_txt as text
%        str2double(get(hObject,'String')) returns contents of Uniform_A_txt as a double


% --- Executes during object creation, after setting all properties.
function Uniform_A_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uniform_A_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uniform_B_txt_Callback(hObject, eventdata, handles)
% hObject    handle to Uniform_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Uniform_B_txt as text
%        str2double(get(hObject,'String')) returns contents of Uniform_B_txt as a double


% --- Executes during object creation, after setting all properties.
function Uniform_B_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Uniform_B_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PS_txt_Callback(hObject, eventdata, handles)
% hObject    handle to PS_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PS_txt as text
%        str2double(get(hObject,'String')) returns contents of PS_txt as a double


% --- Executes during object creation, after setting all properties.
function PS_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PS_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PP_txt_Callback(hObject, eventdata, handles)
% hObject    handle to PP_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PP_txt as text
%        str2double(get(hObject,'String')) returns contents of PP_txt as a double


% --- Executes during object creation, after setting all properties.
function PP_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PP_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QorD_txt_Callback(hObject, eventdata, handles)
% hObject    handle to QorD_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QorD_txt as text
%        str2double(get(hObject,'String')) returns contents of QorD_txt as a double


% --- Executes during object creation, after setting all properties.
function QorD_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QorD_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Noise_Cancellation_combo.
function Noise_Cancellation_combo_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function Noise_Cancellation_combo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noise_Cancellation_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_Filter_btn.
function Apply_Filter_btn_Callback(hObject, eventdata, handles)
v = get(handles.Noise_Cancellation_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Average_Filter_RGB( X);
else
    result=Average_Filter( X );
end
elseif v == 2
   if(L==3)
    result=Geometric_mean_Filter_RGB( X);
else
    result=Geometric_mean_Filter( X );
end
elseif v == 3
   if(L==3)
    result=Harmonic_mean_Filter_RGB( X);
else
    result=Harmonic_mean_Filter( X );
   end
elseif v == 4
    a=str2double(get(handles.QorD_txt, 'String'));
   if(L==3)
    result=Contraharmonic_mean_Filter_RGB(X,a);
else
    result=Contraharmonic_mean_Filter(X,a);
   end
elseif v == 5
   if(L==3)
    result=Median_Filter_RGB( X);
else
    result=Median_Filter( X );
   end
elseif v == 6
   if(L==3)
    result=Max_Filter_RGB( X);
else
    result=Max_Filter( X );
   end
elseif v == 7
   if(L==3)
    result=Min_Filter_RGB( X);
else
    result=Min_Filter( X );
   end
elseif v == 8
   if(L==3)
    result=Midpoint_Filter_RGB( X);
else
    result=Midpoint_Filter( X );
   end
elseif v == 9
   a=str2double(get(handles.QorD_txt, 'String'));
   if(L==3)
    result=Alpha_trimmed_mean_Filter_RGB(X,a);
else
    result=Alpha_trimmed_mean_Filter(X,a);
   end
elseif v == 10
   if(L==3)
    result=AdaptiveMedianFilter_RGB(X,3);
else
    result=AdaptiveMedianFilter(X,3);
   end
end
axes(handles.axes2);
imshow(result);



function N_txt_Callback(hObject, eventdata, handles)
% hObject    handle to N_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_txt as text
%        str2double(get(hObject,'String')) returns contents of N_txt as a double


% --- Executes during object creation, after setting all properties.
function N_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Frequency_Domain_combo.
function Frequency_Domain_combo_Callback(hObject, eventdata, handles)
% hObject    handle to Frequency_Domain_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Frequency_Domain_combo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Frequency_Domain_combo


% --- Executes during object creation, after setting all properties.
function Frequency_Domain_combo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequency_Domain_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_Filter_F_btn.
function Apply_Filter_F_btn_Callback(hObject, eventdata, handles)
v = get(handles.Frequency_Domain_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
a=str2double(get(handles.D0_txt, 'String'));
b=str2double(get(handles.N_txt, 'String'));
if v == 1
   if(L==3)
    result=Ideal_Filter_RGB(X,a,0);
else
    result=Ideal_Filter(X,a,0);
end
elseif v == 2
   if(L==3)
    result=Butterworth_Filter_RGB(X,a,0,b);
else
    result=Butterworth_Filter( X ,a,0,b);
end
elseif v == 3
   if(L==3)
    result=Gaussian_Filter_RGB(X,a,0);
else
    result=Gaussian_Filter( X,a,0 );
   end
elseif v == 4
     if(L==3)
    result=Ideal_Filter_RGB(X,a,1);
else
    result=Ideal_Filter( X,a,1 );
     end
elseif v == 5
   if(L==3)
    result=Butterworth_Filter_RGB(X,a,1,b);
else
    result=Butterworth_Filter( X ,a,1,b);
end
elseif v == 6
  if(L==3)
    result=Gaussian_Filter_RGB(X,a,1);
else
    result=Gaussian_Filter( X,a,1 );
  end
end
axes(handles.axes2);
imshow(result);




function D0_txt_Callback(hObject, eventdata, handles)
% hObject    handle to D0_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of D0_txt as text
%        str2double(get(hObject,'String')) returns contents of D0_txt as a double


% --- Executes during object creation, after setting all properties.
function D0_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D0_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Linear_Filter_combo.
function Linear_Filter_combo_Callback(hObject, eventdata, handles)
% hObject    handle to Linear_Filter_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Linear_Filter_combo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Linear_Filter_combo


% --- Executes during object creation, after setting all properties.
function Linear_Filter_combo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Linear_Filter_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_Filter_Linear_btn.
function Apply_Filter_Linear_btn_Callback(hObject, eventdata, handles)
v = get(handles.Linear_Filter_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
a=str2double(get(handles.a, 'String'));
b=str2double(get(handles.b, 'String'));
c=str2double(get(handles.c, 'String'));
d=str2double(get(handles.d, 'String'));
e=str2double(get(handles.e, 'String'));
f=str2double(get(handles.f, 'String'));
g=str2double(get(handles.g, 'String'));
h=str2double(get(handles.h, 'String'));
i=str2double(get(handles.i, 'String'));
if v == 1
   if(L==3)
   
    result=Correlattion_Filter_RGB(X,a,b,c,d,e,f,g,h,i);
    else
    result=Correlattion_Filter(X,a,b,c,d,e,f,g,h,i);
    end
elseif v == 2
   if(L==3)
    result=Covolution_Filter_RGB(X,a,b,c,d,e,f,g,h,i);
    else
    result=Covolution_Filter(X,a,b,c,d,e,f,g,h,i);
    end
elseif v == 3
    set(handles.a,'String','1/9');
    set(handles.b,'String','1/9');
    set(handles.c,'String','1/9');
    set(handles.d,'String','1/9');
    set(handles.e,'String','1/9');
    set(handles.f,'String','1/9');
    set(handles.g,'String','1/9');
    set(handles.h,'String','1/9');
    set(handles.i,'String','1/9');
   if(L==3)
    result=Average_Filter_RGB(X);
else
    result=Average_Filter(X);
   end
elseif v == 4
    set(handles.a,'String','1/16');
    set(handles.b,'String','2/16');
    set(handles.c,'String','1/16');
    set(handles.d,'String','2/16');
    set(handles.e,'String','4/16');
    set(handles.f,'String','2/16');
    set(handles.g,'String','1/16');
    set(handles.h,'String','2/16');
    set(handles.i,'String','1/16');
     if(L==3)
     result=Weighted_Filter_RGB(X);
    else
    result=Weighted_Filter(X);
     end
end
axes(handles.axes2);
imshow(result);



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c_Callback(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c as text
%        str2double(get(hObject,'String')) returns contents of c as a double


% --- Executes during object creation, after setting all properties.
function c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_Callback(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d as text
%        str2double(get(hObject,'String')) returns contents of d as a double


% --- Executes during object creation, after setting all properties.
function d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double


% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g as text
%        str2double(get(hObject,'String')) returns contents of g as a double


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as a double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i_Callback(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i as text
%        str2double(get(hObject,'String')) returns contents of i as a double


% --- Executes during object creation, after setting all properties.
function i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Non_Linear_Filter_combo.
function Non_Linear_Filter_combo_Callback(hObject, eventdata, handles)
% hObject    handle to Non_Linear_Filter_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Non_Linear_Filter_combo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Non_Linear_Filter_combo


% --- Executes during object creation, after setting all properties.
function Non_Linear_Filter_combo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Non_Linear_Filter_combo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Apply_Filter_Non_Linear_btn.
function Apply_Filter_Non_Linear_btn_Callback(hObject, eventdata, handles)
v = get(handles.Non_Linear_Filter_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Min_Filter_RGB(X);
else
    result=Min_Filter(X);
end
elseif v == 2
   if(L==3)
    result=Max_Filter_RGB(X);
else
    result=Max_Filter(X);
end
elseif v == 3
   if(L==3)
    result=Median_Filter_RGB(X);
else
    result=Median_Filter( X );
   end
elseif v == 4
     if(L==3)
    result=Midpoint_Filter_RGB(X);
else
    result=Midpoint_Filter( X );
     end
end
axes(handles.axes2);

imshow(result);


% --- Executes on button press in Convert_btn.
function Convert_btn_Callback(hObject, eventdata, handles)
global X
global result
X=result;
axes(handles.axes1);
imshow(X);
%s='enna';
%imwrite(result,strcat(s,'.png'),'png');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Convert_btn.
function Convert_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Save_btn.
function Save_btn_Callback(hObject, eventdata, handles)
global X
global result
filter ={'*.png';'*.tif';'*.tiff';'*.bmp';'*.jpg';'*.jfif';'*.jpeg';'*.gif';'*.eps';'*.raw';'*.cr2';'*.nef';'*.orf';'*.srf'};
[baseFileName, ImageFolder] = uiputfile(filter,'Select Location to save image');
if isequal(baseFileName,0) || isequal(ImageFolder,0)
   disp('User clicked Cancel.')
else
   disp(['User selected ',fullfile(ImageFolder,baseFileName),...
         ' and then clicked Save.'])
end
fullFileName = fullfile(ImageFolder, baseFileName);
imwrite(result, fullFileName);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Sve_btn.
function Save_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function Reset_btn_Callback(hObject, eventdata, handles)
    set(handles.a,'String','');
    set(handles.b,'String','');
    set(handles.c,'String','');
    set(handles.d,'String','');
    set(handles.e,'String','');
    set(handles.f,'String','');
    set(handles.g,'String','');
    set(handles.h,'String','');
    set(handles.i,'String','');
function Reset_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function Point_combo_Callback(hObject, eventdata, handles)



function Point_combo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Line_combo_Callback(hObject, eventdata, handles)

function Line_combo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Point_Apply_Filter_btn_Callback(hObject, eventdata, handles)
    v = get(handles.Point_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Point_Detection_Filter_RGB(X);
   else
    result=Point_Detection_Filter(X);
   end
elseif v == 2
   if(L==3)
    result=Laplacian_Filter_RGB(X);
   else
    result=Laplacian_Filter(X);
   end
end
axes(handles.axes2);
imshow(result);

function Point_Apply_Filter_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function H_btn_Callback(hObject, eventdata, handles)
v = get(handles.Line_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Sobel_Filter_H_RGB(X);
   else
    result=Sobel_Filter_H(X);
   end
elseif v == 2
   if(L==3)
    result=Roberts_Filter_H_RGB(X);
   else
    result=Roberts_Filter_H(X);
   end
elseif v == 3
   if(L==3)
    result=Line_Shapening_Filter_H_RGB(X);
   else
    result=Line_Shapening_Filter_H(X);
   end
end
axes(handles.axes2);
imshow(result);

function H_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function V_btn_Callback(hObject, eventdata, handles)
v = get(handles.Line_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Sobel_Filter_V_RGB(X);
   else
    result=Sobel_Filter_V(X);
   end
elseif v == 2
   if(L==3)
    result=Roberts_Filter_V_RGB(X);
   else
    result=Roberts_Filter_V(X);
   end
elseif v == 3
   if(L==3)
    result=Line_Shapening_Filter_V_RGB(X);
   else
    result=Line_Shapening_Filter_V(X);
   end
end
axes(handles.axes2);
imshow(result);

function V_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function DR_btn_Callback(hObject, eventdata, handles)
v = get(handles.Line_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Sobel_Filter_DR_RGB(X);
   else
    result=Sobel_Filter_DR(X);
   end
elseif v == 2
   if(L==3)
    result=Roberts_Filter_DR_RGB(X);
   else
    result=Roberts_Filter_DR(X);
   end
elseif v == 3
   if(L==3)
    result=Line_Shapening_Filter_DR_RGB(X);
   else
    result=Line_Shapening_Filter_DR(X);
   end
end
axes(handles.axes2);
imshow(result);

function DR_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function DL_btn_Callback(hObject, eventdata, handles)
v = get(handles.Line_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Sobel_Filter_DL_RGB(X);
   else
    result=Sobel_Filter_DL(X);
   end
elseif v == 2
   if(L==3)
    result=Roberts_Filter_DL_RGB(X);
   else
    result=Roberts_Filter_DL(X);
   end
elseif v == 3
   if(L==3)
    result=Line_Shapening_Filter_DL_RGB(X);
   else
    result=Line_Shapening_Filter_DL(X);
   end
end
axes(handles.axes2);
imshow(result);

function DL_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function ALL_btn_Callback(hObject, eventdata, handles)
v = get(handles.Line_combo,'Value'); %get currently selected option from menu
global X
global result
[H W L]=size(X);
if v == 1
   if(L==3)
    result=Sobel_Filter_All_RGB(X);
   else
    result=Sobel_Filter_All(X);
   end
elseif v == 2
   if(L==3)
    result=Roberts_Filter_All_RGB(X);
   else
    result=Roberts_Filter_All(X);
   end
elseif v == 3
   if(L==3)
    result=Line_Shapening_Filter_All_RGB(X);
   else
    result=Line_Shapening_Filter_All(X);
   end
end
axes(handles.axes2);
imshow(result);

function ALL_btn_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Convert_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)







