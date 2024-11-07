clear;
close all;
objects = imaqfind;
delete(objects);

x = videoinput('winvideo', 1);

triggerconfig(x, 'manual');
x.TriggerRepeat = inf;
x.FramesPerTrigger = 1;

start(x);
trigger(x);

img = getdata(x);
%img = imread("2redDots_test_image.jpg");

% only interested in the red light - filter red matrix from M
% truncate - take a 20:60 sample containing the two points
%M = truncateimg(img);
%M0 = img;
import 

while 1==1
    trigger(x);
    img = getdata(x);

    M = img;

imshow(M)
axis on
hold on;


R0 = M(:,:,1);
[rows, cols, blah] = size(R0);
%R = zeros(rows, cols, 3);
%for i = 1:rows
%    for j=1:cols
%        pixelBrightness = hypot(double(G0), double(B0));
%        R(i, j) = double(M(i, j, 1)) / pixelBrightness;
%    end
%end
% convolve R to get rid of noise
R_conved = imgaussfilt(R0, 10);
%G = M(:,:,2);
%B = M(:,:,3);


% find the first point that is the most red
[row1, col1, maxIntensity1] = findmaximum(R_conved);

% neutralize this point and its surrounding in order to find the second
% point
% we want the identified points to be at least 2*d + 1 points apart
%saturate(B, 2, row1, col1);
r = 30;
leftlim = max(1, row1 - r);
rightlim = min(size(R_conved, 1), row1 + r);
lowerlim = max(1, col1 - r);
upperlim = min(size(R_conved, 2), col1 + r);

R_conved((leftlim:rightlim), (lowerlim:upperlim)) = zeros(rightlim-leftlim+1, upperlim-lowerlim+1);

% find the second point
[row2, col2, maxIntensity2] = findmaximum(R_conved);

dist2wall(row1, col1, row2, col2);

% Plot cross at row row1, column col1
plot(col1, row1, 'r+', 'MarkerSize', 30, 'LineWidth', 2);
% Plot cross at row row2, column col2
plot(col2, row2, 'r+', 'MarkerSize', 30, 'LineWidth', 2);



%figure
%imshow(R_conved)
hold off;
end
