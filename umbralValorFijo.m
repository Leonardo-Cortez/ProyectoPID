% Umbralización con un valor fijo
umbral = 0.5; % Puedes cambiar este valor según tu necesidad
imagen_binaria = imbinarize(imagen_original, umbral);
imshow(imagen_binaria);
