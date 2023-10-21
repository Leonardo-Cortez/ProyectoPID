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
    imgFor = {'*.bmp';'*.jpg';'*.jpeg';'*.ppm';'*.png';'*.tif'};
    [file, folder] = uiputfile(imgFor);

        % Terminar si se cierra la ventana
        if file == 0
            return;
        end

    % Guardar imagen indexada con mapa de color si es posible
    path = fullfile(folder, file);

        % Verificar el tipo de imagen y el formato de archivo
        if type == "indexed" && any(endsWith(path, [".bmp",".tif"]))
            
            % Guardar imagen indexada con mapa de color
            imwrite(img, map, path); 

            % Guardar imagen sin mapa de color
        else 
            imwrite(img, path);
        end
        
        msgbox('Imagen guardada con exito!');