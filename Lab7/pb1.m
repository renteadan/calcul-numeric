x = 0.5;
x1 = [-1 0 1];
f = [0 1 2]; % f(x) = x + 1
f1 = [1 1 1];
rez = hermite(x, x1, f, f1);
display(rez);