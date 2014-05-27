function [x y u v] = Downsample(x, y, u, v, new_dx)

new_xpts = floor( ( max(x(:,1)) - min(x(:,1)) )/new_dx );
new_ypts = floor( ( max(y(1,:)) - min(y(1,:)) )/new_dx );

minx = min(x(:,1));
miny = min(y(1,:));
x_tmp = zeros(new_xpts, new_ypts);
y_tmp = zeros(new_xpts, new_ypts);
for i = 1:new_xpts
    for j = 1:new_ypts
        x_tmp(i,j) = minx + i*new_dx;
        y_tmp(i,j) = miny + j*new_dx;
    end
end
u = interp2(y, x, u, y_tmp, x_tmp);
v = interp2(y, x, v, y_tmp, x_tmp);
x = x_tmp;
y = y_tmp;

return
