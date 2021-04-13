function x0=pb1(A,b)
D = diag(diag(A)); % creeaza o matrice diagonala din diagonala lui A
L = -tril(A,-1);
U = -triu(A,1);
%D=A+L+U

M = D;
N = L+U; % A=D-L-U si M = D => M-A=D-D+L+U=L+U=N

x0=b;
T = M\N;
c = M\b;
for i=1:10000
    x1 = T*x0 + c;
    if (norm(x1-x0)<=((1-norm(T)) * 1e-4)/norm(T)) % criteriu oprire
        break;
    end
    x0 = x1;
end
end