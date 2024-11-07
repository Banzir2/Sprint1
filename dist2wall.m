function dist2wall(row1, col1, row2, col2)

% Define CONSTANT physical distance between laser pointers 
% Units of meter
d = 0.3;

% Find distance between two minima
pixel_distance = sqrt( (row1 - row2).^2 + (col1 - col2).^2 );

% Find the distance between the system and the wall
% Units of meter
D = (d/2).* cot((pi./3072) .* pixel_distance);

fprintf('The distance to the wall is: %d.\n', D);

end

