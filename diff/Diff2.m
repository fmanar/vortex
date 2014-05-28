function [ s ] = Diff2( s )
% 2nd order central differencing  for 1st derivative
% Inputs:
%     - s: vector field
% Output:
%     - dudx, etc.: scalar arrays of differences
s.dudx = zeros(s.Nx,s.Ny);
s.dudy = zeros(s.Nx,s.Ny);
s.dvdx = zeros(s.Nx,s.Ny);
s.dvdy = zeros(s.Nx,s.Ny);

r = 1;
for i = 2:s.Nx-1
    for j = 2:s.Ny-1
        % if any of the used points is 0, skip
        if  ~( s.u(i,j) && s.u(i+r,j) && s.u(i-r,j) && s.u(i,j+r) && s.u(i,j-r) ...
                && s.v(i,j) && s.v(i+r,j) && s.v(i-r,j) && s.v(i,j+r) && s.v(i,j-r))
            s.dudx(i,j) = 0;
            s.dudy(i,j) = 0;
            s.dvdx(i,j) = 0;
            s.dvdy(i,j) = 0;
        else
            s.dudx(i, j) = 0.5*( s.u(i+1, j) - s.u(i-1, j) )/s.dx;
            s.dudy(i, j) = 0.5*( s.u(i, j+1) - s.u(i, j-1) )/s.dy;
            s.dvdx(i, j) = 0.5*( s.v(i+1, j) - s.v(i-1, j) )/s.dx;
            s.dvdy(i, j) = 0.5*( s.v(i, j+1) - s.v(i, j-1) )/s.dy;
        end
    end
end

return