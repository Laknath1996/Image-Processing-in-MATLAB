%==========Template Matching===================

T = imread('qfrog.jpg'); %Main Image
im = imread('a.jpg');%Template to match (frog)

Corr = abs(normxcorr2(T,im));%Computes the normalized cross correlation between T and im
figure, surf(Corr), shading interp %plot the cross correlation map

F = figure;
a  = axes;
imshow(im); hold on;

while max(Corr(:))>0.9200 %The correlation coefficinets are thresholded for matched status 
    [ypeak, xpeak] = find(Corr==max(Corr(:)));%Get the coordinates of the image patch correlation pixel
    
    %determine the vertex of the encompassing rectangle
    yoffSet = ypeak-size(T,1);
    xoffSet = xpeak-size(T,2);
    %draw a rectangle around the matched template
    imrect(a, [xoffSet+1, yoffSet+1, size(T,2), size(T,1)]);
    
    %rectangle('Position',[xoffSet+1, yoffSet+1, size(T,2), size(T,1)],'Edgecolor','r');
    
    %replace the neighborhood of the max corr area with zeros 
    for x = xpeak-2:xpeak+2
        for y = ypeak-2:ypeak+2
            Corr(y,x) = 0;
        end
    end
    %Plot the current correlations
    figure, surf(Corr), shading interp
end

