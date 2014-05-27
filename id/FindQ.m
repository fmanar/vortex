% Q derived for 2D flow, NOT assuming incompressibility

function [Q] = FindQ(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);
Q = zeros(N,M);
for i = 1:N
    for j = 1:M
        Q(i,j) = -0.5*(dudx(i,j)^2 + dvdy(i,j)^2) - dudy(i,j)*dvdx(i,j);
    end
end
return