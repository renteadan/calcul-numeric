function x=pb1(A, b)
n=length(A);
x=zeros(n,1);
A= [A b];
for i=1:n-1
    %gaseste p
    p=i;
    while p~=n+1
        if (A(p,i)~=0 && abs(A(p,i)) == max(abs(A(i:n,i))))
            break;
        end
        p = p + 1;
    end
    if (p == n+1)
        disp('Nu exista solutie unica');
        return;
    end
    if(p~=i)
        A([i,p], :) = A([p,i], :);
    end
    for j=i+1:n
        A(j,:) = A(j,:) - A(j,i)/A(i,i)*A(i,:);
    end
end
if (A(n,n) == 0)
    disp('Nu exista solutie unica');
    return;
end
x(n) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
    x(i)=(A(i,n+1) - A(i,i+1:n)*x(i+1:n))/A(i,i);
end
end