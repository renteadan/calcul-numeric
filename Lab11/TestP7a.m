% a) Rez. integralele cu o precizie data folosind o cuadratra adaptiva
% Folosim Gauss-Legendre
% Rezolvam integrala Ic
a = 0; b = 1; n = 5; err = 10.^-7; NMAX = 100;
fc = @(x) cos(x)./sqrt(x);

Icp = Gauss_Legendre_ab(fc,n-1,a,b);
Ic = Gauss_Legendre_ab(fc,n,a,b);

while abs(Ic - Icp) > err && n < NMAX
    n = n+1;
    Icp = Ic;
    Ic = Gauss_Legendre_ab(fc,n,a,b);
end

expected_Ic = integral(fc,a,b)
Ic, n

% Rezolvam integrala Is
n=5;
fs = @(x) sin(x) ./ sqrt(x);

Isp = Gauss_Legendre_ab(fs,n-1,a,b);
Is = Gauss_Legendre_ab(fs,n,a,b);

while abs(Is - Isp) > err && n < NMAX
    n = n+1;
    Isp = Is;
    Is = Gauss_Legendre_ab(fs,n,a,b);
end

expected_Is = integral(fs,a,b)
Is, n
