
disp('p1');
rez1 = interpolareLagrange([0 1 2], [exp(0) exp(1) exp(2)], 0.25);
rez2 = hermite(0.25, [0 1 2], [exp(0) exp(1) exp(2)], [exp(0) exp(1) exp(2)]);
rez3 = exp(0.25);
fprintf('hermite:%d\nlagrange:%d\nexp:%d\n', rez2, rez1, rez3);

disp('p2');
disp('a');
rez1 = hermite(0.34, [0.3 0.32 0.35], [sin(0.3) sin(0.32) sin(0.35)], [cos(0.3) cos(0.32) cos(0.35)]);
rez2 = sin(0.34);
fprintf('hermite:%d\nsin:%d\n', rez1, rez2);
disp('b');
rez1 = hermite(0.34, [0.3 0.32 0.33 0.35], [sin(0.3) sin(0.32) sin(0.33) sin(0.35)], [cos(0.3) cos(0.32) cos(0.33) cos(0.35)]);
rez2 = sin(0.34);
fprintf('hermite:%d\nsin:%d\n', rez1, rez2);

disp('p3');
t=10;
rez1=hermite(t, [0 3 5 8 13], [0 225 383 623 993], [75 77 80 74 72]);
fprintf('distanta:%d\nviteza:%d\n', rez1, rez1/t);

