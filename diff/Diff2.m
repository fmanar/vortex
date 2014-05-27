function [dudx dudy dvdx dvdy] = Diff2(dx, dy, u, v)
[N M] = size(u);

dudx = zeros(N,M);
dudy = zeros(N,M);
dvdx = zeros(N,M);
dvdy = zeros(N,M);

r = 1;
for i = 2:N-1
    for j = 2:M-1
        if  ~( u(i,j) && u(i+r,j) && u(i-r,j) && u(i,j+r) && u(i,j-r) ...
                && v(i,j) && v(i+r,j) && v(i-r,j) && v(i,j+r) && v(i,j-r))
            dudx(i,j) = 0;
            dudy(i,j) = 0;
            dvdx(i,j) = 0;
            dvdy(i,j) = 0;
        else
            dudx(i, j) = 0.5*( u(i+1, j) - u(i-1, j) )/dx;
            dudy(i, j) = 0.5*( u(i, j+1) - u(i, j-1) )/dy;
            dvdx(i, j) = 0.5*( v(i+1, j) - v(i-1, j) )/dx;
            dvdy(i, j) = 0.5*( v(i, j+1) - v(i, j-1) )/dy;
        end
    end
end

return