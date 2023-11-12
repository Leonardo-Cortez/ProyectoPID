
function laplacianoFiltro8v = FiltroLaplaciano8Vecinos(imgProcesada)

%{
    Se define una matriz llamada matrizLap8vec, que representa la máscara 
    del filtro laplaciano para 8 vecinos. La máscara se utiliza para resaltar 
    los cambios de intensidad.
%}

matrizLap8vec = [-1 -1 -1; -1 9 -1; -1 -1 -1];

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.
    
    imfilter es la función entre la imagen en escala de grises y la máscara 
    matrizLap8vec. El resultado es la imagen filtrada por el filtro laplaciano 
    con la máscara de 8 vecinos.
%}

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);

    else % Escala de grises
        imagen_gris = imgProcesada;

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);

end