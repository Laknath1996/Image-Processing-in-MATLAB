%========Template Matching with Scale Invariance===========

T = rgb2gray(imread('q2.ppm')); %Template Image
im = rgb2gray(imread('a3.jpg')); %Main image

Corr = normxcorr2(T,im);%Computes the intial normalized cross correlation between T and im
figure, surf(Corr), shading flat

F = figure;
ax  = axes;
imshow(im,'Parent', ax), hold on;

for i = -2:2
    A = T;
    % reduce and expand the kernel by 2 levels, both up and down
    if i<0
        for y = 1:abs(i)
            A = impyramid(A, 'reduce');%reduce the template image size
        end
    elseif i == 0
        A = T;
    else
        for y = 1:abs(i)
            A = impyramid(A, 'expand');%enhance the template image size
        end 
    end
    
    
    Corr = normxcorr2(A,im); % Calculate the cross co-relation of the modified template and main image
   
   figure, surf(Corr), shading flat
    while max(Corr(:))>0.9000  % 0.9000 is used as a threshold value
        [ypeak, xpeak] = find(Corr==max(Corr(:)));%Get the coordinates of the peak
        %determine the vertex of the encompassing rectangle
        yoffSet = ypeak-size(T,1);
        xoffSet = xpeak-size(T,2);
        %draw a rectangle around the matched template
        imrect(ax, [xoffSet+1, yoffSet+1, size(T,2), size(T,1)]);
        %replace the neighborhood of the max corr area with zeros 
        for k = xpeak-4:xpeak+4
            for l = ypeak-4:ypeak+4
                Corr(l,k) = 0;
            end
        end 
    end
end
