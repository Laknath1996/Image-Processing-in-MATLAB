%This code will create a negative of an image and save it
%/////////////////////////////////////////////////////////

im = imread('test.jpg');
[m,n] = size(im);

f = figure;
subplot(1,2,1);
imshow(im);
title('Original Image');

for i = 1:m
    for j = 1:n
        im(i,j) = 255 - im(i,j);
    end
end

subplot(1,2,2);
imshow(im);
title('Negative image');

saveas(f,'Negtive image','png');

im = imread('test.jpg');
im = rgb2gray(im);
h = figure;
subplot(1,2,1);
imshow(im);
title('Original Greyscale');

imneg = 255 - im;
subplot(1,2,2);
imshow(imneg);
title('Negative image');

saveas(h,'Negtive image - Grayscale','png');





