% personal derivation of the Lambda_ci parameter
% the size of the imaginary portion of the eigenvalue, if there is one.
% note that for incompressible flows dudx + dvdy = 0

function [lci] = FindLambdaci(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);
lci = zeros(N,M);
for i = 1:N
    for j = 1:M
        delta = (dudx(i,j)+dvdy(i,j))^2 - 4*(dudx(i,j)*dvdy(i,j) - dudy(i,j)*dvdx(i,j));
        if delta < 0
            lci(i,j) = sqrt( -delta );
        else
            lci(i,j) = nan;
        end
    end
end
return