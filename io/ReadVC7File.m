function [x y u v] = ReadVC7File( file )

A = readimx(file);
[x y u v] = showimx(A,1);

return

