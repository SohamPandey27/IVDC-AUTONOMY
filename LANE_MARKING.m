




clc
clear all
close all
warning off
%Reading image
original_img=imread("E:\OPENCV PROGRAM\materials\road2.jpg");
subplot(1,3,1)
imshow(original_img);
%Conversion of image into grayscale
gray_img=im2gray(original_img);

imshow(gray_img)
%Filtering the image using Gaussian Filter
filtered_img=imgaussfilt(gray_img);

%Performing morphological operation incase of future need

%se=strel("disk",4);
%iopened=imclose(filtered_img,se);
%subplot(2,3,5)
%imshow(iopened)
%iclosed=imclose(bin_img,se);
%subplot(2,3,4)
%imshow(iclosed)



%Edge detection
edges=edge(filtered_img,'Canny');
subplot(1,3,2)
imshow(edges)
%conversion of image into binary image
bin_img=imbinarize(filtered_img);
imshow(bin_img)


%Hough Line Transformation
[H, theta, rho] = hough(edges);

%Finding peaks in hough transform that appears in parameter space
peaks = houghpeaks(H, 2); 
%Tracing lines and getting their parameters
lines = houghlines(edges, theta, rho, peaks);

%Overlapping the detected line on original image
figure, imshow(original_img);
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2);
end