%% Reproduccion y representacion de la salida

% Generacion de reproduccion
handles.y_audio = audioplayer(handles.y,handles.fs);
% Graficos
cla(handles.salida_L)
cla(handles.salida_R)
cla(handles.salida_espectro)
n = 1:length(handles.y(:,1));
t = n/handles.fs;
f = 0+handles.fs/length(n):handles.fs/length(n):handles.fs/2;
plot(handles.salida_L,t,handles.y(:,1),'green')
plot(handles.salida_R,t,handles.y(:,2),'red')
set(handles.salida_L,'color',[0.05 0.05 0.1])
set(handles.salida_R,'color',[0.05 0.05 0.1])
Y_L = fft(handles.y(:,1))/length(n);
Y_R = fft(handles.y(:,2))/length(n);
handles.Y_L = Y_L(1:floor(length(n)/2));
handles.Y_R = Y_R(1:floor(length(n)/2));
handles.Y = (handles.Y_L+handles.Y_R)/2;
hold(handles.salida_espectro,'on')
loglog(handles.salida_espectro,f,abs(handles.Y_R),'red')
loglog(handles.salida_espectro,f,abs(handles.Y_L),'green')
set(handles.salida_espectro,'XLim',[20 20000],'XGrid','on')
hold(handles.salida_espectro,'off')
xlabel(handles.salida_L,'Tiempo [s] (canal L)')
xlabel(handles.salida_R,'Tiempo [s] (canal R)')
xlabel(handles.salida_espectro,'Frecuencia [Hz]')
% Dialogo de espera
if exist('wb')
    close(wb)
end
set(handles.play_salida,'Enable','On')
set(handles.stop_salida,'Enable','On')
set(handles.pause_salida,'Enable','On')
% Update handles structure
guidata(hObject, handles);

% Ya se puede devolver la salida a la interfaz
uiresume