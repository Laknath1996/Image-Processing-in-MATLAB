%This code will perform the intensity windowing 
%///////////////////////////////////////////////////////////////
clear all;
close all;

img = imread('BME.jpg');
im = rgb2gray(img);

[m,n] = size(im);

%take the user inputs

promts = {'Min Input value :','Min Output Value :', 'Max Input value :','Max Input value :'};

temp = str2double(inputdlg(promts,'Intensity Windowing',1));

minIP = temp(1);
minOP = temp(2);
maxIP = temp(3);
maxOP = temp(4);

%generate the original image 

figure;
subplot(1,3,1);
imshow(im);
title('Original Image');

%create the transformation vector

l1 = minOP*ones(1,minIP);

grad = (maxOP - minOP)/(maxIP - minIP);

l2 = [minOP+1 : grad : maxOP];

l3 = maxOP*ones(1,255 - maxIP + 1);

t = [l1,l2,l3];

%create the image

r = im;

s = t(r+1);

%display the image

subplot(1,3,2);
plot(t);
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 255]);
title('Transformation');
pbaspect([1 1 1]);

subplot(1,3,3);
imshow(mat2gray(s));
title('After Intensity Windowing');

saveas(gcf,'A3.png');

figure;
imshow(mat2gray(s));
saveas(gcf,'BME1.jpg');

