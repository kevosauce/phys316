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

