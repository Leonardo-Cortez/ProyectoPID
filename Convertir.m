% Convierte el tipo de la imagen a los diferentes tipos que son Indexada,
% binaria, escala de grises y RBG

function [imgCon, mapCon, typeCon] = Convertir(typeTo, img, map, type)

%       typeTo: tipo al que se convierte la imagen
%       img:    matriz de la imagen a convertir
%       map:    mapa de color de la imagen
%       type:   tipo de la imagen

if strcmp(typeTo, "Indexada")
    
    typeCon = "indexed";
    if strcmp(type, "indexed")
        imgCon  = img;
        mapCon  = map;
    elseif strcmp(type, "binary")
        [imgCon, mapCon] = gray2ind(img, 2);
    elseif strcmp(type, "grayscale")
        [imgCon, mapCon] = gray2ind(img, 256);
    else
        [imgCon, mapCon] = rgb2ind(img, 256);
    end

elseif strcmp(typeTo, "RGB")

    typeCon = "truecolor";
    mapCon  = [];
    if strcmp(type, "indexed")
        imgCon  = im2uint8(ind2rgb(img, map));
    elseif strcmp(type, "binary")
        [auximg, auxmap] = gray2ind(img, 2);
        imgCon = im2uint8(ind2rgb(auximg, auxmap));
    elseif strcmp(type, "grayscale")
        [auximg, auxmap] = gray2ind(img, 256);
        imgCon = im2uint8(ind2rgb(auximg, auxmap));
    else
        imgCon = img;
    end

elseif strcmp(typeTo, "Escala de Grises")

    typeCon = "grayscale";
    mapCon  = [];
    if strcmp(type, "indexed")
        imgCon  = im2uint8(ind2gray(img, map));
    elseif strcmp(type, "binary")
        imgCon = uint8(255 * img);
    elseif strcmp(type, "grayscale")
        imgCon = img;
    else
        imgCon = rgb2gray(img);
    end
    
elseif strcmp(typeTo, "Binaria")

    typeCon = "binary";
    mapCon  = [];
    if strcmp(type, "indexed")
        imgCon  = imbinarize(im2single(ind2gray(img, map)));
    elseif strcmp(type, "binary")
        imgCon = img;
    elseif strcmp(type, "grayscale")
        imgCon = imbinarize(im2single(img));
    else
        imgCon = imbinarize(rgb2gray(img));
    end

end
