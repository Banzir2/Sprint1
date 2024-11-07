% this function finds the maximal entry of a matrix U and its indices
function [I, J, val] = findmaximum(U)
% Find the maximum value and its linear index
[maxValue1, linearIndex] = max(U(:));

% Convert the linear index to row and column indices
[row, col] = ind2sub(size(U), linearIndex);

I = row;
J = col;
val = maxValue1;

% Display the result
fprintf('The first point is %d counts, at row %d, column %d.\n', maxValue1, row, col);
end
