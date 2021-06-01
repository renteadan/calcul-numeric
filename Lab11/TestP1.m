NMAX = 200;                         
err  = 1/10^9;                      
f    = @(x) log(x)./(x.^2-2.*x+2);  
n    = 5;                           

I1p = Gauss_Legendre_ab(f,n-1,1,pi);
I1  = Gauss_Legendre_ab(f,n,1,pi);

while abs(I1 - I1p) > err && n < NMAX
   n   = n+1;
   I1p = I1;
   I1  = Gauss_Legendre_ab(f,n,1,pi);
end

expected_I1 = integral(f,1,pi)
I1, n