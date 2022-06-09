clc;clear;

r = 0:1:255;
c1 = 255 / (255 ^ 0.4);
s1 = c1 * r .^ 0.4;

c2 = 255 / (255 ^ 2.5);
s2 = c2 * r .^ 2.5;

output = [r; s1; s2]';
output = array2table(output);
output.Properties.VariableNames(1:3) = {'Input_gray_level', 'gamma_0_4', 'gamma_2_5'};
writetable(output, 'EECS203A_HW2_a.csv');

figure
plot(r, s1, 'r', r, s2, 'b');
axis([0 255 0 255]);
xlabel('Input gray level, r');
ylabel('Output gray level, s');
legend('\gamma = 0.4','\gamma = 2.5', 'Location','southeast');
saveas(gcf,'EECS203A_HW2_a.jpg');

