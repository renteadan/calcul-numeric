% P1
f = @(x) [x(1)^2+x(2)^2-1; x(1)^3-x(2)];
df = @(x) [2*x(1), 2*x(2); 3*x(1)^2, -1];

x0=[1;1]; ea=1e-8; er=0; nmax=20;
[z,ni]=Newton(f,df,x0,ea,er,nmax)

x0=[-1,-1];
[z2,ni2]=Newton(f,df,x0,ea,er,nmax)