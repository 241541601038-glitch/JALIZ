image = imread('C:\Users\user\Downloads\one.jpg'); 
if size(image, 3) == 3, image = rgb2gray(image); 
end
if isempty(image), error('Error: Image not found!'); end

contrast_stretched_img = imadjust(image, stretchlim(image), [0 1]);

equalized_img = histeq(image);

figure('Position', [100, 100, 1200, 1000]);
images = {image, contrast_stretched_img, equalized_img}; titles = {'Original', 'Contrast Stretched', 'Equalized'};
for i = 1:3
subplot(3, 2, 2*i-1), imshow(images{i}), title([titles{i} ' Image']), axis off;
subplot(3, 2, 2*i), imhist(images{i}), title([titles{i} ' Histogram']), ...
xlabel('Pixel Intensity'), ylabel('Frequency'), grid on; 
end
