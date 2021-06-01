% Aproximati integrala cu 9 zecimale exacte folosind o cuadratura Gauss-Jacobi (enunt)
%  Ponderea este 1
n=4; a=0; b=pi/2; err = 1/10^10; NMAX = 100;
f = @(x) 1./sqrt(sin(x));

I6p = computeGaussJacobi(f,a,b,n-1);
I6  =  computeGaussJacobi(f,a,b,n);

while abs(I6 - I6p) > err && n < NMAX
   n   = n+1;
   I6p = I6;
   I6  = computeGaussJacobi(f,a,b,n);
end

I6, n
expected_I6 = integral(f,a,b)

% subrutina
function result = computeGaussJacobi(f,a,b,n)
    [g_nodes,g_coeff]=Gauss_Jacobi(n,a,b);
    result = (b-a)/2*g_coeff*f((b-a)/2*g_nodes+(b+a)/2);
end