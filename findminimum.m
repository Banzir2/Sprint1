% this function finds the minimal entry of a matrix U and its indices
function [I, J, val] = findminimum(U)
% Find the minimum value and its linear index
[minValue1, linearIndex] = min(U(:));

% Convert the linear index to row and column indices
[row, col] = ind2sub(size(U), linearIndex);

I = row;
J = col;
val = minValue1;

% Display the result
fprintf('The first point is %d counts, at row %d, column %d.\n', minValue1, row, col);
end