%This code will create the cumulative and normal histogram for the test image 
%////////////////////////////////////////////////////////////////////////////////
clear all;
close all;
numbins = str2double(inputdlg('Enter the number of desired bins','Number of Bins',1));

img = imread('New.png');
%img = rgb2gray(im);
imshow(img);

binbounds = linspace(0,255,numbins + 1); 
%generates a row vector binbounds of (numbins + 1) points linearly spaced between and including 0 and 255

cumhist = zeros(numbins + 1,1); 

for i = 2 : numbins + 1
    cumhist(i) = sum(sum(img <= binbounds(i))); 
    %img is a uint8 matrix. sum(img < k) returns how many elements obey the < k inequality in each column and returns it as a array
end

figure;

subplot(1,2,1);
bar(cumhist,'hist');
title('Cumulative Histogram');

hist = cumhist(2:end) - cumhist(1:end-1); 
%obtaining the histogram from the cumulative histogram

bincenters = (binbounds(2:end)+ binbounds(1:end-1))/2;
%obtaining the centres of each bin 

subplot(1,2,2);
bar(bincenters', hist, 0.2);
title('Histogram');


    
