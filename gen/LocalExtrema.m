function [x_list y_list A_list] = LocalExtrema(x, y, A, upper, lower)

[xMax yMax Amax] = LocalMax(x, y, A, upper);
[xMin yMin AMin] = LocalMin(x, y, A, lower);

x_list = [xMax xMin];
y_list = [yMax yMin];
A_list = [Amax AMin];

return