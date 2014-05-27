% Field's Gamma2 Function
% uses a circular window
% curiously, approx 2x as fast as Anya's for no apparent reason
function [g2] = FindGamma2Circle(x, y, u, v, window)
[xPts,yPts]=size(x);
xMinInd = 1+window;
xMaxInd = xPts-window;
yMinInd = 1+window;
yMaxInd = yPts-window;  

g2 = zeros(xPts, yPts);
% two grid loops
% save the radius of the window squared
% eps is an epsilon do include some extra points that would be just outside
% the window
eps = 0.1;
w2 = ( window + eps)^2;
for xInd=xMinInd:xMaxInd
    for yInd=yMinInd:yMaxInd
        % find average velocity in window
        N = 0;
        uAve = 0;
        vAve = 0;
        for dxInd = -window:window
            for dyInd = -window:window
                if dxInd^2 + dyInd^2 <= w2
                    uAve = uAve + u(xInd+dxInd, yInd+dyInd);
                    vAve = vAve + v(xInd+dxInd, yInd+dyInd);
                    N = N+1;
                end
            end
        end
        uAve = uAve/N;
        vAve = vAve/N;
        
        % two window loops over square window
        g1Sum = 0;
        for dxInd = -window:window
            for dyInd = -window:window
                % window radius check to make a circle
                if dxInd^2 + dyInd^2 <= w2
                    % r is PM vector from Graftieux
                    rx = x(xInd+dxInd, yInd+dyInd) - x(xInd, yInd);
                    ry = y(xInd+dxInd, yInd+dyInd) - y(xInd, yInd);
                    rMag = sqrt(rx^2 + ry^2);
                    % U and V are velocities at eval point, minus the
                    % average in the case (see Gamma2 definition)
                    U = u(xInd+dxInd, yInd+dyInd) - uAve;
                    V = v(xInd+dxInd, yInd+dyInd) - vAve;
                    velMag = sqrt(U^2 + V^2); 
                    % cross product
                    cross = U*ry - V*rx;
                    if rMag && velMag
                        % cross/rMag/velMag = sin(theta)
                        g1Sum = g1Sum + cross/rMag/velMag;
                    else
                        g1Sum = g1Sum + 0;
                    end
                end
            end
        end           
        g2(xInd, yInd) = g1Sum/N;
    end
end 

return