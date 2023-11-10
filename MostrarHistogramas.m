%{
    Función para mostrar los histogramas en una ventana emergente
    tanto de la imagen original como el de la ecualizada
%}

function MostrarHistogramas(histOri, histEc, imgPro, imgEc)
%{ 
    Al deshacer cambios de una imagen ecualizada con sus
    histogramas, se requiere hacer el mismo proceso sino
    enviar un mensaje de volver a ecualizar
%}

if isempty(histEc)
    mensajeError1 = MException('Histo:Null', 'Se debe ecualizar a la imagen');
    throw(mensajeError1)
elseif ~isequal(imgEc, imgPro)
    mensajeError2 = MException('Histo:Changes', 'Vuelva a ecualizar la imagen antes de ver sus histogramas');
    throw(mensajeError2)
end

%{
    subplot crea paneles en una figura
    Sintaxis: subplot(m, n, p)
    Donde:
        m es el número de filas en la cuadrícula.
        n es el número de columnas en la cuadrícula.
        p es el índice del panel actual.
%} 
figure;
subplot(2, 1, 1);
bar(histOri);
title('Histograma de la Imagen original');
subplot(2, 1, 2);
bar(histEc);
title('Histograma de la Imagen ecualizada');