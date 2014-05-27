% Q criterion for incompressible flow
% ie assuming grad dot u = dudx + dvdy = 0

function [Q] = FindQ_2d_incomp(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);

Q = zeros(N,M);
for i = 1:N
    for j = 1:M
        Q(i,j) = -(dudx(i,j)^2 + dudy(i,j)*dvdx(i,j));
    end
end
return