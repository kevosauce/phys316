x = [0.568, 0.593, 0.536, 0.61, 0.55, 0.594, 0.56];
y = [0.124, 0.17, 0.1, 0.175, 0.1, 0.15, 0.1];
iters = 5000;
colors = ['k' 'r' 'g' 'b' 'c' 'y' 'm'];
[x,y] = applymap(x,y,iters,colors);
axis([0.53,0.63,0.1,0.2]);
[per, index] = max(abs(x(2:end,2) - 0.593) < 0.01 & abs(y(2:end,2) - 0.17) < 0.01)
