function [ delta ] = FindDelta_2d( s )
% Computes the delta criterion in a simplified manner for 2d flow.
% Paper?  Context?  I forgot all about this one, and I aparently derived
% it.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - delta: delta scalar field
delta = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        delta(i,j) = s.dudx(i,j)*s.dvdy(i,j) + s.dudy(i,j)*s.dvdx(i,j);
    end
end
return