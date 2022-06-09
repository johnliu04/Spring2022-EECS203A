clear;clc;

filter=[1 1 1;1 -8 1;1 1 1];

left=zeros(512,256);
right=200*ones(512,256);
image1_data= [uint8(left),uint8(right)];
image1=im2double(image1_data);
figure
subplot(2,3,1);
imshow(image1)
title('Image1');
subplot(2,3,2);
histogram(image1_data);
title('Original');
I3=conv2(image1,filter);
subplot(2,3,3)
histogram(I3);
title('Filtered');


%%
I = checkerboard(64,4,4);
K = (I > 0.5);
I2 = K*1.0;

K=uint8(K*200);
I2=im2double(K);
subplot(2,3,4);
imshow(I2)
title('Image2');
subplot(2,3,5);
histogram(K);
title('Original');
I3=conv2(K,filter);
subplot(2,3,6)
histogram(I3);
title('Filtered');

saveas(gcf,'p3.b.jpg');