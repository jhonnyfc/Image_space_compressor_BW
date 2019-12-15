clear
clc

c = 16;
alpha = 0.005;
umbral = 0;
maxIter = 1;

imagen = imread("circles.png");
figure, imshow(imagen);%%Imagen origianl

R = double(imagen);
R = R/255;

profile on
n = 100;
M = magic(n);
imRed = reduccionImagen(R,c,alpha,umbral,maxIter);
profile viewer

imshow(imRed);
