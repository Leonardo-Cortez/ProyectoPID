%Guarda la imagen procesada por el usuario
%    img: matriz de la imagen a guardar
%    map: mapa de color de la imagen
%    type: tipo de la imagen grayscale, binary, RGB, indexed)

    function Guardar(img, map, type)

        % Terminar si no hay imagen cargada
        if isempty(img) 
            return 
        end

    % Obtener ruta del archivo donde guardar
    imgFor = {'*.bmp';'*.jpg';'*.jpeg';'*.ppm';'*.png';'*.tif'};
    [file, folder] = uiputfile(imgFor);

        % Terminar si se cierra la ventana
        if file == 0
            return 
        end

    % Guardar imagen indexada con mapa de color si es posible
    path = fullfile(folder, file);
        if type == "indexed" && endsWith(path, [".bmp",".tif"])
            imwrite(img, map, path);

            % Guardar imagen sin mapa de color
        else 
            imwrite(img, path);
        end

        msgbox('Imagen guardada con exito!');