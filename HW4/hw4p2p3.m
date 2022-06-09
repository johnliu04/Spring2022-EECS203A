clc;clear;

M = 4.0;
N = 4.0;
[X,Y] = meshgrid(0:0.1:4,0:0.1:4);

F_2 = sqrt((2 - cos(2*pi/M*X) - cos(2*pi/N*Y)) .^ 2 + (sin(2*pi/M*X) + sin(2*pi/N*Y)) .^2);
surf(X, Y, F_2)
saveas(gcf,'hw4p2.jpg');


F_3 = sqrt((2 * cos(2*pi/M*X) + 2 * cos(2*pi/N*Y) - 4) .^2);
surf(X, Y, F_3)
saveas(gcf,'hw4p3.jpg');
