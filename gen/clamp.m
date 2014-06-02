function [ out ] = Clamp( in, min, max )
% takes a scalar field and binds it to the given range
% for ex. >> out = clamp( [1 2 3 4 5], 2, 4 )
% out = [2 2 3 4 4]
%
% Inputs:
%     - in: 1D or 2D scalar field
%     - min: the lower bound for clamping
%     - max: the upper bound
% Output:
%     - out: the 'clamped' vector

[N M] = size(in);
out = zeros(N,M);
for i = 1:N
    for j = 1:M
        if in(i,j) > max
            out(i,j) = max;
        elseif in(i,j) < min
            out(i,j) = min;
        else
            out(i,j) = in(i,j);
        end
    end
end

% look at how changed it is.

return