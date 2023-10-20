%Funcion Abrir Imagen

function [img, map, type, path] =  AbrirImagen()

% img:  matriz de la imagen
% map:  mapa de color
% type: tipo color de la imagen
% path: ruta completa de la imagen

%Abre ventana para seleccionar imagen donde definimos que tipo de formato
%puede ingresarse para su procesamiento. 

[file, folder] = uigetfile('*.bmp;*.jpg;*.jpeg;*.ppm;*.png;*.tif');

% Terminar si no tiene seleccionado un archivo
            if isempty(file)
                img  = [];
                map  = [];
                path = [];
                type = [];
            else
    
    % Crear la ruta de la imagen
    path = fullfile(folder, file);

    if imfinfo(path).ColorType == "indexed"
        [img, map] = imread(path);
        type = "indexed";
    else
        img  = imread(path);
        map  = [];
        if imfinfo(path).ColorType == "truecolor"
            type = "truecolor"; 
        elseif imfinfo(path).BitDepth == 1 
            type = "binary"; 
        else
            type = "grayscale"; 
        end
     end

            end