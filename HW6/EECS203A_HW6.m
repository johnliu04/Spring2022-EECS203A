clc;clear;

row = 640;  
col = 480;

file = fopen('triangle.raw', 'r');
input = fread(file, row*col, 'uint8=>uint8'); 
input = reshape(input, row, col);
input = input';

sigma = 7;

mask = zeros(31, 31);

for i = -15:15
    for j = -15:15
        mask(i+16,j+16) = exp((-i*i-j*j)/(2*sigma*sigma));
    end
end
A = 1/sum(mask,"all");
for i = -15:15
    for j = -15:15
        mask(i+16,j+16) = A * mask(i+16,j+16);
    end
end

check = sum(mask,"all");
writematrix(mask, 'mask.csv');

image = conv2(input, mask, 'same');
imshow(log(1+abs(image)), []);
saveas(gcf,'triangle_degraded.jpg');

file_degraded = fopen('triangle.raw', 'r');
input_degraded = fread(file_degraded, row*col, 'uint8=>uint8'); 
input_degraded = reshape(input_degraded, row, col);
input_degraded = input_degraded';

freqImage = fft2(input_degraded);
freqFilter = fft2(mask, size(input_degraded, 1), size(input_degraded, 2));
inverseFilteredImage = freqImage ./ freqFilter;
image_restored = ifft2(inverseFilteredImage);
imshow(image_restored);
saveas(gcf, 'triangle_restored.jpg');


