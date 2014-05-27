function [x_list y_list A_list] = LocalMaxInd(A, threshold)

[N M] = size(A);
count = 1;
x_list = [];
y_list = [];
A_list = [];
for i = 2:N-1
    for j = 2:M-1
        if A(i,j) < threshold
            continue;
        end
        
        if A(i,j) > A(i-1,j-1) ...
                && A(i,j) > A(i,j-1) ...
                && A(i,j) > A(i+1,j-1) ...
                && A(i,j) > A(i-1,j) ...
                && A(i,j) > A(i+1,j) ...
                && A(i,j) > A(i-1,j+1) ...
                && A(i,j) > A(i,j+1) ...
                && A(i,j) > A(i+1,j+1)
            x_list(count) = i;
            y_list(count) = j;
            A_list(count) = A(i,j);
            
            count = count + 1;
        end
    end
end
% if isempty(x_list)
%     x_list = NaN;
%     y_list = NaN;
%     A_list = NaN;
% end
return
          