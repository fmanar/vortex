% Vorticity finder
% omega = grad cross u

function [omega] = FindVorticity(dudy, dvdx)
[N M] = size(dudy);
omega = zeros(N,M);
omegamax = 0;
for i = 1:N
    for j = 1:M
        omega(i,j) = dudy(i,j) - dvdx(i,j);
        
        if omega(i,j) > omegamax
            omegamax = omega(i,j);
        end
    end
end

% omega = omega/omegamax;

return
