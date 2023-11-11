
%{ 
    Invierte imagen binaria aplicando inversion fotográfica.

    Entradas:
           img:  imagen a invertir
           type: tipo de la imagen a invertir
    Salidas:
           imagenFotografica: imagen invertida
%}

function imagenFotografica = InversionFotografica(img, type)

% Excepciones
if ~(type == "grayscale")
    if ~(type == "truecolor")
        mensajeError = MException('Image:TypeError', 'ERROR: Antes de hacer la inversión Fotográfica, asegúrese que su imagen esté en Escala de Grises o RGB.');
        throw(mensajeError)
    end
end

%{ 
    Funcionalidad:
    Realiza la inversión fotográfica de una imagen en Escala de Grises o RGB. 
    Implica restar cada valor de píxel en la imagen original de 255 
    (el valor máximo de intensidad en una imagen de 8 bits).
%}

imagenFotografica = 255 - img;