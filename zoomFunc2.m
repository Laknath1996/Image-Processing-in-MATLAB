%This code will perform the zoom fucntion with the bilinear interpolation
clear all;
close all;

img = imread('im02small.png');
im = rgb2gray(img);

imshow(im);

%take the input from user

scale_factor = str2double(inputdlg('Enter the scaling factor','Scaling Factor',1));

%create the image window

[h,w] = size(im);
A = 1 +  scale_factor * [h-2,w-2];

H = A(1);
W = A(2);

r = zeros(H,W);%image window 

%map the known pixels to the image window

for i = 1:h
    for j = 1:w
        r(1+(i-1)*scale_factor,1+(j-1)*scale_factor) = im(i,j);
    end
end

% r = mat2gray(r);
% imshow(r);

for i = 1 : H
    for j = 1 : W
        
        if (rem(i-1,scale_factor) == 0 && rem(j-1,scale_factor) == 0)
            continue;
        else
    
            %get the nearest four known pixels near the given pixel

            c00 = [ceil(i/scale_factor)*scale_factor-scale_factor+1,ceil(j/scale_factor)*scale_factor-scale_factor+1];
            c01 = [ceil(i/scale_factor)*scale_factor+1,ceil(j/scale_factor)*scale_factor-scale_factor+1];
            c10 = [ceil(i/scale_factor)*scale_factor-scale_factor+1,ceil(j/scale_factor)*scale_factor+1];
            c11 = [ceil(i/scale_factor)*scale_factor+1,ceil(j/scale_factor)*scale_factor+1];

%             x = rem(i-1,scale_factor);
%             y = rem(j-1,scale_factor);
%             
%             xk = x/scale_factor;
%             yk = y/scale_factor;
%             
%              %bilinear constants
% 
%             a00 = r(c00(1),c00(2));
%             a01 = r(c01(1),c01(2)) - r(c00(1),c00(2));
%             a10 = r(c10(1),c10(2)) - r(c00(1),c00(2));
%             a11 = r(c11(1),c11(2)) + r(c00(1),c00(2)) - r(c10(1),c10(2)) - r(c01(1),c01(2));
% 
%             %take the interpolant
% 
%             r(i,j) = a00 + a10*dk + a01*dk + a11*dk*dk;
%             
            w1 = (c10(2) - j)/(c10(2) - c00(2)); %with c00
            w2 = (j - c00(2))/(c10(2) - c00(2)); %wth c01
            I1 = w2*r(c00(1),c00(2)) + w1*r(c01(1),c01(2));
            I2 = w2*r(c11(1),c11(2)) + w1*r(c10(1),c10(2));
            
            w3 = (c01(1) - i)/(c01(1) - c00(1)); %with I1
            w4 = (i - c00(1))/(c01(1) - c00(1)); %with I2
            
            I = w4*I1 + w3*I2;
           
            
            r(i,j) = I;
        end
    end
end

r = mat2gray(r);
imshow(r);


        
