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
s.dx = abs( s.x(2,1) - s.x(1,1) );
s.dy = abs( s.y(1,2) - s.y(1,1) );

return

