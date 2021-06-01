% P2 Newton
f = @(x) [9*x(1)^2+36*x(2)^2+4*x(3)^2-36; x(1)^2-2*x(2)^2-20*x(3); x(1)^2-x(2)^2+x(3)^2];

df = @(x) [
    18*x(1)+36*x(2)^2+4*x(3)^2, 9*x(1)^2+72*x(2)+4*x(3)^2, 9*x(1)^2+36*x(2)^2+8*x(3);
    2*x(1)-2*x(2)^2-20*x(3), x(1)^2-4*x(2)-20*x(3), x(1)^2-2*x(2)^2-20;
     2*x(1)-x(2)^2+x(3)^2,  x(1)^2-2*x(2)+x(3)^2,  x(1)^2-x(2)^2+2*x(3)
];

x0=[1;1;0]; ea=1e-8; er=0; nmax=200;
[z,ni]=Newton(f,df,x0,ea,er,nmax)
 
x0=[-1,-1,0];
[z2,ni2]=Newton(f,df,x0,ea,er,nmax)
 
x0=[0.5,0.5,0];
[z3,ni3]=Newton(f,df,x0,ea,er,nmax)