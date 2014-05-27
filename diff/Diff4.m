function [dudx dudy dvdx dvdy] = Diff4(dx, dy, u, v)
[N M] = size(u);
dudx = zeros(N,M);
dudy = zeros(N,M);
dvdx = zeros(N,M);
dvdy = zeros(N,M);

r = 2;
for i = 3:N-2
    for j = 3:M-2
        if  ~( u(i,j) && u(i+r,j) && u(i-r,j) && u(i,j+r) && u(i,j-r) ...
                && v(i,j) && v(i+r,j) && v(i-r,j) && v(i,j+r) && v(i,j-r))
            dudx(i,j) = 0;
            dudy(i,j) = 0;
            dvdx(i,j) = 0;
            dvdy(i,j) = 0;
        else
            dudx(i, j) = ( u(i-2,j) - 8*u(i-1, j) ...
                + 8*u(i+1, j) - u(i+2,j) )/dx/12;
            dudy(i, j) = ( u(i,j-2) - 8*u(i, j-1) ...
                + 8*u(i, j+1) - u(i,j+2) )/dy/12;
            dvdx(i, j) = ( v(i-2,j) - 8*v(i-1, j) ...
                + 8*v(i+1, j) - v(i+2,j) )/dx/12;
            dvdy(i, j) = ( v(i-2,j) - 8*v(i-1, j) ...
                + 8*v(i+1, j) - v(i+2,j) )/dy/12;
        end
    end
end

return