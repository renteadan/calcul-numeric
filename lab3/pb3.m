
a();
b();

function a()
fprintf("A).\n");
for n = 10:15
    k = 1:n;
    t = -1 + 2 * k/n;
    v = vander(t);
    norm = cond(v, 1);
    chebysev = cond(v, Inf);
    fprintf("\nConditionarea: %d\nNorma Chebyshev : %d\nRaport norme: %d\n", norm, chebysev, norm/chebysev);
end
end

function b()
fprintf("B).\n");
for n = 10:15
    k = 1:n;
    u=ones(1, n);
    t = u./k;
    v = vander(t);
    norm = cond(v, 1);
    chebysev = cond(v, Inf);
    fprintf("\nConditionarea: %d\nNorma Chebyshev : %d\nRaport norme: %d\n", norm, chebysev, norm/chebysev);
end
end