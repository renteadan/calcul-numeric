f = @(x) cos(x) - x;
x1   = [0.5 0.4];
x2   = [pi/4 pi/5];
err  = eps;
nmax = 100;

Secant(f,x1,x2,err,nmax)