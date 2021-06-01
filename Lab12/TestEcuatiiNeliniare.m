% Problema 1 Newton
f = @(x) 2*x.*besselj(1,x)-besselj(0,x);
fd = @(x) 2*besselj(0, x).*x + besselj(1, x);
err = 1e-7;
nmax = 150;
fplot(f,[0,18]);
grid on
x1 = [1.4 3 7];
for k=1:length(x1)
 [z(k),ni(k)] = Newton(f,fd,x1(k),err,0,nmax);
end
disp("Rezultatele Problemei 1 folosind metoda Newton");
z, ni

% Problema 1 Secant
x2 = [2 4 8];
for k=1:length(x1)
 [z(k),ni(k)] = Secant(f,x1(k),x2(k),err,nmax);
end
disp("Rezultatele Problemei 1 folosind metoda Secantei");
z, ni

% Problema 2
ea=1e-6; er=1e-6; nmax=300;
% Solutia ecuatiei calculata cu Maple x0=[32/3 ln(3/2) -6]
%functia
f=@(x)[x(1)*exp(x(2))+x(3) - 10; ...
x(1)*exp(2*x(2))+2*x(3) - 12; ...
x(1)*exp(3*x(2))+3*x(3) - 18];
%jacobianul
fd=@(x)[exp(x(2)), x(1)*exp(x(2)),1;...
exp(2*x(2)), 2*x(1)*exp(2*x(2)),2;...
exp(3*x(2)), 3*x(1)*exp(3*x(2)),3];
x0=[10,0.4,-5];
disp("Rezultatele Problemei 2 folosind metoda Newton");
[z,ni]=Newton(f,fd,x0,ea,er,50)