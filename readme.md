## Phys 316, HW6, Kevin Ullmann
## 3.

I chose to write the code using Octave (very similar to MATLAB, but open source 😄) and split the problem into five files. There are five scripts, `henonmap.m, findhops.m, henonmapB.m, henonmapC.m`, and `henonStochastic.m`, and they use a common function defined in `applymap.m` which generates the map.

The common function, defined in `applymap.m` is here:

```MATLAB
function [x,y] = applymap(x,y, iters)
alpha = 0.2114;
tau = 2*pi*alpha;
for i=1:iters
   x(:,i+1) = x(:,i) * cos(tau) - (y(:,i) - x(:,i).^2) * sin(tau);
   y(:,i+1) = x(:,i) * sin(tau) + (y(:,i) - x(:,i).^2) * cos(tau);
   % filter out points that have wandered off
   x(x > 1 | x < -1 | y > 1 | y < -1) = 0;
   y(x > 1 | x < -1 | y > 1 | y < -1) = 0;
end
   
plot(x',y','.')

end
```

The function simply appends columns to `x` and `y` with the new points and plots the result.

### 3a
The script, `henonmap.m`, to produce the graph for part A is quite straightforward once we have the `applymap` function defined above:

```MATLAB
step = 0.05;
x = [-1:step:1]';
y = rand(size(x)) * 2 - 1;
iters = 600;
[x,y] = applymap(x, y, iters);
```

The script takes a set of points `(x,y)` evenly spaced on the `x` axis with random `y` values between `[-1,1]` applies the map `iters` times, and plots the result. It produces lovely images like the following:

![screen shot 2016-11-05 at 19 09 46](https://cloud.githubusercontent.com/assets/214996/20768464/bd94aa4c-b703-11e6-8239-ebf6d9260533.png)

`findhops.m` is a very simple script used to illustrate the trajectory of a single point around each of the five resonant islands. For clarity I've shown three different points, each starting near the bottom island. You can see that the trajectories visit each island in turn, in only 5 iterations.

```MATLAB
x = [0,0,0]';
y = [-0.7,-0.6,-0.5]';
iters = 5;
[x,y]=applymap(x,y,iters);
```

![island hopping](https://cloud.githubusercontent.com/assets/214996/20779846/b728efae-b73c-11e6-9a8a-e202cfdc7dc1.png)

(note: `applymap` was slightly altered for this part to draw lines instead of dots along the trajectories. The only change was the line `plot(x',y','.')` was replaced by `plot(x',y')`)

### 3b
Part B again makes use of `applymap` and here is the code:

```MATLAB
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
% starting points 1, 2, 5, and 6 are our resonant island trajectories (found by inspection)
periods = index'([1,2,5,6])
% we find that periods = 140, 71, 265, and 81
```

This script takes the given set of starting points, applies the map 5000 times, finds the points in the map that returned close to thier starting points, and outputs the periods:

`[140, 71, 265, 81]`

It also produces images like the following, where you can clearly see the resonant islands:

![5000 iters eps 0 005](https://cloud.githubusercontent.com/assets/214996/20768506/ecbfbe6a-b703-11e6-9054-a1f336e5d2da.png)

Another script `henonStochastic.m` plots the trajectory of another starting point through the map. Here is that code:

```MATLAB
x = [0.63];
y = [0.165];
iters = 50000;
[x,y] = applymap(x,y,iters);
```

The starting point, `(0.63, 0.165)` was found by trial and error. Here is the plot of this trajectory:

![stochastic pt 0 63 0 165](https://cloud.githubusercontent.com/assets/214996/20768640/4ae0550e-b704-11e6-8a50-bd6422c74e9a.png)

### 3c

The script for part c is also fairly straightforward. We set up 5000 points on the unstable manifold and use `applymap` to follow their trajectories

```MATLAB
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
```

Here are some of the trajectories with different parameters. Note that you can clearly see the oscillating behavior of the homoclinic tangle.

![n 500 iters 150](https://cloud.githubusercontent.com/assets/214996/20768566/0b1b8a1a-b704-11e6-932b-d54527d20d05.png)

![n 500 iters 200](https://cloud.githubusercontent.com/assets/214996/20768620/2db7a036-b704-11e6-89c2-6304706472fb.png)

![n 5000 iters 150](https://cloud.githubusercontent.com/assets/214996/20768624/33184594-b704-11e6-9fef-3ff7f2d608ff.png)

You can find all of the source code, as well as additional images produced (and this write up) at https://github.com/kevosauce/phys316
