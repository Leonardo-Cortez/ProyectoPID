% Convierte el tipo de la imagen a los diferentes tipos que son Indexada,
% binaria, escala de grises y RBG

function [imgCon, mapCon, typeCon] = Convertir(typeTo, img, map, type)

%       typeTo: tipo al que se convierte la imagen
%       img:    matriz de la imagen a convertir
%       map:    mapa de color de la imagen
%       type:   tipo de la imagen

    switch typeTo
        case "Indexada"
            typeCon = "indexed";
            if type == "indexed"
                
                % No se requiere conversión adicional
            elseif type == "binary"
                [imgCon, mapCon] = gray2ind(img, 2);
            elseif type == "grayscale"
                [imgCon, mapCon] = gray2ind(img, 256);
            else
                [imgCon, mapCon] = rgb2ind(img, 256);
            end

        case "RGB"
            typeCon = "truecolor";
            mapCon = [];
            if type == "indexed"
                imgCon = im2uint8(ind2rgb(img, map));
            elseif ismember(type, ["binary", "grayscale"])
                [auximg, auxmap] = gray2ind(img, 256);
                imgCon = im2uint8(ind2rgb(auximg, auxmap));
            end

        case "Escala de Grises"
            typeCon = "grayscale";
            mapCon = [];
            if type == "indexed"
                imgCon = im2uint8(ind2gray(img, map));
            elseif type == "binary"
                imgCon = uint8(255 * img);
            elseif type == "grayscale"
                % No se requiere conversión adicional
            else
                imgCon = rgb2gray(img);
            end

        case "Binaria"
            typeCon = "binary";
            mapCon = [];
            if type == "indexed"
                imgCon = imbinarize(im2single(ind2gray(img, map)));
            elseif ismember(type, ["binary", "grayscale"])
                imgCon = imbinarize(im2single(img));
            end
    end
end
