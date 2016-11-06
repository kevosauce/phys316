step = 0.1;
x0 = [-1:step:1];
y0 = [-1:step:1];
pts = size(x0,2);
iters = 600;

x = zeros(pts,pts);
for i=1:pts
   x(1:pts, i) = x0;
end
y = x.';

applymap(x, y, iters);

