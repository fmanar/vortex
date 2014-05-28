function [ g1 ] = FindGamma1Circle( s, radius )
% Computes the Gamma1 function with a circular window.
% See Grafieux 2001
%
% Inputs:
%     - s: vector field
%     - radius: radius of window in grid points
% Output:
%     - g1: Gamma 1 scalar field
xMinInd = 1+radius;
xMaxInd = s.Nx-radius;
yMinInd = 1+radius;
yMaxInd = s.Ny-radius;  

g1 = zeros(s.Nx, s.Ny);
% save the radius of the window squared
% eps is an epsilon do include some extra points that would be just outside
% the window
eps = 0.1;
r2 = ( radius + eps )^2;
% two grid loops
for xInd = xMinInd:xMaxInd
    for yInd = yMinInd:yMaxInd
        % two window loops over square window
        N = 0;
        sum = 0;
        for dxInd = -radius:radius
            for dyInd = -radius:radius
                % window radius check to make a circle
                if dxInd^2 + dyInd^2 <= r2
                    rx = s.x(xInd+dxInd, yInd+dyInd) - s.x(xInd, yInd);
                    ry = s.y(xInd+dxInd, yInd+dyInd) - s.y(xInd, yInd);
                    rMag = sqrt(rx^2 + ry^2);
                    velMag = sqrt( s.u(xInd+dxInd, yInd+dyInd)^2 ...
                        + s.v(xInd+dxInd, yInd+dyInd)^2 ); 
                    % cross product
                    cross = s.u(xInd+dxInd, yInd+dyInd)*ry ...
                        - s.v(xInd+dxInd, yInd+dyInd)*rx;
                    if rMag && velMag
                        % cross/rMag/velMag = sin(theta)
                        sum = sum + cross/rMag/velMag;
                    else
                        sum = sum + 0;
                    end
                    N = N + 1;
                end
            end
        end
        g1(xInd, yInd) = sum/N;
    end
end 

return