function [ s ] = ReadEldFile( file )
% Reads in one of Eldredge CFD pitchup case files
%
% Inputs:
%     - file: the file name
% Output:
%     - s: the vector field structure

f = fopen(file);

% header
data = textscan(f,'%s %s %s %s',1);
data = textscan(f,'%s %s %s %s %s %s %s %s %s %s %s',1);
data = textscan(f,'%s %s %u %s %u %s',1);
s.Nx = data{3};
s.Ny = data{5};

% rest of file
s.x = zeros( s.Nx, s.Ny );
s.y = zeros( s.Nx, s.Ny );
s.u = zeros( s.Nx, s.Ny );
s.v = zeros( s.Nx, s.Ny );

data = textscan(f,'%f %f %f %f %f %f %f %f %f %f %f');
c = 1;
for j = 1:s.Ny
    for i = 1:s.Nx
        s.x(i,j) = data{1}(c);
        s.y(i,j) = data{2}(c);
        s.u(i,j) = data{3}(c);
        s.v(i,j) = data{4}(c);
        c = c+1;
    end
end
% this parts reads in the wing coordinates, ignored for now
% fgetl(f);
% fgetl(f);
% fgetl(f);
% data = textscan(f, '%f %f\n');
% xWing = data{1};
% yWing = data{2};

 
fclose(f);

s.dx = abs( s.x(1,1) - s.x(2,1) );
s.dy = abs( s.y(1,1) - s.y(1,2) );
return