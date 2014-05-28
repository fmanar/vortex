function [ out_s ] = Window( in_s, range)
% Window's the vector field inside of the range specified.
% Range uses the x and y coordinates, not the indices.
%
% Inputs:
%     - in_s: vector field
%     - range: [min_x max_x min_y max_y], can put inf or -inf to keep old
%               bound
% Output:
%     - out_s: the windowed out vector field

% find left (xmin) bound
i = 1;
while x(i,1) < range(1) && i < in_s.Nx
    i = i+1;
end
i_xmin = i;
% find right (xmax) bound
while x(i,1) < range(2) && i < in_s.Nx
    i = i+1;
end
i_xmax = i;
% find lower (ymin) bound
j = 1;
while y(1,j) > range(4) && j < in_s.Ny
    j = j+1;
end
j_ymin = j;
% find upper (ymax) bound
while y(1,j) > range(3) && j < in_s.Ny
    j = j+1;
end
j_ymax = j-1;

xr = i_xmin:i_xmax;
yr = j_ymin:j_ymax;

out_s.x = x(xr, yr);
out_s.y = y(xr, yr);
out_s.u = u(xr, yr);
out_s.v = v(xr, yr);
return
