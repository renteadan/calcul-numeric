
x=1.3;
resL = interpolareLagrangeFdat(x, @exp, 3, [1.1 1.4 1.6]);
resExp = exp(x);
fprintf("valore interpolare lagrange: %d\nvaloare exponentiala: %d\n", resL, resExp);