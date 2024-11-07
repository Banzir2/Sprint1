% this function takes the whole picture, and cuts out of it the relevant
% patch in which the two points should be
function T = truncateimg(image)
halfwidth = 100;
halfheight = 150;
totalwidth = 768;
totalheight = 1024;
T = image((totalwidth/2-halfwidth):(totalwidth/2 + halfwidth), ...
    (totalheight/2 - halfheight):(totalheight/2 + halfheight), ...
    :);
end