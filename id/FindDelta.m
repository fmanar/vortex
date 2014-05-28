function [ delta ] = FindDelta( s )
% Computes the delta criterion.
% I don't even remember what that is right now.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - delta: delta scalar field
delta = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        S = s.dudx(i,j) + s.dvdy(i,j);
        q = s.dudx(i,j)*s.dvdy(i,j) - s.dudy(i,j)*s.dvdx(i,j);
        Q = 0.25*S^2 - q;
        R = -q;
        delta(i,j) = (Q/3)^3 + (R/2)^2;
    end
end

return