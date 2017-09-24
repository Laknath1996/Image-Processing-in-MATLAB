%=========45 degree gradient=================

im = imread('im02small.png');
im = rgb2gray(im);

%Create the Gaussian Kernel

hw = 3;

[X,Y] = meshgrid(-hw : 1 : hw,-hw : 1 : hw);
[x,y] = meshgrid(-hw : 0.1 : hw,-hw : 0.1 : hw);

sigma = 1;

G = (1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2));
G0 = (1/(2*pi*sigma^2))*exp(-(x.^2+y.^2)/(2*sigma^2));

%derivative kernel

D = [0,1,1;-1,0,1;-1,-1,0];

%Filter Kernal

F = conv2(G,D);
F0 = conv2(G0,D);

%Plot

figure;
subplot(1,3,1);
r1 = conv2(im,F,'same');
r1 = mat2gray(r1);
imshow(r1);
title('Gaussian Smoothed Derivative 45 deg');

subplot(1,3,2);
surf(F0);
title('Gaussian Derivative Kernel for 45 deg');
pbaspect([1 1 1]);

subplot(1,3,3);
a1 = mat2gray(F0);
imshow(a1);

figure;
imshow(r1);

