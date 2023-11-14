% Restar los valores de intensidad de los píxeles de una imagen de 
% los valores de intensidad de los píxeles de otra imagen del mismo tamaño.
% Sólo se permite operar con tipo Binarias, Escala de Grises y RGB.

function imgResul = Sustraccion(imgOri, typeOri, imgSeg, typeSeg)

    % Manejo de errores
        if typeOri == "indexed" || typeSeg == "indexed"
        error('Image:TypeError', 'Operación no disponible para imágenes indexadas.');
        end

            if ~isequal(typeOri, typeSeg)
            error('Image:TypeError', 'Las imágenes deben ser del mismo tipo.');
            end

        % Validación de tamaños de imagen
        sizeOri = size(imgOri);
        sizeSeg = size(imgSeg);

            % Ajustar tamaños si son tipo de "truecolor"
            if typeOri == "truecolor"
                sizeOri(:, 3) = [];
                sizeSeg(:, 3) = [];
            end

            % Redimensionar la imagen más pequeña para que coincida
           if ~isequal(sizeOri, sizeSeg)
            if prod(sizeOri) > prod(sizeSeg)
             imgOri = imresize(imgOri, sizeSeg);
                else
             imgSeg = imresize(imgSeg, sizeOri);  
            end
            end
           
    % Realizar la suma de imágenes
    imgResul = imgOri - imgSeg;