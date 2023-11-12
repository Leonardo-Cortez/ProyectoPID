
function gaussFilter = FiltroGaussiano(imgProcesada)

%{
    Se realiza una verificación para determinar el tipo de imagen de entrada
    Hay tres casos posibles:

        RGB: Si la imagen es una imagen a color (RGB), se convierte a escala de 
        grises utilizando la función rgb2gray.

        Binaria: Si la imagen es binaria, se convierte a una imagen 
        en escala de grises multiplicando por 255.

        Escala de grises: Si la imagen ya está en escala de grises, 
        se utiliza directamente.
    
    imgaussfilt es la función que aplica el filtro gaussiano. 
    El parámetro sigma controla la desviación estándar del filtro, 
    que afecta la cantidad de suavizado.
%}

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);
else % Escala de grises
    imagen_gris = imgProcesada;

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);
end