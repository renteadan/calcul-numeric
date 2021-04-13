function x0=pb2(A,b)

D = diag(diag(A)); % creeaza o matrice diagonala din diagonala lui A
L = -tril(A,-1);
U = -triu(A,1);
%D=A+L+U

p=max(abs(eig(D\(L+U)))); % raza spectrala
omega = 2 / (1+sqrt(1-p^2));

M = D-omega*L;
x0=b;
T = M\((1-omega)*D+omega*U);
c = omega\(M*b);
for i=1:10000
    x1 = T*x0 + c;
    if (norm(x1-x0)<=((1-norm(T)) * 1e-4)/norm(T)) % criteriu oprire
        break;
    end
    x0 = x1;
end
end