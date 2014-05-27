function [dudx dudy dvdx dvdy] = Diff2( s )
% 2nd order central differencing  for 1st derivative
% Inputs:
%     - s: vector field
% Output:
%     - dudx, etc.: scalar arrays of differences
dudx = zeros(s.Nx,s.Ny);
dudy = zeros(s.Nx,s.Ny);
dvdx = zeros(s.Nx,s.Ny);
dvdy = zeros(s.Nx,s.Ny);

r = 1;
for i = 2:s.Nx-1
    for j = 2:s.Ny-1
        if  ~( s.u(i,j) && s.u(i+r,j) && s.u(i-r,j) && s.u(i,j+r) && s.u(i,j-r) ...
                && s.v(i,j) && s.v(i+r,j) && s.v(i-r,j) && s.v(i,j+r) && s.v(i,j-r))
            dudx(i,j) = 0;
            dudy(i,j) = 0;
            dvdx(i,j) = 0;
            dvdy(i,j) = 0;
        else
            dudx(i, j) = 0.5*( s.u(i+1, j) - s.u(i-1, j) )/s.dx;
            dudy(i, j) = 0.5*( s.u(i, j+1) - s.u(i, j-1) )/s.dy;
            dvdx(i, j) = 0.5*( s.v(i+1, j) - s.v(i-1, j) )/s.dx;
            dvdy(i, j) = 0.5*( s.v(i, j+1) - s.v(i, j-1) )/s.dy;
        end
    end
end

return