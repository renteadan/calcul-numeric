% Tratam valorile i0 R si t0 ca pe niste constante. Inlocuim in in
% integrala. Constantele ies in fata. si facem schimbare de variabila
% u = 2t/t0. Expresia devine R*i_0^2*t_0/2(const)* int e^-u*sin^2u du.
% Pentru a aproxima integrala folosim o cuadratura Gauss-Laguerre
% R*i0^2*t0/2 valoarea constanta iese in fata
f = @(x) sin(x).*sin(x);
a  = 0; b = Inf; n = 5; NMAX = 100;
i0 = 100; R = 0.5; t0 = 0.01;
gf  = @(t) R*(i0.*exp(-t/t0).*sin(2.*t/t0)).^2;

I4p = computeGaussLaguerre(f,a,n-1);
I4  = computeGaussLaguerre(f,a,n);

while abs(I4-I4p) > err && n < NMAX
    n = n+1;
    I4p = I4;
    I4  = computeGaussLaguerre(f,a,n);
end
% Inmultim aproximatia cu valoarea constanta
I4 = R*i0^2*t0/2*I4;

expected_I4 = integral(gf,a,b)
I4, n

%subrutina 
function result = computeGaussLaguerre(f,a,n)
   [g_nodes,g_coeff]=Gauss_Laguerre(n,a);
   result = vquad(g_nodes,g_coeff,f);
end