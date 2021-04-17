x=1.3;
resL = interpolareLagrangeBaricentrica([1 1.5 2], [exp(1) exp(1.5) exp(2)], x);
resExp = exp(x);
fprintf("valore interpolare lagrange: %d\nvaloare exponentiala: %d\n", resL, resExp);

function [ val ] = interpolareLagrangeBaricentrica( nodes, nodevals, x )
    [~,col] = size(nodes);
    m = col;

    w = zeros(1, m);
    for j = 1 : m
        p = 1;
        for i = 1 : m
            if i ~= j
               p = p * (nodes(1, j) - nodes(1, i));
            end
        end
        w(1, j) = 1 / p;
    end

    u = 0; d = 0;
    for j = 1 : m
        u = u + (nodevals(1, j) * w(1, j)) / (x - nodes(1, j));
        d = d + w(1, j) / (x - nodes(1, j));
    end
    val = u / d;
end