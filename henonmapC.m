clf
xfp = 0.5689367002134077;
yfp = 0.161844484385035;
n = 50;
t = linspace(0,0.02,n)';
xs = t + xfp;
ys = yfp - 0.785*t;
hold on
iters = 180;
title(['n=' n ' iters=' iters]);
[xs,ys] = applymap(xs,ys,iters);
axis([xfp-0.02,xfp+0.02,yfp-0.02,yfp+0.02]);
hold off
