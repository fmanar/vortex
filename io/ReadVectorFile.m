function [ s ] = ReadVectorFile( file )
% Reads in a vector file from DaVis
% for reference, a vector file looks something like this:
% #DaVis 8.1.2 2D-vector 8 205 324 "" "mm" "" "mm" "velocity" "m/s"
% -59.3761	51.4637	0	-0
% -58.97	51.4637	0	-0
% -58.5639	51.4637	0	-0
% -58.1578	51.4637	0	-0
% ...
%
% Inputs:
%     - file: the file name
% Output:
%     - s: the vector field structure

f = fopen(file);

% opening line
data = textscan(f,'%s %s %s %u %u %u %s %s %s %s %s %s',1);
if ~strcmp(data{1},'#DaVis')
    fprintf('Error: not a DaVis file.\n%s',file);
    s.x = 0;
    s.y = 0;
    s.u = 0;
    s.v = 0;
    return
end
s.Ny = data{5};
s.Nx = data{6};

% rest of file
s.x = zeros(xpts,Ny);
s.y = zeros(xpts,Ny);
s.u = zeros(xpts,Ny);
s.v = zeros(xpts,Ny);

data = textscan(f,'%f %f %f %f');
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

fclose(f);

s.dx = abs( x(2,1) - x(1,1) );
s.dy = abs( y(1,2) - y(1,1) );
return
