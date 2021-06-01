% Alegem Chebisev 2 (Polinoamele se aleg in functie de interval si pondere)

a = -1; b = 1; % intervalul pe care e definit integrala
n = 10;        % gradul polinomului(dat in cerinta)   

% functiile
f  = @(x) exp(-x.^2);
gf = @(x) sqrt(1-x.^2).*exp(-x.^2);

% nodurile si coeficientii polinomului
[g_nodes,g_coeff] = Gauss_Cheb2(n);

expected_I3 = integral(gf,a,b)
I3 = vquad(g_nodes,g_coeff,f)
error_I3 = abs(expected_I3-I3)