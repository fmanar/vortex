function [ lratio ] = FindLambdaRatio( s )
% Field's derivation of the lambda_ratio or 'swirl compactness' criterion
% the ratio of the real to imaginary portion of the complex eigenvalue
% ratio = real/imag
% note that for incompressible flows dudx + dvdy = 0 --> ratio = 0
% I'm going to need to refresh myself on this one.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - lratio: lambda_ci scalar field
lratio = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        delta = ( s.dudx(i,j)+s.dvdy(i,j) )^2 ...
            - 4*( s.dudx(i,j)*s.dvdy(i,j) ...
            - s.dudy(i,j)*s.dvdx(i,j) );
        if delta < 0
            real = s.dudx(i,j) + s.dvdy(i,j);
            imag = sqrt( -delta );
            lratio(i,j) = real/imag;
        else
            lratio(i,j) = nan;
        end
    end
end
return