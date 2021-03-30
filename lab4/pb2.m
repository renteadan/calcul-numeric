function y=pb2(A, b)
[L,U,~]=LUP(A);
y=forwardsubst(L,b);
y=backsubst(U,y);
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

function [L,U,P]=LUP(A)
[m,n]=size(A);
P=zeros(m,n);
piv=(1:m)';
for i=1:m-1
    %pivoting
    [~,kp]=max(abs(A(i:m,i)));
    kp=kp+i-1;
    %line interchange
    if i~=kp
        A([i,kp],:)=A([kp,i],:);
        piv([i,kp])=piv([kp,i]);
    end
    %Schur complement
    lin=i+1:m;
    A(lin,i)=A(lin,i)/A(i,i);
    A(lin,lin)=A(lin,lin)-A(lin,i)*A(i,lin);
end
for i=1:m
    P(i,piv(i))=1;
end
U=triu(A);
L=tril(A,-1)+eye(m);
end

