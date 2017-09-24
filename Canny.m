%==========Cany Edge Detector=============

im = imread('im02small.png');
im = rgb2gray(im);
R = edge(im,'canny'); %returns a matrix with intensity values between [0,1]
figure;
imshow(mat2gray(R));%maps the intesity values to 8 bit image
title('Canny Edge Detection');

