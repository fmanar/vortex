function [x_list y_list A_list] = LocalExtremaInd(A, upper, lower)

[xMax yMax Amax] = LocalMaxInd(A, upper);
[xMin yMin AMin] = LocalMinInd(A, lower);

% x_list = [xMax xMin];
% y_list = [yMax yMin];
% A_list = [Amax AMin];

x_list = [xMin xMax];
y_list = [yMin yMax];
A_list = [AMin Amax];
return