%This code will perform the contrast stretching function 
%//////////////////////////////////////////////////////////

im = imread('test.jpg');
% r = rgb2gray(im);
r = im;
line1 = 0:1:100;
line2 = 155/55*([101:1:200] - 100) + 100;
line3 = 201:1:255;
t = [line1, line2,line3];
subplot(1,3,1);
plot(t);
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 255]);
title('Transformation');
pbaspect([1 1 1]);
s = t( r + 1);
subplot(1,3,2);
imshow(r);
title('Original');
subplot(1,3,3);
imshow(mat2gray(s));
title('Output');