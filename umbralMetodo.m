% Umbralización con el método de Otsu
imagen_gris = rgb2gray(imagen_original); % Si tienes una imagen en color
umbral_otsu = graythresh(imagen_gris);
imagen_binaria_otsu = imbinarize(imagen_gris, umbral_otsu);
imshow(imagen_binaria_otsu);