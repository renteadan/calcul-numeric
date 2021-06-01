% b) Rezolvati integralele utilizand o cuadratura Gauss-Legendre, dupa ce
% s-a efectuat schimbarea de variabila x=t^2;
 
% fc(x) = cos(x)/sqrt(x). t^2 = x; 2*t dt = dx; 
% fc(t) = cos(t^2)*t/t <=> fc(t) = 2*cos(t^2);
a = 0; b = 1; n = 5; NMAX = 100;
fc_initial = @(x) cos(x)./sqrt(x);
fc = @(x) cos(x.^2); % constanta 2 iese in fata;

Icp = Gauss_Legendre_ab(fc,n-1,a,b);
Ic = Gauss_Legendre_ab(fc,n,a,b);

while abs(Ic - Icp) > err && n < NMAX
    n = n+1;
    Icp = Ic;
    Ic = Gauss_Legendre_ab(fc,n,a,b);
end
% Inmultim constanta pe care am scos-o in fata integralei
Ic = 2*Ic;

expected_Ic = integral(fc_initial,a,b)
Ic, n

% fs(x) = sin(x)/sqrt(x); t^2 = x; 2*t dt = dx;
% fs(t) = 2*sin(t^2)*t/t <=> fs(t) = 2*sin(t^2);
n = 5;
fs_initial = @(x) sin(x) ./ sqrt(x);
fs = @(x) sin(x.^2); % constanta 2 iese in fata;

Isp = Gauss_Legendre_ab(fs,n-1,a,b);
Is = Gauss_Legendre_ab(fs,n,a,b);

while abs(Is - Isp) > err && n < NMAX
    n = n+1;
    Isp = Is;
    Is = Gauss_Legendre_ab(fs,n,a,b);
end
% Inmultim constanta pe care am scos-o in fata integralei
Is = 2*Is;

expected_Is = integral(fs_initial,a,b)
Is, n
