function tipoNFilter = FiltroOrdenN(imgProcesada, parametro)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);
else
    if islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;
    else % Escala de grises
        imagen_gris = imgProcesada;
    end
end

sizeFiltro = str2double(parametro);

% Verifica si el valor es válido
if isnan(sizeFiltro) || sizeFiltro <= 0
    error('Ingrese un parámetro válido para el filtro. No puede ser menor o igual a cero.');
end

filtroN = ones(sizeFiltro) / (sizeFiltro ^ 2);

tipoNFilter = imfilter(imagen_gris, filtroN);

end