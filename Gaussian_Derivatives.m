%===========Gaussian Derivative Filters========

im = imread('im02small.png');
im = rgb2gray(im);

%Create the Gaussian Kernel

hw = 3;
[X,Y] = meshgrid(-hw : 1 : hw,-hw : 1 : hw);
[x,y] = meshgrid(-hw : 0.1 : hw,-hw : 0.1 : hw);
sigma = 1;
G = (1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2));
G0 = (1/(2*pi*sigma^2))*exp(-(x.^2+y.^2)/(2*sigma^2));

%derivative Kernel

Dx  = [-1;1];
Dy = [-1,1];

%Gaussian Derivative Filter

Fx  = conv2(G,Dx);
Fy = conv2(G,Dy);

Fx0  = conv2(G0,Dx);
Fy0 = conv2(G0,Dy);

%Plot

figure;
subplot(2,3,1);
r1 = conv2(im,Fx,'same'); 
imshow(mat2gray(r1));
title('Gaussian Smoothed Derivative w.r.t x');

subplot(2,3,2);
surf(Fx0);
title('Gaussian Derivative Kernel for X direction');
pbaspect([1 1 1]);

subplot(2,3,3);
a1 = mat2gray(Fx0);
imshow(a1);

figure;
subplot(1,3,1);
r2 = conv2(im,Fy,'same');
r2 = mat2gray(r2);
imshow(r2);
title('Gaussian Smoothed Derivative w.r.t y');

subplot(1,3,2);
surf(Fy0);
title('Gaussian Derivative Kernel for Y direction');
pbaspect([1 1 1]);
xlabel('X');
ylabel('Y');

subplot(1,3,3);
a1 = mat2gray(Fy0);
imshow(a1);


figure;
R1 = conv2(im,G,'same');
R1 = conv2(R1,Dx,'same');
R1 = mat2gray(R1);
imshow(R1);
title('Gaussian Smoothed Derivative w.r.t x');


figure;
R2 = conv2(im,G,'same');
R2 = conv2(R2,Dy,'same');
R2 = mat2gray(R2);
imshow(R2);
title('Gaussian Smoothed Derivative w.r.t y');



