clc; clear;

graylevel1 = 10;
graylevel2 = 240;
bar = ones(210, 7) * graylevel2;
separation = ones(210, 17) * graylevel1;
image = repmat([separation, bar], 1, 9);
image = [image, separation];
edge = ones(17, 10*17+9*7);
image = [edge; image; edge];
% imshow(uint8(image));
imwrite(uint8(image),'input image.jpg','jpg');
row = size(image, 1);
column = size(image, 2);

%%% 5.1a
data1a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = uint8(mean(matrix,'all'));
        data1a = [data1a val];
    end
end
image1a = reshape(data1a, column-3+1, row-3+1);
image1a = image1a';
% imshow(uint8(image1a));
imwrite(uint8(image1a),'image1a.jpg','jpg');

%%% 5.1b
data1b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = uint8(mean(matrix,'all'));
        data1b = [data1b val];
    end
end
image1b = reshape(data1b, column-7+1, row-7+1);
image1b = image1b';
% imshow(uint8(image1b));
imwrite(uint8(image1b),'image1b.jpg','jpg');

%%% 5.1c
data1c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = uint8(mean(matrix,'all'));
        data1c = [data1c val];
    end
end
image1c = reshape(data1c, column-9+1, row-9+1);
image1c = image1c';
% imshow(uint8(image1c));
imwrite(uint8(image1c),'image1c.jpg','jpg');

%%% 5.2a
data2a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = 1;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val * matrix(m,n);
            end
        end
        val = val ^ (1/(3*3));
        data2a = [data2a val];
    end
end
image2a = reshape(data2a, column-3+1, row-3+1);
image2a = image2a';
% imshow(uint8(image2a));
imwrite(uint8(image2a),'image2a.jpg','jpg');

%%% 5.2b
data2b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = 1;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val * matrix(m,n);
            end
        end
        val = val ^ (1/(7*7));
        data2b = [data2b val];
    end
end
image2b = reshape(data2b, column-7+1, row-7+1);
image2b = image2b';
% imshow(uint8(image2b));
imwrite(uint8(image2b),'image2b.jpg','jpg');

%%% 5.2c
data2c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = 1;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val * matrix(m,n);
            end
        end
        val = val ^ (1/(9*9));
        data2c = [data2c val];
    end
end
image2c = reshape(data2c, column-9+1, row-9+1);
image2c = image2c';
% imshow(uint8(image2c));
imwrite(uint8(image2c),'image2c.jpg','jpg');

%%% 5.3a
data3a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + 1/matrix(m,n);
            end
        end
        val = (3*3)/val;
        data3a = [data3a val];
    end
end
image3a = reshape(data3a, column-3+1, row-3+1);
image3a = image3a';
% imshow(uint8(image3a));
imwrite(uint8(image3a),'image3a.jpg','jpg');

%%% 5.3b
data3b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + 1/matrix(m,n);
            end
        end
        val = (7*7)/val;
        data3b = [data3b val];
    end
end
image3b = reshape(data3b, column-7+1, row-7+1);
image3b = image3b';
% imshow(uint8(image3b));
imwrite(uint8(image3b),'image3b.jpg','jpg');

%%% 5.3c
data3c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + 1/matrix(m,n);
            end
        end
        val = (9*9)/val;
        data3c = [data3c val];
    end
end
image3c = reshape(data3c, column-9+1, row-9+1);
image3c = image3c';
% imshow(uint8(image3c));
imwrite(uint8(image3c),'image3c.jpg','jpg');

%%% 5.4a
data4a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + matrix(m,n)^2;
            end
        end
        val = val/sum(matrix,"all");
        data4a = [data4a val];
    end
end
image4a = reshape(data4a, column-3+1, row-3+1);
image4a = image4a';
% imshow(uint8(image4a));
imwrite(uint8(image4a),'image4a.jpg','jpg');

%%% 5.4b
data4b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + matrix(m,n)^2;
            end
        end
        val = val/sum(matrix,"all");
        data4b = [data4b val];
    end
end
image4b = reshape(data4b, column-7+1, row-7+1);
image4b = image4b';
% imshow(uint8(image4b));
imwrite(uint8(image4b),'image4b.jpg','jpg');

%%% 5.4c
data4c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = 0;
        for m = 1:size(matrix, 1)
            for n = 1:size(matrix, 2)
                val = val + matrix(m,n)^2;
            end
        end
        val = val/sum(matrix,"all");
        data4c = [data4c val];
    end
end
image4c = reshape(data4c, column-9+1, row-9+1);
image4c = image4c';
% imshow(uint8(image4c));
imwrite(uint8(image4c),'image4c.jpg','jpg');

