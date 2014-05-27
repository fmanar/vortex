% Loads an ASCII file from DaVis

function [x, y, u, v, dx, dy] = ReadVectorFile(name)

f = fopen(name);

% opening line
data = textscan(f,'%s %s %s %u %u %u %s %s %s %s %s %s',1);
if ~strcmp(data{1},'#DaVis')
    fprintf('Error: not a DaVis file.\n%s',name);
    x = 0;
    y = 0;
    u = 0;
    v = 0;
    return
end
ypts = data{5};
xpts = data{6};

% rest of file
x = zeros(xpts,ypts);
y = zeros(xpts,ypts);
u = zeros(xpts,ypts);
v = zeros(xpts,ypts);

data = textscan(f,'%f %f %f %f');
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

fclose(f);

dx = abs( x(2,1) - x(1,1) );
dy = abs( y(1,2) - y(1,1) );
return
