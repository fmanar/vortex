close all 
clear
clc

name = 'gino.txt';
[x, y, u, v, dx, dy] = ReadVectorFile(name);

for window = 5:5:30
    [g1] = FindGamma1(x, y, u, v, window);
    [g2] = FindGamma2(x, y, u, v, window);

    figure(1)
    plot(y(153,:),g1(153,:))
    hold all
    figure(2)
    plot(y(153,:),g2(153,:))
    hold all
end
figure(1)
ma = max(g1(153,:));
mi = min(g1(153,:));
plot([y(1,151) y(1,151)],[mi ma]);
plot(y(153,:),u(153,:),'--k');
title('\Gamma_1 Slice @ x_i = 153');
legend('5','10','15','20','25','30');
xlabel('y [mm]');

figure(2)
ma = max(g2(153,:));
mi = min(g2(153,:));
plot([y(1,151) y(1,151)],[mi ma]);
plot(y(153,:),u(153,:),'--k');
title('\Gamma_2 Slice @ x_i = 153');
legend('5','10','15','20','25','30');
xlabel('y [mm]');

figure(3)
quiver(x,y,u,v,5);