function dilatacion = Dilatacion(imgProcesada, elemento)

    % Convertir el elemento estructurante de texto a una matriz
    valorTextArea = char(elemento);
    elementos = strsplit(valorTextArea, ';');

    % Inicializar la matriz para la dilatación
    matriz = [];
    
    for i = 1:numel(elementos)
        fila = str2num(elementos{i});
        matriz = [matriz; fila];
    end

    % Verificar si la matriz del elemento estructurante es vacía o no numérica
    if isempty(matriz) || ~isnumeric(matriz)
        error('El elemento estructurante es inválido.');
    end

    % Realizar la operación de dilatación
    dilatacion = imdilate(imgProcesada, matriz);

    % Mostrar la imagen dilatada si se necesita
    %imshow(dilatacion, 'Parent', UIAxes);
end
