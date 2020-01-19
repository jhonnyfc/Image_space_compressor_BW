clear
clc

% Lectura de imagen, tiene que estar en el mismo directorio
imagen = imread("circles.png");

% Fijamos parametros originales
c = 16;                 % Numero de filas de Matrices auxiliares
alpha = 0.005;          % Coeficiente de aprendizaje
umbral = 0;             % Error minimo
maxIter = 10;            % Numero de iteraciones
R = double(imagen);     % Matriz de reconstruccion
R = R/255;

% Mostramos imagen original
figure, imshow(imagen);

profile on

% Inicializamos la funcion de vision de tiempos
n = 100;
M = magic(n);

% Ejecucion del Programa
imRed = reduccionImagen(R,c,alpha,umbral,maxIter);

profile viewer
imshow(imRed);
