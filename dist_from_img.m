% acquire image
img = getsnapshot(x);

% only interested in the red light - filter red matrix from M
% truncate - take a 20:60 sample containing the two points
M = truncateimg(img);
R = M(:,:,1);
G = M(:,:,2);
B = M(:,:,3);
% find the point which is the least blue
[row1, col1, minIntensity1] = findminimum(B);

% make the minimum we found the new maximum. the new minimum is the 2nd
% point.

% we want the identified points to be at least 2*d + 1 points apart
%saturate(B, 2, row1, col1);
leftlim = max(1, row1 - 2);
rightlim = min(size(B, 1), row1 + 2);
lowerlim = max(1, col1 - 2);
upperlim = min(size(B, 2), col1 + 2);

B((leftlim:rightlim), (lowerlim:upperlim)) = 255 .* ones(rightlim-leftlim+1, upperlim-lowerlim+1);

% find the minimum value and its linear index
[row2, col2, minIntensity2] = findminimum(B);
dist2wall(row1, col1, row2, col2)