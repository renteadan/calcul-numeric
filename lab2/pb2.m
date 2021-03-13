%calculul lui cos de x folosind  seria Taylor

fprintf('Cos\n');
cosOut();
fprintf('---------------------------------\nSin\n');
sinOut();


function cosOut
    %pentru k=10
    fprintf('Rezultat pentru 0*pi : %d\n', taylorCos(0*pi, 10^-5));
    fprintf('Rezultat pentru 2*pi : %d\n', taylorCos(2*pi, 10^-5));
    fprintf('Rezultat pentru 4*pi : %d\n', taylorCos(4*pi, 10^-5));
    fprintf('Rezultat pentru 10*pi : %d\n', taylorCos(10*pi, 10^-5));
    fprintf('Rezultat pentru 20*pi : %d\n', taylorCos(20*pi, 10^-5));
    fprintf('Rezultat pentru 30*pi : %d\n', taylorCos(30*pi, 10^-5));
    fprintf('Rezultat pentru 40*pi : %d\n', taylorCos(40*pi, 10^-5));
end

function cosx = taylorCos(x, err)
n = 1;
cosx=1;
addterm=1;
while abs(addterm) > abs(err)
    addterm = ((-1)^n)*(x^(2*n))/factorial(2*n);
    cosx = cosx + addterm;
    n=n+1;
end
end

%Calculul lui Sin de x folosind  seria Taylor
%Ce se intampla pentru x = 10? (si in general pentru x = 2k?, k mare)?
%Explicati fenomenul si propuneti un remediu

function sinOut
    generr = 10^-10;
    fprintf('Rezultat pentru 0*pi : %d\n', taylorSin(0*pi, generr));
    fprintf('Rezultat pentru 1*pi : %d\n', taylorSin(1*pi, generr));
    fprintf('Rezultat pentru 2*pi : %d\n', taylorSin(2*pi, generr));
    fprintf('Rezultat pentru 4*pi : %d\n', taylorSin(4*pi, generr));
    fprintf('Rezultat pentru 10*pi : %d\n', taylorSin(10*pi, generr));
    fprintf('Rezultat pentru 20*pi : %d\n', taylorSin(20*pi, generr));
    fprintf('Rezultat pentru 30*pi : %d\n', taylorSin(30*pi, generr));
    fprintf('Rezultat pentru 40*pi : %d\n', taylorSin(40*pi, generr));
end
%La valori mari ale lui x termenii din suma Taylor oscileaza foarte puternic
%O solutie ar fi reducerea la intervalul [0, 2pi]

function sinx = taylorSin(x, err)
n = 1;
sinx=x;
addterm=1;
while abs(addterm) > abs(err)
    addterm = ((-1)^n)*((x^(2*n+1))/factorial(2*n+1));
    sinx = sinx + addterm;
    n=n+1;
end
end