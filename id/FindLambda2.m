% my derivation of the lambda 2 criterion
% a long winded use of the quadratic formula for the eigenvalues of 
% A = S*S + O*O

function [l2] = FindLambda2(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);
l2 = zeros(N,M);
for i = 1:N
    for j = 1:M
        a = dudx(i,j);
        b = dudy(i,j);
        c = dvdx(i,j);
        d = dvdy(i,j);
        
        beta = a*a + d*d + b*c;
        gamma1 = a^2*b*c + a^2*d^2 + b*c*d^2 + b^2*c^2;
        gamma2 = ( 0.5*(a+d)*(b+c) )^2;
        gamma = gamma1 - gamma2;
        
        l2(i,j) = 0.5*( beta - sqrt( beta^2 - 4*gamma ) );
    end
end

return