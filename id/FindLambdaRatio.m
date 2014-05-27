% personal derivation of the swirl compactness ratio
% the ratio of the real to imaginary portion of the complex eigenvalue
% ratio = real/imag
% note that for incompressible flows dudx + dvdy = 0 --> ratio = 0

function [lratio] = FindLambdaRatio(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);
lratio = zeros(N,M);
for i = 1:N
    for j = 1:M
        delta = (dudx(i,j)+dvdy(i,j))^2 - 4*(dudx(i,j)*dvdy(i,j) - dudy(i,j)*dvdx(i,j));
        if delta < 0
            real = dudx(i,j) + dvdy(i,j);
            imag = sqrt( -delta );
            lratio(i,j) = real/imag;
        else
            lratio(i,j) = nan;
        end
    end
end
return