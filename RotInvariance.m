%==========Template Matching===================

T = rgb2gray(imread('q1.ppm')); %Main Image
im = rgb2gray(imread('a2.jpg'));%Template to match (frog)

Corr = (normxcorr2(T,im));%Computes the normalized cross correlation between T and im
figure, surf(Corr), shading interp %plot the cross correlation map

F = figure;
a  = axes;
imshow(im); hold on;
figure;
for i = -40 : 40
    A = T;
    A = imrotate(T,i,'crop');
    A(A == 0) = 120;
    imshow(A);
    Corr = (normxcorr2(A,im));
    
        while max(Corr(:))>0.460 %The correlation coefficinets are thresholded for matched status 
            [ypeak, xpeak] = find(Corr==max(Corr(:)));%Get the coordinates of the image patch correlation pixel
            
            %determine the vertex of the encompassing rectangle
            yoffSet = ypeak-size(T,1);
            xoffSet = xpeak-size(T,2);
            %draw a rectangle around the matched template
            imrect(a, [xoffSet+1, yoffSet+1, size(T,2), size(T,1)]);

            %rectangle('Position',[xoffSet+1, yoffSet+1, size(T,2), size(T,1)],'Edgecolor','r');

            %replace the neighborhood of the max corr area with zeros 
            for x = xpeak-4:xpeak+4
                for y = ypeak-4:ypeak+4
                    Corr(y,x) = 0;
                end
            end
        end

        %Plot the current correlations
         %figure; surf(Corr), shading interp 
       
%     
end

