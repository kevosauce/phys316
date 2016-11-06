x = [0.568, 0.593, 0.536, 0.61, 0.55, 0.594, 0.56]';
y = [0.124, 0.17, 0.1, 0.175, 0.1, 0.15, 0.1]';
iters = 5000;
[x,y] = applymap(x,y,iters);
axis([0.53,0.63,0.1,0.2]);
eps = 0.005;
%find the first occurrence of a new point close to the original point
[per, index] = max(abs(x(2:end,:) - x(1,:)) < eps & abs(y(2:end,:) - y(1,:)) < eps);
% starting points 1, 2, 5, and 6 are our resonant island trajectories (by inspection)
cycles = index([1,2,5,6])

