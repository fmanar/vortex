function [dudx dudy dvdx dvdy] = Diff4( s )
% 4th order central differencing  for 1st derivative
% Inputs:
%     - s: vector field
% Output:
%     - dudx, etc.: scalar arrays of differences
dudx = zeros(s.Nx,s.Ny);
dudy = zeros(s.Nx,s.Ny);
dvdx = zeros(s.Nx,s.Ny);
dvdy = zeros(s.Nx,s.Ny);

r = 2;
for i = 3:s.Nx-2
    for j = 3:s.Ny-2
        if  ~( s.u(i,j) && s.u(i+r,j) && s.u(i-r,j) && s.u(i,j+r) && s.u(i,j-r) ...
                && s.v(i,j) && s.v(i+r,j) && s.v(i-r,j) && s.v(i,j+r) && s.v(i,j-r))
            dudx(i,j) = 0;
            dudy(i,j) = 0;
            dvdx(i,j) = 0;
            dvdy(i,j) = 0;
        else
            dudx(i, j) = ( s.u(i-2,j) - 8*s.u(i-1, j) ...
                + 8*s.u(i+1, j) - s.u(i+2,j) )/s.dx/12;
            dudy(i, j) = ( s.u(i,j-2) - 8*s.u(i, j-1) ...
                + 8*s.u(i, j+1) - s.u(i,j+2) )/s.dy/12;
            dvdx(i, j) = ( s.v(i-2,j) - 8*s.v(i-1, j) ...
                + 8*s.v(i+1, j) - s.v(i+2,j) )/s.dx/12;
            dvdy(i, j) = ( s.v(i-2,j) - 8*s.v(i-1, j) ...
                + 8*s.v(i+1, j) - s.v(i+2,j) )/s.dy/12;
        end
    end
end

return