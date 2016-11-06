step = 0.05;
x = [-1:step:1];
y = rand(size(x)) * 2 - 1;
iters = 600;
colors = rand(size(x,2),1,3);
[x,y] = applymap(x, y, iters);
