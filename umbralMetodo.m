function imagen_binaria_otsu = umbralMetodo(imgOriginal)

% Umbralización con el método de Otsu
imagen_gris = rgb2gray(imgOriginal); % Si tienes una imagen en color
umbral_otsu = graythresh(imagen_gris);
imagen_binaria_otsu = imbinarize(imagen_gris, umbral_otsu);

