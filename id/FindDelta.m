function [delta] = FindDelta(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);
delta = zeros(N,M);
for i = 1:N
    for j = 1:M
        S = dudx(i,j) + dvdy(i,j);
        q = dudx(i,j)*dvdy(i,j) - dudy(i,j)*dvdx(i,j);
        Q = 0.25*S^2 - q;
        R = -q;
        delta(i,j) = (Q/3)^3 + (R/2)^2;
    end
end

return