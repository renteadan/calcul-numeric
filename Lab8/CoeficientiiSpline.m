function [ a, b, c, d ] = CoeficientiiSpline( x, y, der, type )
%CUBIC_SPLINE - calculates the cubic spline coefficients
% (x, y) pairs - f(x) = y
% der - points chosen for derrivative

if (nargin<4) || (type==2), der=[0,0]; end %natural spline

n = length(x); % number of points given

[x, ind] = sort(x); % input should be sorted
% rearrange input
y = y(ind);
x = x(:); y = y(:);

% diferentele divizate
dx=diff(x);  
ddiv=diff(y)./dx;
ds=dx(1:end-1);
dd=dx(2:end);
dp=2*(ds+dd);
md=3*(dd.*ddiv(1:end-1)+ds.*ddiv(2:end));

switch type
case 0 %complete
    dp1=1; dpn=1; vd1=0; vdn=0;
    md1=der(1); mdn=der(2);
case {1,2}
    dp1=2; dpn=2; vd1=1; vdn=1;
    md1=3*ddiv(1)-0.5*dx(1)*der(1);
    mdn=3*ddiv(end)+0.5*dx(end)*der(2);
case 3 %deBoor
    x31=x(3)-x(1);xn=x(n)-x(n-2);
    dp1=dx(2); dpn=dx(end-1);
    vd1=x31;
    vdn=xn;
    md1=((dx(1)+2*x31)*dx(2)*ddiv(1)+dx(1)^2*ddiv(2))/x31;
    mdn=(dx(end)^2*ddiv(end-1)+(2*xn+dx(end))*dx(end-1)*ddiv(end))/xn;
end

dp=[dp1;dp;dpn];
dp1=[0;vd1;dd];
dm1=[ds;vdn;0];
md=[md1;md;mdn];
A=spdiags([dm1,dp,dp1],-1:1,n,n);
m=A\md;
d=y(1:end-1);
c=m(1:end-1);
a=(m(2:end)+m(1:end-1)-2*ddiv)./(dx.^2);
b=(ddiv-m(1:end-1))./dx-dx.*a;

end