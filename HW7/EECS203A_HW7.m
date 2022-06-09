clc; clear;

row = 640;  
col = 480;

file = fopen('triangle.raw', 'r');
input = fread(file, row*col, 'uint8=>uint8'); 
input = reshape(input, row, col);
input = input';

red = input;
green = input;
blue = input;
for i = 1:480
    for j = 1:640
        green(i,j) = input(i,j)*0.5;
        blue(i,j) = input(i,j)*0.2;
    end
end


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

redchannel = conv2(red, mask, 'same');
greenchannel = conv2(green, mask, 'same');
bluechannel = conv2(blue, mask, 'same');

rgbImage(:,:,1) = uint8(redchannel);
rgbImage(:,:,2) = uint8(greenchannel);
rgbImage(:,:,3) = uint8(bluechannel);
imshow(rgbImage);

saveas(gcf, 'triangle_colored.jpg');