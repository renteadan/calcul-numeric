nodes = [0.9 1.3 1.9 2.1 2.6 3 3.9 4.4 4.7 5 6 7 8 9.2 10.5 11.3 11.6 12 12.6 13 13.3];
nodevals = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 0.7 0.6 0.5 0.4 0.25];
points = 0.9:0.1:13.3;

res = interpolareLagrangeMultiplePoints(nodes, nodevals, points);
res2 = spline(nodes, nodevals, points);

plot(points, res2, 'color', rand(1,3));
ylim([0 3]);
xlim([0 14]);

function [vals] = interpolareLagrangeMultiplePoints(nodes, nodevals, points)
    vals = zeros(size(points));
    [~, col] = size(points);
    for i = 1 : col
       vals(1, i) = interpolareLagrange(nodes, nodevals, points(1, i)); 
    end
end

function val = interpolareLagrange( nodes, nodevals, point )
% aproximeaza punctul dat prin interpolare Lagrange
val = 0;

[~, col] = size(nodes);
m = col;
x = point;

for k = 1 : m
   f = nodevals(1, k); % f(xk) 
   
   % calculam lk(x)
   u = 1; d = 1;
   for j = 1 : m
      if j ~= k
          u = u * (x - nodes(1, j)); % x - xj
          d = d * (nodes(1, k) - nodes(1, j)); % xk - xj
      end
   end
   val = val + f * (u / d);
end

end