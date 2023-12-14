function erosion = Erosion(imgProcesada, elemento)

    % Convertir el elemento estructurante de texto a una matriz
    valorTextArea = char(elemento);
    elementos = strsplit(valorTextArea, ';');

    % Inicializar la matriz para la erosión
    matriz = [];
    
    for i = 1:numel(elementos)
        fila = str2num(elementos{i});
        matriz = [matriz; fila];
    end

    % Verificar si la matriz del elemento estructurante es vacía o no numérica
    if isempty(matriz) || ~isnumeric(matriz)
        error('El elemento estructurante es inválido.');
    end

    % Realizar la operación de erosión
    erosion = imerode(imgProcesada, matriz);

    % Mostrar la imagen erosionada si se necesita
    % imshow(erosion, 'Parent', UIAxes);
end
