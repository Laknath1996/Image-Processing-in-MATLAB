%==========Partial Derivative Filter of an Image=====

im = imread('21_training.tif');
im = rgb2gray(im);

figure;

imshow(im);
title('Original Image');

%Partial Derivative in Y direction

figure;
K1 = [-1,1];
r1 = conv2(im,K1,'same');
r1 = mat2gray(r1);

imshow(r1);
title('Partial Derivative in y');

%Partial Derivative in Y direction

figure;
K4 = [1,-1];
r4 = conv2(im,K4,'same');
r4 = mat2gray(r4);

imshow(r4);
title('Partial Derivative in y - alt');


%Partial Derivative in X direction

figure;
K2 = [-1;1];
r2 = conv2(im,K2,'same');
r2 = mat2gray(r2);

imshow(r2);
title('Partial Derivative in x');

%Partial Derivative in X direction

figure;
K3 = [1;-1];
r3 = conv2(im,K3,'same');
r3 = mat2gray(r3);

imshow(r3);
title('Partial Derivative in x - alt');
