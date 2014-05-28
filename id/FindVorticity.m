function [ omega ] = FindVorticity( s )
% Computes vorticity
% omega = grad cross u
%
% Inputs:
%     - s: vector field with derivatives
% Output:
%     - omega: vorticity scalar field

omega = s.dudy - s.dvdx;

return
