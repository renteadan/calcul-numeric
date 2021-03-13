% calcul epsilon-masina
myeps = 1.0;
while (1+myeps)~=1 
    myeps = myeps/2;  
end
myeps = 2*myeps;
fprintf('diferentea intre eps masina si cel calculat (%d) este %d\n', myeps, eps-myeps);

%calcul realmax

p1=0;
while 1/2^p1 > 0
    p1=p1+1;
end
p1 = p1-1;
mymax=(2 - eps)*2^p1;
fprintf('diferentea intre realmax masina si cel calculat (%d) este %d\n', mymax, realmax-mymax);
 
%calcul cel mai mic numarul nenormalizat reprezentabil
p2 = 0;

while 2^p2 > 0
    p2 = p2 - 1;
end

% normalizare
p2 = p2+53;
mymin = 2^p2;
fprintf('diferenta dintre cel mai mic numar normalizat si cel calculat (%d): %d\n', mymin, realmin-mymin);
