%problema 4 practica
disp('problema 4')
disp('a')

nodes = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
nodevals = f(nodes);
disp(nodevals)

t = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
res = interpolareLagrangeMultiplePoints(nodes, nodevals, t);

plot(t, resexp, 'color', rand(1,3));;
hold on;

resexp = 1/(1+t*t);
plot(t, resexp, 'color', rand(1,3));;
hold off;

disp('b')
disp('problema 4')
nodes = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
nodevals = abs(nodes);
disp(nodevals)

t = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
res = interpolareLagrangeMultiplePoints(nodes, nodevals, t);

plot(t, resexp, 'color', rand(1,3));;
hold on;

resexp = abs(t);
plot(t, resexp, 'color', rand(1,3));;
hold off;

function y = f(x)
    y=1/(1+x^2);
end