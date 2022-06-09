clc;clear;
rows = 640;  
columns = 480;
file=fopen('cat.raw', 'r');
input=fread(file, rows * columns,'uint8=>uint8'); 
fclose(file);

hist = zeros(256, 1);
EQhist = zeros(256, 1);
data = uint8(zeros(length(input), 1));


for c = 1:length(input)
    hist(input(c)+1) = hist(input(c) + 1) + 1; 
end

val = 0;

for i = 1:256
   
	val = val + (hist(i) / length(input)); 
    EQhist(i) = val * 256;
end

for p = 1:length(input)
    data(p) = EQhist(input(p) + 1);
end


image = reshape(data, rows, columns);
output = fopen('cat_HE.raw', 'w+');
fwrite(output, image, 'uint8');
fclose(output);

figure;
plot(input, EQhist(input + 1), '.');
axis([0 256 0 256]);
title('Histogram Equalization');
xlabel('Input gray level, r');
ylabel('Output gray level, s');
saveas(gcf,'EECS203A_HW2_b.jpg');
