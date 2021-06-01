% Alegem Hermite(Polinoamele se aleg in functie de interval si pondere)
a = -Inf; b = Inf; NMAX = 100; err = 10^-7;
n = 5;

% functiile
f  = @(x) sin(x);
gf = @(x) exp(-x.^2).*sin(x);

I5ap = computeGaussHermite(f,a,b,n-1);
I5a  = computeGaussHermite(f,a,b,n);

while abs(I5a - I5ap) > err && n < NMAX
    n = n+1;
    I5ap = I5a;
    I5a = computeGaussHermite(f,a,b,n);
end

expected_I5a = integral(gf,a,b)
I5a, n

% functiile
n = 5;
f  = @(x) cos(x);
gf = @(x) exp(-x.^2).*cos(x);

I5bp = computeGaussHermite(f,a,b,n-1);
I5b  = computeGaussHermite(f,a,b,n);

while abs(I5b - I5bp) > err && n < NMAX
    n = n+1;
    I5bp = I5b;
    I5b = computeGaussHermite(f,a,b,n);
end

expected_I5b = integral(gf,a,b)
I5b, n

% subrutina
function result = computeGaussHermite(f,a,b,n)
    [g_nodes,g_coeff]=Gauss_Hermite(n);
    result = vquad(g_nodes,g_coeff,f);
end