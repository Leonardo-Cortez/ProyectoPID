
function maximoFilter = FiltroMaximo(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.

    ordfilt2 es la función que aplica el filtro de máximo. 
    El argumento 9 indica que se está buscando el noveno valor más 
    grande en el vecindario, que corresponde al valor máximo.
    El vecindario utilizado para el cálculo es una matriz de 1's de 
    tamaño 3x3 (ones(3, 3)), lo que significa que se está buscando el 
    valor máximo en un vecindario de 3x3 píxeles alrededor de cada 
    píxel en la imagen.
%}

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));

else % Escala de grises
    imagen_gris = imgProcesada;

    maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));

end