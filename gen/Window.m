function [x_out y_out u_out v_out] = Window(x, y, u, v, range)
[xpts ypts] = size(x);

% find left (xmin) bound
i = 1;
while x(i,1) < range(1) && i < xpts
    i = i+1;
end
i_xmin = i;
% find right (xmax) bound
while x(i,1) < range(2) && i < xpts
    i = i+1;
end
i_xmax = i;
% find left (xmin) bound
j = 1;
while y(1,j) > range(4) && j < ypts
    j = j+1;
end
j_ymin = j;
% find right (xmax) bound
while y(1,j) > range(3) && j < ypts
    j = j+1;
end
j_ymax = j-1;

xr = i_xmin:i_xmax;
yr = j_ymin:j_ymax;

x_out = x(xr, yr);
y_out = y(xr, yr);
u_out = u(xr, yr);
v_out = v(xr, yr);
return
