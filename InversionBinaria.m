
%{ 
    Invierte imagen binaria aplicando inversion binaria.

    Entradas:
           img:  imagen a invertir
           type: tipo de la imagen a invertir
    Salidas:
           imagenBinaria: imagen invertida
%}

function imagenBinaria = InversionBinaria(img, type)

% Excepciones
if ~(type == "binary")
    mensajeError = MException('Image:TypeError', 'ERROR: Antes de hacer la inversión binaria, verifique que su imagen sea de tipo Binaria');
    throw(mensajeError)
end

%{ 
    Funcionalidad:
    Realiza la inversión binaria de la imagen. 
    Resta cada valor de píxel en la imagen original (img) de 1. 
    Esto invierte los píxeles negros (con valor 0) a blancos (con valor 1) y viceversa.
%}

imagenBinaria = 1 - img;