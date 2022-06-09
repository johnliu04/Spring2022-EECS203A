clc;clear;

row = 640;  
col = 480;

file = fopen('triangle.raw', 'r');
input = fread(file, row*col, 'uint8=>uint8'); 
input = reshape(input, row, col);
input = input';

kernel = [1, 1, 1; 1, -8, 1; 1, 1, 1];
image = conv2(double(input), kernel, 'same');

image = image - min(image(:));
image = image * (255.0 / max(image(:)));
image_lap = image/255.0;
imwrite(image_lap,'triangle_laplacian.jpg','jpg');

image_sharp = double(input) - image_lap;
image_sharp = image_sharp - min(image_sharp(:));
image_sharp = image_sharp * (255.0 / max(image_sharp(:)));
image_sharp = image_sharp / 255.0;
imwrite(image_sharp,'triangle_sharp.jpg','jpg');

image_dft = abs(fft2(input));
image_dft = fftshift(image_dft);
imshow(log(1+abs(image_dft)), []);
saveas(gcf,'triangle_dft.jpg');


file = fopen('cat.raw', 'r');
input = fread(file, row*col, 'uint8=>uint8'); 
input = reshape(input, row, col);
input = input';

kernel = [1, 1, 1; 1, -8, 1; 1, 1, 1];
image = conv2(double(input), kernel, 'same');

image = image - min(image(:));
image = image * (255.0 / max(image(:)));
image_lap = image/255.0;
imwrite(image_lap,'cat_laplacian.jpg','jpg');

image_sharp = double(input) - image_lap;
image_sharp = image_sharp - min(image_sharp(:));
image_sharp = image_sharp * (255.0 / max(image_sharp(:)));
image_sharp = image_sharp / 255.0;
imwrite(image_sharp,'cat_sharp.jpg','jpg');

image_dft = abs(fft2(input));
image_dft = fftshift(image_dft);
imshow(log(1+abs(image_dft)), []);
saveas(gcf,'cat_dft.jpg');