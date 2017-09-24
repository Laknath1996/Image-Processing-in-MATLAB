%This would create the selected power law transformations
%////////////////////////////////////////////////////////////

im = imread('BME.jpg');
img = rgb2gray(im);
im = im2double(im);
img = im2double(img);

gamma = str2double(inputdlg('Enter the gamma value','parameters',1));

%gamma = param(1);
%C = param(2);
C = 1 / (1.0^gamma);

f = figure;

subplot(2,3,1);
imshow(img);
title('Original');

subplot(2,3,4);
imshow(im);
title('Original');

rg = 255.0*C*((img/255.0).^gamma);
r = 255.0*C*((im/255.0).^gamma);

subplot(2,3,2);
imshow(rg);
title('Result');

subplot(2,3,5);
imshow(r);
title('Result');

subplot(2,3,3);
x = 1 : 0.0001 : 255;
y = 255.0*C*((x/255.0).^gamma);
plot(x,y);
set(gca,'XLim',[0 255]);
set(gca,'YLim',[0 255]);
title('Tranformation');
pbaspect([1 1 1]);

saveas(gcf,'BME2.jpg');

figure;
imshow(r);
saveas(gcf,'BME1.jpg');






