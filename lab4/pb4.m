
[A, B] = generateCholesky(3);
x = solveCholesky(A, B);
disp(x);

function [A, B] = generateCholesky(n)
    A = rand(n);
    A = A + A.';
    A = A + eye(n) * n;
    B = A * ones(n, 1);
end

function R = descompunereCholesky( A )

    [m, ~] = size(A);
    for k = 1 : m
       if A(k, k) <= 0
           error('matricea nu e pozitiv definita')
       end
       for j = k + 1 : m
            A(j, j:m) = A(j, j:m) - A(k, j:m) * A(k, j) / A(k, k);
       end
       A(k, k:m) = A(k, k:m)/sqrt(A(k, k));
    end
    R = triu(A);
end

function x = solveCholesky(A, B)
    R = descompunereCholesky(A);
    y = forwardsubst(R.', B);
    x = backsubst(R, y);
end

function x=backsubst(A,B)
%BACKSUBST - rezolvare sistem prin substitutie inversa
%U - matrice triunghiulara superior
%b - vectorul termenilor liberi

n=length(B);
x=zeros(size(B));
for k=n:-1:1
    x(k)=(B(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
end

function x=forwardsubst(A,B)
%FORWARDSUBST - substitutie directa
%L - matrice triunghiulara inferior
%b -vectorul termenilor liberi

x=zeros(size(B));
n=length(B);
for k=1:n
    x(k)=(B(k)-A(k,1:k-1)*x(1:k-1))/A(k,k);
end
end