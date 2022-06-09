clc;clear;
rows = 640;  
columns = 480;

in_file=fopen('cat.raw', 'r');
input=fread(in_file, [rows, columns]); 
fclose(in_file);

data = input(:)';
data_avg = [];
data_med = [];
for i = 8:(rows-7)
    for j = 8:(columns-7)
        matrix = double(input(i-7:i+7,j-7:j+7));
        val_med = median(matrix,'all');
        val_med = uint8(val_med);
        data_med = [data_med val_med];

        matrix = double(matrix./(15*15));
        val_avg = sum(matrix,'all');
        val_avg = uint8(val_avg);
        data_avg = [data_avg val_avg];
    end
end

image_avg = reshape(data_avg, columns-15+1, rows-15+1);
image_med = reshape(data_med, columns-15+1, rows-15+1);
imwrite(image_avg,'cat_average.jpg','jpg');
imwrite(image_med,'cat_median.jpg','jpg');

figure;
histogram(data);
xlabel('Intensity value');
ylabel('Number of pixels');
title('cat with original filter');
saveas(gcf,'cat_Histogram_Original.jpg');
figure;
histogram(data_avg);
xlabel('Intensity value');
ylabel('Number of pixels');
title('cat with average filter');
saveas(gcf,'cat_Histogram_Average.jpg');
figure;
histogram(data_med);
xlabel('Intensity value');
ylabel('Number of pixels');
title('cat with median filter');
saveas(gcf,'cat_Histogram_Median.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
rows = 640;  
columns = 480;

in_file=fopen('triangle.raw', 'r');
input=fread(in_file, [rows, columns]); 
fclose(in_file);

data = input(:)';
data_avg = [];
data_med = [];
for i = 8:(rows-7)
    for j = 8:(columns-7)
        matrix = double(input(i-7:i+7,j-7:j+7));
        val_med = median(matrix,'all');
        val_med = uint8(val_med);
        data_med = [data_med val_med];

        matrix = double(matrix./(15*15));
        val_avg = sum(matrix,'all');
        val_avg = uint8(val_avg);
        data_avg = [data_avg val_avg];
    end
end

image_avg = reshape(data_avg, columns-15+1, rows-15+1);
image_med = reshape(data_med, columns-15+1, rows-15+1);
imwrite(image_avg,'triangle_average.jpg','jpg');
imwrite(image_med,'triangle_median.jpg','jpg');

figure;
histogram(data);
xlabel('Intensity value');
ylabel('Number of pixels');
title('triangle with original filter');
saveas(gcf,'triangle_Histogram_Original.jpg');
figure;
histogram(data_avg);
xlabel('Intensity value');
ylabel('Number of pixels');
title('triangle with average filter');
saveas(gcf,'triangle_Histogram_Average.jpg');
figure;
histogram(data_med);
xlabel('Intensity value');
ylabel('Number of pixels');
title('triangle with median filter');
saveas(gcf,'triangle_Histogram_Median.jpg');