function x = gauss(A, b)
% rezolva iterativ sistemul A*x = b prin metoda Gauss-Seidel
D = diag(diag(A));
L = -tril(A,-1);
U = -triu(A,1);
%D=A+L+U

M = D - L;

T = M\U;
c = M\b;

x0 = b;
x1 = T*x0 + c;
for i=1:10000
    x0 = x1;
    x1 = T*x0 + c;
    if (norm(x1-x0)<=((1-norm(T)) * 1e-4)/norm(T)) % criteriu oprire
        break;
    end
    x1 = x0;
end
x = x0;
end

