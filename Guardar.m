%Guarda la imagen procesada por el usuario

  function Guardar(img, map, type)

%    img: matriz de la imagen a guardar
%    map: mapa de color de la imagen
%    type: tipo de la imagen grayscale, binary, RGB, indexed)

       % Terminar si no hay imagen cargada
if isempty(img) 
    return; 
end

% Obtener ruta del archivo donde guardar
imgFor = {'*.jpg';'*.jpeg';'*.ppm';'*.png';'*.tif'; '*.bmp'};
[file, folder] = uiputfile(imgFor);

% Terminar si se cierra la ventana
if file == 0
    return;
end

% Guardar imagen con lógica para preservar indexación solo si es posible
path = fullfile(folder, file);

% Verificar el tipo de imagen y el formato de archivo
if type == "indexed" && any(endsWith(path, [".bmp", ".tif"]))
    % Verificar si el formato permite guardar imágenes indexadas
    try
        imwrite(img, map, path);
        msgbox('Imagen indexada con mapa de color guardada con éxito!');
    catch
        % Si no es posible guardar la imagen indexada, guardar sin el mapa de color
        imwrite(img, path);
        msgbox('Imagen guardada sin mapa de color debido a limitaciones del formato.');
    end
else
    % Si no es una imagen indexada o el formato no lo permite, guardar normalmente
    imwrite(img, path);
    msgbox('Imagen guardada con éxito!');
end
