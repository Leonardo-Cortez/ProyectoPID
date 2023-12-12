%%
% FUNCIÓN: "consultarInformacion".
% Muestra las características de la imagen en una ventana flotante.
% 
% Input:
%       path: ruta completa de la imagen

function Consultainformacion(path)
    if isempty(path)
        % Mostrar mensaje de error
        msgbox('ERROR: NO SE HA PROPORCIONADO UNA RUTA DE IMAGEN.');
    else
        % Verificar si el archivo de imagen existe
        if exist(path, 'file') ~= 2
            % Mostrar mensaje de error si la imagen no existe
            msgbox('ERROR: LA IMAGEN NO EXISTE.');
        else
            % Obtener información de la imagen
            info = imfinfo(path);
            
            % Construir el texto con la información de la imagen
            infoText = sprintf('Tamaño: %d KB\nFormato: %s\nDimensiones: %dx%d\n', info.FileSize/1024, info.Format, info.Width, info.Height);
            % Agregar más detalles si es necesario
            
            % Mostrar la información en una ventana de mensaje
            msgbox(infoText, 'Información de la imagen');
        end
    end
end