%%% 5.5a
image5a = image3a;
% imshow(uint8(image5a));
imwrite(uint8(image5a),'image5a.jpg','jpg');

%%% 5.5b
image5b = image3b;
% imshow(uint8(image5b));
imwrite(uint8(image5b),'image5b.jpg','jpg');

%%% 5.5c
image5c = image3c;
% imshow(uint8(image5c));
imwrite(uint8(image5c),'image5c.jpg','jpg');

%%% 5.6a
data6a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = uint8(median(matrix,'all'));
        data6a = [data6a val];
    end
end
image6a = reshape(data6a, column-3+1, row-3+1);
image6a = image6a';
% imshow(uint8(image6a));
imwrite(uint8(image6a),'image6a.jpg','jpg');

%%% 5.6b
data6b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = uint8(median(matrix,'all'));
        data6b = [data6b val];
    end
end
image6b = reshape(data6b, column-7+1, row-7+1);
image6b = image6b';
% imshow(uint8(image6b));
imwrite(uint8(image6b),'image6b.jpg','jpg');

%%% 5.6c
data6c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = uint8(median(matrix,'all'));
        data6c = [data6c val];
    end
end
image6c = reshape(data6c, column-9+1, row-9+1);
image6c = image6c';
% imshow(uint8(image6c));
imwrite(uint8(image6c),'image6c.jpg','jpg')

%%% 5.7a
data7a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = uint8(max(matrix,[],'all'));
        data7a = [data7a val];
    end
end
image7a = reshape(data7a, column-3+1, row-3+1);
image7a = image7a';
% imshow(uint8(image7a));
imwrite(uint8(image7a),'image7a.jpg','jpg');

%%% 5.7b
data7b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = uint8(max(matrix,[],'all'));
        data7b = [data7b val];
    end
end
image7b = reshape(data7b, column-7+1, row-7+1);
image7b = image7b';
% imshow(uint8(image7b));
imwrite(uint8(image7b),'image7b.jpg','jpg');

%%% 5.7c
data7c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = uint8(max(matrix,[],'all'));
        data7c = [data7c val];
    end
end
image7c = reshape(data7c, column-9+1, row-9+1);
image7c = image7c';
% imshow(uint8(image7c));
imwrite(uint8(image7c),'image7c.jpg','jpg')

%%% 5.8a
data8a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = uint8(min(matrix,[],'all'));
        data8a = [data8a val];
    end
end
image8a = reshape(data8a, column-3+1, row-3+1);
image8a = image8a';
% imshow(uint8(image8a));
imwrite(uint8(image8a),'image8a.jpg','jpg');

%%% 5.8b
data8b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = uint8(min(matrix,[],'all'));
        data8b = [data8b val];
    end
end
image8b = reshape(data8b, column-7+1, row-7+1);
image8b = image8b';
% imshow(uint8(image8b));
imwrite(uint8(image8b),'image8b.jpg','jpg');

%%% 5.8c
data8c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = uint8(min(matrix,[],'all'));
        data8c = [data8c val];
    end
end
image8c = reshape(data8c, column-9+1, row-9+1);
image8c = image8c';
% imshow(uint8(image8c));
imwrite(uint8(image8c),'image8c.jpg','jpg')

%%% 5.9a
data9a = [];
for i = 2:(row-1)
    for j = 2:(column-1)
        matrix = double(image(i-1:i+1, j-1:j+1));
        val = uint8((max(matrix,[],'all')-min(matrix,[],'all'))/2);
        data9a = [data9a val];
    end
end
image9a = reshape(data9a, column-3+1, row-3+1);
image9a = image9a';
% imshow(uint8(image9a));
imwrite(uint8(image9a),'image9a.jpg','jpg');

%%% 5.9b
data9b = [];
for i = 4:(row-3)
    for j = 4:(column-3)
        matrix = double(image(i-3:i+3, j-3:j+3));
        val = uint8((max(matrix,[],'all')-min(matrix,[],'all'))/2);
        data9b = [data9b val];
    end
end
image9b = reshape(data9b, column-7+1, row-7+1);
image9b = image9b';
% imshow(uint8(image9b));
imwrite(uint8(image9b),'image9b.jpg','jpg');

%%% 5.9c
data9c = [];
for i = 5:(row-4)
    for j = 5:(column-4)
        matrix = double(image(i-4:i+4, j-4:j+4));
        val = uint8((max(matrix,[],'all')-min(matrix,[],'all'))/2);
        data9c = [data9c val];
    end
end
image9c = reshape(data9c, column-9+1, row-9+1);
image9c = image9c';
% imshow(uint8(image9c));
imwrite(uint8(image9c),'image9c.jpg','jpg')
