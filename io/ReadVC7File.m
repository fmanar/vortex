function [ s ] = ReadVC7File( file )
% Reads in a VC7 file from DaVis
% actuall just encapsulates two functions from LaVision
%
% Inputs:
%     - file: the file name
% Output:
%     - s: the vector field structure

A = readimx(file);
[s.x s.y s.u s.v] = showimx(A,1);
[s.Ny s.Nx] = size(s.x);
s.dx = abs( x(2,1) - x(1,1) );
s.dy = abs( y(1,2) - y(1,1) );

return

