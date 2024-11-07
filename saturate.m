% this function takes a matrix U, takes a (2d + 1)-by-(2d + 1) submatrix
% of it centred at [I, J], and makes its entries equal 255
function saturate(U, d, I, J)
leftlim = max(1, I - d);
rightlim = min(size(U, 1), I + d);
lowerlim = max(1, J - d);
upperlim = min(size(U, 2), J + d);

U((leftlim:rightlim), (lowerlim:upperlim)) = 255 .* ones(rightlim-leftlim+1, upperlim-lowerlim+1);
end