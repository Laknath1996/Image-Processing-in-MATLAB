%=========Prewitt and Sobel Filters=============

im = imread('im02small.png');
im = rgb2gray(im);

% figure;
% subplot(3,2,1);
% imshow(im);
% title('Original');
% 
% %Prewitt Filter for X
% 
% figure;
% K1 = [-1,-1,-1;0,0,0;1,1,1];
% r1 = conv2(im, K1,'same');
% r1 = mat2gray(r1);
% 
% imshow(r1);
% title('Prewitt for X');
% 
% %Prewitt Filter for Y
% 
% figure;
% K2 = [-1,-1,-1;0,0,0;1,1,1]';
% r2 = conv2(im, K2,'same');
% r2 = mat2gray(r2);
% 
% imshow(r2);
% title('Prewitt for Y');

%Sobel Filter for X

figure;
subplot(2,3,1);
K3 = [-1,-2,-1;0,0,0;1,2,1];
rx = conv2(im, K3,'same');X = rx;
imshow(mat2gray(rx));
title('Sobel for X');

%Sobel Filter for Y

subplot(2,3,2);
K4 = [-1,-2,-1;0,0,0;1,2,1]';
ry = conv2(im, K4,'same');Y = ry;
imshow(mat2gray(ry));title('Sobel for Y');

%Sobel Filter in the 45 degree direction

subplot(2,3,3);
r45 = double(rx)*sin(pi/4) + double(ry)*cos(pi/4);
imshow(mat2gray(r45));title('Sobel for 45');

%Finding the image gradient

subplot(2,3,4);
grad = sqrt(X.^2 + Y.^2);
%[gMag,gDir] = imgradient(im);
imshow(mat2gray(grad));title('Gradient of Image');

%Finding the image direction

subplot(2,3,5);
Dir = atan(double(X)./double(Y));
%[gMag,gDir] = imgradient(im);
imshow(mat2gray(gDir));title('Direction of Image');



