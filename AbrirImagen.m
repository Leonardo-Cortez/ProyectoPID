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
if (file == 0)
    % se asignan matrices vacías a las variables 
    img  = [];
    map  = [];
    path = [];
    type = [];
 else
    
    %{
        Combina el nombre de la carpeta (folder) con el nombre del 
        archivo (file) para formar la ruta completa del archivo de imagen.
    %}
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