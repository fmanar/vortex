% Delta criterion according Field
% for 2d flow
function [delta] = FindDelta_2d(dudx, dudy, dvdx, dvdy)
[N M] = size(dudx);

delta = zeros(N,M);
for i = 1:N
    for j = 1:M
        delta(i,j) = dudx(i,j)*dvdy(i,j) + dudy(i,j)*dvdx(i,j);
    end
end
return