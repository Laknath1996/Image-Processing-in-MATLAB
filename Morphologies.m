%==========Morphological Image Processing==============

im = imread('im02small.png');
im = rgb2gray(im);

%Erosion
figure;
se = strel('ball',5,5); %structering element taken as rolling ball
r1 = imerode(im,se); %erode the image with a rolling ball SE
subplot(2,3,1);imshow(mat2gray(r1));
title('Erosion');

%Dilation

se = strel('ball',5,5); %structering element taken as rolling ball
r1 = imdilate(im,se);%dilate the image with a rolling ball SE
subplot(2,3,2);imshow(mat2gray(r1));
title('Dilation');

%opening

se = strel('ball',5,5);%structering element taken as rolling ball
r1 = imopen(im,se);%dilate the image with a rolling ball SE
subplot(2,3,3);imshow(mat2gray(r1));
title('Opening');

%closing

se = strel('ball',5,5);%structering element taken as rolling ball
r1 = imclose(im,se);
subplot(2,3,4);imshow(mat2gray(r1));
title('Closing');
