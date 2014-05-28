function [ out_s ] = Downsample( in_s , step )
% thins out vector field taking every 'step' vector
% won't effect any derivatives....
%
% Inputs:
%     - in_s: vector field
%     - step: the step to take along the vector field
% Output:
%     - out_s: the thinned out vector field

iIn = 1;
iOut = 1;
while iIn <= in_s.Nx
    jIn = 1;
    jOut = 1;
    while jIn <= in_s.Ny
        out_s.x(iOut,jOut) = in_s.x(iIn,jIn);
        out_s.y(iOut,jOut) = in_s.y(iIn,jIn);
        out_s.u(iOut,jOut) = in_s.u(iIn,jIn);
        out_s.v(iOut,jOut) = in_s.v(iIn,jIn);
        jIn = jIn + step;
        jOut = jOut + 1;
    end
    iIn = iIn + step;
    iOut = iOut + 1;
end
return
