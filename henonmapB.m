x = [0.568, 0.593, 0.536, 0.61, 0.55, 0.594, 0.56]';
y = [0.124, 0.17, 0.1, 0.175, 0.1, 0.15, 0.1]';
iters = 5000;
[x,y] = applymap(x,y,iters);
axis([0.53,0.63,0.1,0.2]);
eps = 0.005;
% find all the points in the map within eps of the starting point
pts = (abs(x(:,2:end) - x(:,1)) < eps & abs(y(:,2:end) - y(:,1)) < eps)';
% find the first occurrence of a new point close to the original point
[_, index] = max(pts);
% starting points 1, 2, 5, and 6 are our resonant island trajectories (by inspection)
periods = index'([1,2,5,6])
% we find that periods = 140, 71, 265, and 81
