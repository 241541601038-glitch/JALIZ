image=imread('C:\Users\user\Documents\241541601038\one.jpg');
gray_image=rgb2gray(image);
%Display dimensions
[orig_height,orig_width,channels]=size(image);
[gray_height,gray_width]=size(gray_image);
fprintf('original image_width:%d,height:%d,channels:%d\n',orig_width,orig_height,channels);
fprintf('grayscaleimage_width:%d,height:%d,channels:1\n',gray_width,gray_height);
%create figure with subplot
figure('position',[100,100,1000,500]);
subplot(1,2,1);
imshow(image);
title('original image');
axis off;
subplot(1,2,2);
imshow(gray_image);
title('grayscale image');
axis off;