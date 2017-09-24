%This code performs the histogram equalization 
clear all;
close all;

img = imread('im02.png');
im = rgb2gray(img);

figure;

%Generate the original image

subplot(1,3,1);
imshow(im);
title('Original Image');

%get the size of the image

[m,n] = size(im);

im = double(im);

rk = [0:1:255]; %intensity levels

nk = zeros(1,256); %number of pixels for each intensity level

for i = 1 : 256
    nk(i) = sum(sum(im == rk(i)));
end

%get the probabilities of occurence for each internsity level

pk = nk / (m*n);

%generate sk value;

sk = zeros(1,256);

for i = 1 : 256
    sk(i) = (255.0)* sum(pk(1:i));
end

%mapping the pixels to the transformation

r = zeros(m,n); %resultant image

r = sk(im+1);

r = mat2gray(r);


subplot(1,3,2);
imshow(r);
title('Histogram Equalized Image');

subplot(1,3,3);
im = uint8(im);
L = histeq(im);
imshow(L);
title('Using built in MATLAB function');

saveas(gcf,'A2.png');


    



