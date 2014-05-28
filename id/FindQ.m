function [ Q ] = FindQ( s )
% Field's derivation of the Q criterion
% Q derived for 2D flow, NOT assuming incompressibility
% I'm going to need to refresh myself on this one.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - Q: Q scalar field
Q = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        Q(i,j) = -0.5*( s.dudx(i,j)^2 + s.dvdy(i,j)^2 ) ...
            - s.dudy(i,j)*s.dvdx(i,j);
    end
end
return