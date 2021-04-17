
resSin = interpolareLagrange([0 pi/6 pi/4 pi/3 pi/2], [0 1/2 sqrt(2)/2 sqrt(3)/2 1], 5*pi/180);
fprintf("sin\naproximare: %d\nval reala: %d\n", resSin, sin(5*pi/180));

resCos = interpolareLagrange([0 pi/6 pi/4 pi/3 pi/2], [1 sqrt(3)/2 sqrt(2)/2 1/2 0], 5*pi/180);
fprintf("cos\naproximare: %d\nval reala: %d\n", resSin, cos(5*pi/180));
