nodes = [1, 1.8, 2.2];
nodevals = exp(nodes);

t = 1 : 0.01 : 3;
res = interpolareLagrangeMultiplePoints(nodes, nodevals, t);

plot(t, res, 'color', rand(1,3));
hold on;

resexp = exp(t);
plot(t, resexp, 'color', rand(1,3));
hold off;