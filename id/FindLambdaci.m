function [ lci ] = FindLambdaci( s )
% Field's derivation of the lambda_ci criterion
% the size of the imaginary portion of the eigenvalue, if there is one.
% note that for incompressible flows dudx + dvdy = 0
% I'm going to need to refresh myself on this one.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - lci: lambda_ci scalar field
lci = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        delta = (s.dudx(i,j)+s.dvdy(i,j))^2 ...
            - 4*(s.dudx(i,j)*s.dvdy(i,j) ...
            - s.dudy(i,j)*s.dvdx(i,j));
        if delta < 0
            lci(i,j) = sqrt( -delta );
        else
            lci(i,j) = nan;
        end
    end
end
return