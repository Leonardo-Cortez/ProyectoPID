%Funcion Abrir Imagen

function [img, map, type] =  AbrirImagen()

% img:  matriz de la imagen
% map:  mapa de color
% type: tipo color de la imagen

%Abre ventana para seleccionar imagen donde definimos que tipo de formato
%puede ingresarse para su procesamiento. 
[img, map, type] = uigetfile({'*.png'; '*.jpg'; '*.tif'; '*.bmp'; '*.ppm'});

%Si se cancela la operacion o retorna nada termina.
     if isequal(file,0)
      disp('Archivo Seleccionado');
       else
        disp(['No seleccionado', fullfile(path,file)]);
     end
return