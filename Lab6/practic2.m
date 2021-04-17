
res = interpolareLagrange([1 1.1 1.2 1.3 1.4], [f(1) f(1.1) f(1.2) f(1.3) f(1.4)], 1.25);
fprintf("aproximare: %d\nval reala: %d\n", res, f(1.25));

function y = f(x)
    y = exp(x^2-1);
end

