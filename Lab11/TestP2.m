% Alegem Chebisev 1 (Polinoamele se aleg in functie de interval si pondere)

a = -1; b = 1; % intervalul pe care e definit integrala
n = 10;        % gradul polinomului(dat in cerinta)   

% f(x_k)
f = @(x) x.*exp(-x.^2);
% g(x)*f(x)
gf = @(x) x.*exp(-x.^2)./sqrt(1-x.^2);

% nodurile si coeficientii polinomului
[g_nodes,g_coeff] = Gauss_Cheb1(n);

expected_I2 = integral(gf,a,b)
I2  = vquad(g_nodes,g_coeff,f)