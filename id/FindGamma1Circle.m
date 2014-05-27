% Field's Gamma1 Function
% uses a circular window
% curiously, approx 2x as fast as Anya's for no apparent reason
function [g1] = FindGamma1Circle(x, y, u, v, window)
[xPts,yPts]=size(x);
xMinInd = 1+window;
xMaxInd = xPts-window;
yMinInd = 1+window;
yMaxInd = yPts-window;  

g1 = zeros(xPts, yPts);
% save the radius of the window squared
% eps is an epsilon do include some extra points that would be just outside
% the window
eps = 0.1;
w2 = ( window + eps)^2;
% two grid loops
for xInd=xMinInd:xMaxInd
    for yInd=yMinInd:yMaxInd
        % two window loops over square window
        N = 0;
        sum = 0;
        for dxInd = -window:window
            for dyInd = -window:window
                % window radius check to make a circle
                if dxInd^2 + dyInd^2 <= w2
                    rx = x(xInd+dxInd, yInd+dyInd) - x(xInd, yInd);
                    ry = y(xInd+dxInd, yInd+dyInd) - y(xInd, yInd);
                    rMag = sqrt(rx^2 + ry^2);
                    velMag = sqrt(u(xInd+dxInd, yInd+dyInd)^2 ...
                        + v(xInd+dxInd, yInd+dyInd)^2); 
                    % cross product
                    cross = u(xInd+dxInd, yInd+dyInd)*ry ...
                        - v(xInd+dxInd, yInd+dyInd)*rx;
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
        g1 = sum/N;
    end
end 

return