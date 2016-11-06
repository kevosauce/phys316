step = 0.05;
x = [-1:step:1]';
y = rand(size(x)) * 2 - 1;
iters = 600;
[x,y] = applymap(x, y, iters);
