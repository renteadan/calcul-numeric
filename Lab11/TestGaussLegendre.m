f = @(x) sin(x.^2);
a = 0; b = 1; n=10;
Gauss_Legendre_ab(f,n,a,b)
quad(f,a,b)

[g_nodes,g_coeff]=Gauss_Legendre(n);
vquad(g_nodes,g_coeff,f)