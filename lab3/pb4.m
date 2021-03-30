conditionarePolinom1(14, 20);
conditionarePolinom2(14, 20);

a = 10^(-10);
b = 0;
y = a.*randn(20,1) + b;

conditionarePolinom1(2, 20)
perturbarePolinom1(2, 20, y)

function c = conditionarePolinom1( x, n )
    a = poly(1 : n); % an an-1 an-2 .. a1 a0
    a = a(2 : end); % an-1 an-2 ... a0
    a = fliplr(a); % a0 a1 ... an-1

    sum = 0; % suma de forma : |a0| + |e|*|a1| + |e^2|*|a2| + .. + |e^(n-1)| * |an-1|
    for i = 0 : n - 1 % indexarea in matlab de la 1 deci a(i+1) = ai
       sum = sum + abs(a(i + 1)) * abs(x)^i; 
    end

    % calculam p'(e)
    p = 1; % derivata se anuleaza cu exceptia produsului in care (x - e) e derivata
    for i = 1:n
        if i ~= x
            p = p * (x - i);
        end
    end

    c = sum / abs(x * p);
end

function c = conditionarePolinom2( e, n )
    a = zeros(n , 1); % coeficientii
    for i = 1:n
        a(i) = 1 / 2^i;
    end
    a = fliplr(a);

    sum = 0; % suma de forma : |a0| + |e|*|a1| + |e^2|*|a2| + .. + |e^(n-1)| * |an-1|
    for i = 0 : n - 1 % indexarea in matlab de la 1 deci a(i+1) = ai
       sum = sum + abs(a(i + 1)) * abs(e)^i; 
    end

    % calculam p'(e)
    p = 0;
    for i = n : -1 : 1
        p = p + (i * e^(i - 1)) / 2^(n - i); 
    end

    c = sum / abs(e * p);
end

function c = perturbarePolinom1( e, n, perturb )
    a = poly(1 : n); % an an-1 an-2 .. a1 a0
    a = a(2 : end); % an-1 an-2 ... a0
    a = fliplr(a); % a0 a1 ... an-1

    for i = 1 : n
        a(i) = a(i) + perturb(i);
    end

    sum = 0; % suma de forma : |a0| + |e|*|a1| + |e^2|*|a2| + .. + |e^(n-1)| * |an-1|
    for i = 0 : n - 1 % indexarea in matlab de la 1 deci a(i+1) = ai
       sum = sum + abs(a(i + 1)) * abs(e)^i; 
    end

    % calculam p'(e)
    p = 1; % derivata se anuleaza cu exceptia produsului in care (x - e) e derivata
    for i = 1:n
        if i ~= e
            p = p * (e - i);
        end
    end

    c = sum / abs(e * p);
end