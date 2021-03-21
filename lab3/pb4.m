clc
format long
r = 1:20;
% construieste radacinile polinomului cu n = 20
c = poly(r); % polinomul cu radacinile r
r1 = roots(c); %radacinile polinomului c
% normrnd - genereaza un vector
c2 = c + normrnd(0, 1e-10, 1, length(c))
r2 = roots(c2) 
nc = norm(r2-r')/norm(c2-c)% nr de cond