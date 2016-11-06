clf
xfp = 0.5689367002134077;
yfp = 0.161844484385035;
%xfp = 0.56893;
%yfp = 0.16184;
n = 50;
t = linspace(0,0.2,n)';
xs = t + xfp;
ys = yfp - 0.785*t;
hold on
plot(xs,ys,'-r','linewidth',40);
iters = 100;
applymap(xs,ys,iters);
%axis([xfp,xfp+0.2,yfp-0.758*0.2,yfp]);
hold off
