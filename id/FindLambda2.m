function [ l2 ] = FindLambda2( s )
% Field's derivation of the lambda 2 criterion
% A long winded use of the quadratic formula for the eigenvalues of
% A = S*S + O*O
% I'm going to need to refresh myself on this one.
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - l2: lambda 2 scalar field
l2 = zeros(s.Nx,s.Ny);
for i = 1:s.Nx
    for j = 1:s.Ny
        a = s.dudx(i,j);
        b = s.dudy(i,j);
        c = s.dvdx(i,j);
        d = s.dvdy(i,j);
        
        beta = a*a + d*d + b*c;
        gamma1 = a^2*b*c + a^2*d^2 + b*c*d^2 + b^2*c^2;
        gamma2 = ( 0.5*(a+d)*(b+c) )^2;
        gamma = gamma1 - gamma2;
        
        l2(i,j) = 0.5*( beta - sqrt( beta^2 - 4*gamma ) );
    end
end

return