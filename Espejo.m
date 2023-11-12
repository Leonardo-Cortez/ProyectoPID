%{
    Definimos una función llamada Espejo que toma una imagen (imgProcesada) 
    como entrada y devuelve una imagen espejo resultante (imgespejo).
%}

function imgespejo = Espejo(imgProcesada)

%{
    Creamos una copia de la imagen original (imgProcesada) y la almacena en 
    la variable aux. Esto se hace para realizar operaciones de espejo en 
    diferentes direcciones sin modificar la imagen original.
%}

aux = imgProcesada;

l1=fliplr(imgProcesada); % Realiza un espejo horizontal de la imagen original
l2=flipud(aux); % Realiza un espejo vertical de la copia de la imagen original (aux)
l3=fliplr(l2); % Realiza un espejo horizontal de la imagen espejo vertical (l2)

%{
    Combina las imágenes espejo horizontal y vertical para formar una nueva 
    imagen (aux2). La concatenación de matrices [l2 l3; imgProcesada l1] 
    forma una matriz compuesta de cuadrantes espejados.
%}

aux2 = [l2 l3;imgProcesada l1];

%{
    Redimensionamos la imagen resultante (aux2) a la mitad de su tamaño original 
    utilizando con el fin de ajustar el tamaño de la imagen resultante
%}

imgespejo = imresize(aux2,.5);