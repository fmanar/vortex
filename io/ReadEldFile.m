function [x, y, u, v, dx, dy, xWing, yWing] = ReadEldFile(name)

f = fopen(name);

% header
data = textscan(f,'%s %s %s %s',1);
data = textscan(f,'%s %s %s %s %s %s %s %s %s %s %s',1);
data = textscan(f,'%s %s %u %s %u %s',1);
xpts = data{3};
ypts = data{5};

% rest of file
x = zeros(xpts,ypts);
y = zeros(xpts,ypts);
u = zeros(xpts,ypts);
v = zeros(xpts,ypts);

data = textscan(f,'%f %f %f %f %f %f %f %f %f %f %f');
c = 1;
for j = 1:ypts
    for i = 1:xpts
        x(i,j) = data{1}(c);
        y(i,j) = data{2}(c);
        u(i,j) = data{3}(c);
        v(i,j) = data{4}(c);
        c = c+1;
    end
end
fgetl(f);
fgetl(f);
fgetl(f);
data = textscan(f, '%f %f\n');
xWing = data{1};
yWing = data{2};

 
fclose(f);

dx = abs( x(1,1) - x(2,1) );
dy = abs( y(1,1) - y(1,2) );
return