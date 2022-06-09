clear;clc;
image_data=200*ones(100,100);
for i = 1:51
    for j = 1:51
        image_data(i,j) = 100;
    end
end
image_data = uint8(image_data);
image = im2double(image_data);
imshow(image);
saveas(gcf,'p2.a.jpg');
