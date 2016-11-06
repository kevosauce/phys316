function henonmap(x,y,iters)
   for i=1:iters
      x(:,:,i+1) = x(:,:,i) * cos(tau) - (y(:,:,i) - x(:,:,i).^2) * sin(tau);
      y(:,:,i+1) = x(:,:,i) * sin(tau) + (y(:,:,i) - x(:,:,i).^2) * cos(tau);
   % filter out points that have wandered off
      x(x > 1 | x < -1 | y > 1 | y < -1) = 0;
      y(x > 1 | x < -1 | y > 1 | y < -1) = 0;
   end
   
clf
hold on
for i=1:pts
   color = rand(1,3);
   plot(x(i,i,:),y(i,i,:),'.', 'color', colors(color))
end
hold off
end
