%{
    Esta función realiza la adición/suma de imágenes. Las operaciones se
    hacen entre imágenes del mismo tipo, así mismo, sólo se permite operar
    con tipo Binarias, Escala de Grises y RGB.
    La imagen resultante tiene el tamaño de la imagen operada más chica.

    Entradas:
    img1: matriz de la imagen 1 a sumar
    img2: matriz de la imagen 2 a sumar

    Salidas:
    imagenResultante = suma de las matrices de las imágenes imágenes img1
    y de img2


function imagenResultante = Adicion(img1, type1, img2, type2)

% Excepciones
if or( (type1 == "indexed"), (type2 == "indexed") )
    mensajeError = MException('Image:TypeError', 'ERROR: No es posible realizar esta operación a este tipo de imagen (Indexada)');
    throw(mensajeError)
end
if ~(type1 == type2)
    mensajeError = MException('Image:TypeError', 'ERROR: Las imágenes deben ser del mismo tipo');
    throw(mensajeError)
end

% Funcionalidad:

%{
    Antes de realizar la suma, se llevan a cabo algunas verificaciones y 
    ajustes de tamaño para garantizar que las imágenes sean compatibles en 
    términos de dimensiones. 
    size1 y size2 calculan y almacenan las dimensiones de las 
    matrices img1 e img2.
%}

size1 = size(img1);
size2 = size(img2);

%{
    Si type1 es igual a la cadena "truecolor", se asume que las imágenes 
    son imágenes en color (formato RGB).
    En tal caso, se eliminan las terceras dimensiones de size1 y size2, 
    ya que estas dimensiones corresponden a los canales de color RGB.
%}

if type1 == "truecolor"
    size1(:,3) = [];
    size2(:,3) = [];
end

%{
    Se verifica si las dimensiones de img1 y img2 son iguales. 
    Si no lo son, se redimensionan las imágenes para que tengan las mismas 
    dimensiones.
    Si el producto de las dimensiones de img1 es mayor que el producto 
    de las dimensiones de img2, entonces img1 se redimensiona utilizando 
    las dimensiones de img2, y viceversa.
%}

if ~(isequal(size1, size2))
    if prod(size1) > prod(size2)
        img1 = imresize(img1, size2);
    else
        img2 = imresize(img2, size1);
    end
end

%Se realiza la suma de píxeles entre las imágenes redimensionadas (img1 e img2)
imagenResultante = img1 + img2;
%}