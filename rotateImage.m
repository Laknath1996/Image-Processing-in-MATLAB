%This code will rotate an image by the given aount of degrees

clear all;
close all;

theta = str2double(inputdlg('Angle of Rotation','Rotation',1));

theta = (theta/180)*pi;

img = imread('im02small.png');
im = rgb2gray(img);

figure;
subplot(1,3,1);
imshow(im);
title('Original Image');

M = [cos(theta),-sin(theta);sin(theta),cos(theta)]; %rotational matrix

[h,w] = size(im);

%get the boundries 

W = round(abs(w*abs(cos(theta)) + h*abs(sin(theta))));
H = round(abs(h*abs(cos(theta)) + w*abs(sin(theta))));

r = zeros(H,W);

midy = ceil((H+1)/2);
midx = ceil((W+1)/2);

midh = ceil((h+1)/2);
midw = ceil((w+1)/2);

for x1 = 1:W
    for y1 = 1:H
%        x=(x1-midx)*cos(theta)-(y1-midy)*sin(theta);
%        y=(x1-midx)*sin(theta)+(y1-midy)*cos(theta);
       A = (M*[x1-midx,y1-midy]')';
       x = round(A(1) + midw);
       y = round(A(2) + midh);
       
       if (x >= 1 && y >= 1 && x <= w && y <= h)
           r(y1,x1) = im(y,x);
       end
       
    end
end       
        
r = mat2gray(r);

subplot(1,3,2);
imshow(r);
title('Without imrotate');

theta = theta/pi*180;

L = imrotate(im,theta);
subplot(1,3,3);
imshow(L);
title('With imrotate');

saveas(gcf,'A5.png');

