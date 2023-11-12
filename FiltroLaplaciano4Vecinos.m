
function laplacianoFiltro4v = FiltroLaplaciano4Vecinos(imgProcesada)

%{
    Se define una matriz llamada matrizLap4vec, que representa la máscara 
    del filtro laplaciano para 4 vecinos. La máscara se utiliza para resaltar 
    los cambios de intensidad.
%}

matrizLap4vec = [0 -1 0; -1 5 -1; 0 -1 0];

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
    matrizLap4vec. El resultado es la imagen filtrada por el filtro laplaciano 
    con la máscara de 4 vecinos.
%}

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);

    else % Escala de grises
        imagen_gris = imgProcesada;

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);

end