% Función para ecualizar una imagen

function [imgEc, histOri, histEc] = Ecualizar(img, type)

%{
    Entradas:
    img: matriz de la imagen a ecualizar
    type: tipo de imagen a ecualizar

    Salidas:
    imgEc: imagen ecualizada
    histOri: histograma de la imagen ecualizada
    histEc: histograma de la imagen ecualizada
%}

%{
   NOTA: antes de ecualizar se necesita que la imagen
   esté en escala de grises, sino enviar mensaje de error
%}

if ~(type == "grayscale")
    mensajeError = MException('Image:TypeError', 'ERROR: Antes de ecualizar verifique que su imagen se encuentre en Escala de Grises');
    throw(mensajeError)
end

% Funcionalidad para ecualizar

imgEc = histeq(img);
histOri = imhist(img);
histEc = imhist(imgEc);