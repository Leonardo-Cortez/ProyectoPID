
function sobelFilter = FiltroSobel(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.
    
    fspecial('sobel') crea una matriz que representa el núcleo del filtro de Sobel. 
    Este núcleo se utiliza para resaltar los bordes en la imagen.
    imfilter es la función entre la imagen en escala de grises y el filtro de Sobel.
%}

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);
    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

else % Escala de grises
    imagen_gris = imgProcesada;

    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

end