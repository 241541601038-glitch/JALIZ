image=imread('C:\Users\user\Documents\241541601038\one.jpg');
if isempty(image), error('Error: Image not found!');
end

inverted_image =imcomplement(image);
bright_image = image + 50;
blurred_image = imgaussfilt(image, 5);
edges = edge(gray_image, 'Canny', [0.4, 0.8]);

[height, width, channels] = size(image);
fprintf('Image loaded successfully!\nImage dimensions - Width: %d, Height: %d, Channels: %d\n', width, height, channels);
fprintf('\nProcessing complete:\n- Grayscale conversion: Done\n- Image inversion: Done\n- Brightness increase (+50):  Done\n- Gaussian blur (sigma=5): Done\n- Edge detection (Canny): Done\n\n');

subplot(2, 3, 1); imshow(image); title('Original Image'); axis off;
subplot(2, 3, 2); imshow(gray_image); title('Grayscale Image'); axis off; 
subplot(2, 3, 3); imshow(inverted_image); title('Inverted Image'); axis off; 
subplot(2, 3, 4); imshow(bright_image); title('Brightened Image'); axis off; 
subplot(2, 3, 5); imshow(blurred_image); title('Blurred Image'); axis off;
subplot(2, 3, 6); imshow(edges); title('Edges Image'); axis off;