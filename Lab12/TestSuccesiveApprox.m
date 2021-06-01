% P1
f = @(x) [x(1)^2+x(2)^2-1; x(1)^3-x(2)];
df = @(x) [2*x(1), 2*x(2); 3*x(1)^2, -1];

x0=[1;1]; err=1e-8; nmax=20;
[z,ni]=SuccesiveApprox(f,df,x0,err,nmax)