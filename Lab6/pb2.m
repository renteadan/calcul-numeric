nodes = [1 1.3 1.6 1.8];
m = 4;

labels = {};
for k = 1 : m
    t = 1 : 0.01 : 2;
    p = evaluarePolinomFundamentalMultiplePoints(nodes, k, t);
    labels = [labels num2str(k)];
    plot(t, p, 'color', rand(1,3))
    hold on;
end
legend(labels);
hold off;

function [val] = evaluarePolinomFundamentalMultiplePoints(nodes, k, x)
    val = zeros(size(x));
    [~, c] = size(x);
    for i = 1 : c 
       val(1, i) = evaluarePolinomFundamental(nodes, k, x(1, i)); 
    end
end

function [val] = evaluarePolinomFundamental(nodes, k, x)
    % evalueaza valoarea polinomului fundamental
    [~, m] = size(nodes);
    u = 1; d = 1;
    for j = 1 : m
       if j ~= k
          u = u * (x - nodes(1, j));
          d = d * (nodes(1, k) - nodes(1, j));
       end
    end
    val = u / d;
end