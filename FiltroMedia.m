
function filtroBox = FiltroMedia(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.

    imboxfilt es la función que aplica el filtro de media (filtro de caja). 
    El tamaño del vecindario sobre el cual se calcula la media está 
    determinado por tamFiltroCaja. En este caso, se utiliza un vecindario 
    de 3x3 píxeles alrededor de cada píxel en la imagen.
%}

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);

    else % Escala de grises
        imagen_gris = imgProcesada;

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);
end