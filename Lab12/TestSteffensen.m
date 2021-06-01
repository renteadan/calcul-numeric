% f(x) = x^3 + 4x^2 - 10 = 0;
% From f(x) build g(x). g(x) = x; 
% Move 10 to the right. Give x^2 common factor. Multiply with 1/(x+4). 
% .^(1/2) the whole equation.
g    = @(x) sqrt(10/(x+4));
p0   = 1.5;
err  = 0.0001;
nmax = 100;

Steffensen(g,p0,err,nmax)