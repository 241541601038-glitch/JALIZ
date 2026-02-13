function main()

image1 = imread('C:\Users\user\Downloads\one.jpg');
image2 = imread('C:\Users\user\Downloads\one.jpg'); 
if size(image1, 3) == 3, image1 = rgb2gray(image1);
end 
if size(image2, 3) == 3, image2 = rgb2gray(image2); 
end
if isempty(image1) || isempty(image2)
    disp('Error loading images!');return; 
end
arithmetic_operations(image1, image2);
set_operations(imbinarize(image1, 127/255),imbinarize(image2,127/255));
image_transformations(image1);
end
function arithmetic_operations(image1, image2)
image1 = imresize(image1, size(image2));
img1 = double(image1); img2 = double(image2);
addition = uint8(min(img1 + img2, 255));
subtraction = uint8(max(img1 - img2, 0));
multiplication = uint8(min((img1 .* img2) / 255, 255));
division = uint8(min((img1 ./ (img2 + 1)) * 255, 255));
figure('Position', [100, 100, 1200, 600]);
subplot(2,2,1); imshow(addition); title('Addition'); axis off;
subplot(2,2,2); imshow(subtraction); title('Subtraction'); axis off;
subplot(2,2,3); imshow(multiplication); title('Multiplication'); axis off;
subplot(2,2,4); imshow(division); title('Division'); axis off;
end
function set_operations(binary_image1, binary_image2) 
union = binary_image1 | binary_image2;
intersection = binary_image1 & binary_image2;
difference = xor(binary_image1, binary_image2);
figure('Position', [100, 100, 1200, 600]);
subplot(1,3,1);imshow(union); title('Union'); axis off;
subplot(1,3,2);imshow(intersection); title('Intersection'); axis off; 
subplot(1,3,3); imshow(difference); title('Difference'); axis off;
end
function image_transformations(image)
[rows, cols] = size(image);
tform_translate = affine2d([1 0 0; 0 1 0; 50 50 1]);
translated_image = imwarp(image, tform_translate, 'OutputView', imref2d([rows, cols]));
scaled_image = imresize(image, 1.5, 'bilinear');
rotated_image = imrotate(image, -45, 'bilinear', 'crop');
figure('Position', [100, 100, 1200, 600]);
subplot(1,3,1); imshow(translated_image); title('Translated Image'); axis off;
subplot(1,3,2); imshow(scaled_image); title('Scaled Image'); axis off; 
subplot(1,3,3); imshow(rotated_image); title('Rotated Image'); axis off; 
end