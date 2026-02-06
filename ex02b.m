image_path= 'C:\Users\user\Documents\241541601038\one.jpg';
gray_image=imread(image_path);
%convert to gray if the image is rgb
if size(gray_image,3)  ==3 
gray_image=rgb2gray(gray_image);
end
%apply binary threshold
threshold=128;
binary_image=gray_image>threshold;
%display the image
figure('Position',[100,100,1000,500]);
subplot(1,2,1);
imshow(gray_image);
title('original grayscale image');
axis off;
subplot(1,2,2);
imshow(binary_image);
title('binary image');
axis off;