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
                imgCon = img;
                mapCon = map;
            else
                imgCon = ConvertToIndexed(img, type);
                mapCon = colormap('default');
            end
        case "RGB"
            typeCon = "truecolor";
            mapCon = [];
            imgCon = ConvertToTrueColor(img, type);
        case "Escala de Grises"
            typeCon = "grayscale";
            mapCon = [];
            imgCon = ConvertToGrayscale(img, type);
        case "Binaria"
            typeCon = "binary";
            mapCon = [];
            imgCon = ConvertToBinary(img, type);
        otherwise
            error('Tipo de conversión no válido.');
    end
end

function imgOut = ConvertToIndexed(img, type)
    if type == "binary"
        imgOut = gray2ind(img, 2);
    elseif type == "grayscale"
        imgOut = gray2ind(img, 256);
    else
        imgOut = rgb2ind(img, 256);
    end
end

function imgOut = ConvertToTrueColor(img, type)
    if type == "indexed"
        imgOut = im2uint8(ind2rgb(img, colormap('default')));
    elseif type == "binary" || type == "grayscale"
        imgOut = im2uint8(ind2rgb(gray2ind(img, 256), colormap('default')));
    else
        imgOut = img;
    end
end

function imgOut = ConvertToGrayscale(img, type)
    if type == "indexed"
        imgOut = im2uint8(ind2gray(img, colormap('default')));
    elseif type == "binary"
        imgOut = uint8(255 * img);
    elseif type == "grayscale"
        imgOut = img;
    else
        imgOut = rgb2gray(img);
    end
end

function imgOut = ConvertToBinary(img, type)
    if type == "indexed"
        imgOut = imbinarize(im2single(ind2gray(img, colormap('default')));
    elseif type == "binary"
        imgOut = img;
    elseif type == "grayscale"
        imgOut = imbinarize(im2single(img));
    else
        imgOut = imbinarize(im2gray(img));
    end
end