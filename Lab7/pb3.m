
x = 0:0.1:1;
n = length(x);
res=[];
for i = 1:n
    res(i) = cubic(i, 0.5, 1, 0.3 ,0.7);
end

hold on;
plot(res, x);
hold off;