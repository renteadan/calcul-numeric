
A=diag(ones(1,10)*5)-diag(ones(1, 9),-1)-diag(ones(1,9),1);
b=[4;ones(8,1)*3;4];

sol1 = pb1(A, b);
sol2 = pb2(A, b);
disp('Matrix 1');
disp(sol1);
disp(sol2);

[A,b] = s2(10);
sol1 = pb1(A, b);
sol2 = pb2(A, b);

disp('Matrix 2');
disp(sol1);
disp(sol2);

function [A, b]=s2(n)
A=diag(ones(1,10)*5)-diag(ones(1, 9),-1)-diag(ones(1,9),1);
for i=3:5
    if mod(i,2)~=0
        ds=zeros(n-i+1,1);
        A=A+diag(ds,i-1);
        A=A+diag(ds,-i+1);
    else
        ds=-ones(n-i+1,1);
        A=A+diag(ds,i-1);
        A=A+diag(ds,-i+1);
    end
end
b=ones(n,1);
b(1)=3;
b(2)=2;
b(3)=2;
b(n-2)=2;
b(n-1)=2;
b(n)=3;
end