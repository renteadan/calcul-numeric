% c) Rezolvati integralele folosind Gauss-Jacobi (enunt)
% Ponderea este 1
% Rezolvam Integrala Ic

a = 0; b = 1; n = 5; err = 10.^-7; NMAX = 100;
fc = @(x) cos(x)./sqrt(x);

Icp = computeGaussJacobi(fc,a,b,n-1);
Ic = computeGaussJacobi(fc,a,b,n);

while abs(Ic - Icp) > err && n < NMAX
    n = n+1;
    Icp = Ic;
    Ic = computeGaussJacobi(fc,a,b,n);
end

expected_Ic = integral(fc,a,b)
Ic, n

% Rezolvam integrala Is
n=5;
fs = @(x) sin(x) ./ sqrt(x);

Isp = computeGaussJacobi(fs,a,b,n-1);
Is = computeGaussJacobi(fs,a,b,n);

while abs(Is - Isp) > err && n < NMAX
    n = n+1;
    Isp = Is;
    Is = computeGaussJacobi(fs,a,b,n);
end

expected_Is = integral(fs,a,b)
Is, n

function result = computeGaussJacobi(f,a,b,n)
    [g_nodes,g_coeff]=Gauss_Jacobi(n,a,b);
    result = (b-a)/2*g_coeff*f((b-a)/2*g_nodes+(b+a)/2);
end