
function medianaFilter = FiltroMediana(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.

    medfilt2 es la función que aplica el filtro de mediana. El 
    argumento [3, 3] especifica el tamaño del vecindario sobre el cual 
    se calcula la mediana. En este caso, se utiliza un vecindario de 
    3x3 píxeles alrededor de cada píxel en la imagen.
%}

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

else % Escala de grises
    imagen_gris = imgProcesada;

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

end