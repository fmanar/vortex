function [ g2 ] = FindGamma2Circle( s, radius )
% Computes the Gamma2 function with a circular window.
% See Grafieux 2001
%
% Inputs:
%     - s: vector field
%     - radius: radius of window in grid points
% Output:
%     - g2: Gamma 2 scalar field
xMinInd = 1+radius;
xMaxInd = s.Nx-radius;
yMinInd = 1+radius;
yMaxInd = s.Ny-radius;  

g2 = zeros(s.Nx, s.Ny);
% two grid loops
% save the radius of the window squared
% eps is an epsilon do include some extra points that would be just outside
% the window
eps = 0.1;
r2 = ( radius + eps )^2;
for xInd = xMinInd:xMaxInd
    for yInd = yMinInd:yMaxInd
        % find average velocity in window
        N = 0;
        uAve = 0;
        vAve = 0;
        for dxInd = -radius:radius
            for dyInd = -radius:radius
                if dxInd^2 + dyInd^2 <= r2
                    uAve = uAve + s.u(xInd+dxInd, yInd+dyInd);
                    vAve = vAve + s.v(xInd+dxInd, yInd+dyInd);
                    N = N+1;
                end
            end
        end
        uAve = uAve/N;
        vAve = vAve/N;
        
        % two window loops over square window
        sum = 0;
        for dxInd = -radius:radius
            for dyInd = -radius:radius
                % window radius check to make a circle
                if dxInd^2 + dyInd^2 <= r2
                    % r is PM vector from Graftieux
                    rx = s.x(xInd+dxInd, yInd+dyInd) - s.x(xInd, yInd);
                    ry = s.y(xInd+dxInd, yInd+dyInd) - s.y(xInd, yInd);
                    rMag = sqrt(rx^2 + ry^2);
                    % U and V are velocities at eval point, minus the
                    % average in the case (see Gamma2 definition)
                    U = s.u(xInd+dxInd, yInd+dyInd) - uAve;
                    V = s.v(xInd+dxInd, yInd+dyInd) - vAve;
                    velMag = sqrt(U^2 + V^2); 
                    % cross product
                    cross = U*ry - V*rx;
                    if rMag && velMag
                        % cross/rMag/velMag = sin(theta)
                        sum = sum + cross/rMag/velMag;
                    else
                        sum = sum + 0;
                    end
                end
            end
        end           
        g2(xInd, yInd) = sum/N;
    end
end 

return