function [] = EldQuiver( frameInd )
path = 'C:\Users\field\Desktop\Eldredge_l050kpi8al45a12.tar\l050kpi8al45a12\';
name = sprintf('part%07u.dat',frameInd);

[x, y, u, v, ~, ~, xWing, yWing] = ReadEldFile([path name]);
clf
quiver(x,y,u,v);
hold on
plot(xWing,yWing,'-k');
end
