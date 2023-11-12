
function modaFilter = FiltroModa(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.

    ordfilt2 es la función que aplica el filtro de moda. Aquí, se usa 
    con el vecindario definido por true(3) (una matriz 3x3 de unos, que 
    representa un vecindario de 3x3 píxeles alrededor de cada píxel en la imagen).

    El argumento 5 indica que se está buscando el quinto valor más 
    pequeño en el vecindario, que corresponde al valor modal.
%}

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    modaFilter = ordfilt2(imagen_gris, 5, true(3));

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    modaFilter = ordfilt2(imagen_gris, 5, true(3));

else % Escala de grises
    imagen_gris = imgProcesada;

    modaFilter = ordfilt2(imagen_gris, 5, true(3));
end