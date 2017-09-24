%This code will perform the zooming via nearest neigbour method

img = imread('im02small.png');
im = rgb2gray(img);

imshow(im);

%take the input from user

scale_factor = str2double(inputdlg('Enter the scaling factor','Scaling Factor',1));

%create the image window

[h,w] = size(im);
A = scale_factor * [h,w];

H = A(1);
W = A(2);

r = zeros(H,W); %image window 

for i = 1 : W
    for j = 1 : H
        x = ceil(i / scale_factor);
        y = ceil(j / scale_factor);
        
        r(j,i) = im(y,x);
    end
end

r = mat2gray(r);

imshow(r);



