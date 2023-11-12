
function imgRotaDer = RotacionDerecha(imgProcesada, angulo)

% Definir el ángulo de rotación (45 grados por defecto si no se especifica)
if nargin < 2
    angulo = -45;
end

% Obtener el tamaño de la imagen original
[filas, columnas, ~] = size(imgProcesada);

% Calcular el tamaño de la imagen de salida para evitar la reducción de tamaño
diagonal = sqrt(filas^2 + columnas^2);
tamanioSalida = round(diagonal * sqrt(2));

% Realizar la rotación con interpolación del vecino más cercano
imgRotaDer = imrotate(imgProcesada, angulo, 'nearest', 'crop');