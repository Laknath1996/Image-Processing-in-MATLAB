%===========Binary Operations==================

im = imread('circles.png');
figure;
subplot(2,3,1);imshow(im);
title('Original Image');

%skeletonization

R = bwmorph(im,'skel',Inf);
subplot(2,3,2);imshow(R);
title('Skeletonized Image');

%Hit and Miss Transform

SE1 = strel('rectangle', [1,2]);
SE2 = strel('rectangle',[3,5]);
R = bwhitmiss(im,SE1,SE2);
subplot(2,3,3);imshow(R);
title('Hit and Miss Transform');

%Thining

R = bwmorph(im,'thin',Inf);
subplot(2,3,4);imshow(R);
title('Thinned Image');

%Thickening

R = bwmorph(im,'thicken',Inf);
subplot(2,3,5);imshow(R);
title('Thinned Image');






