function [out] = clamp(in, min, max)

[N M] = size(in);
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

return