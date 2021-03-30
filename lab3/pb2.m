

for n=10:15
  c1 = cond(hilb(n));
  norma = norm(hilb(n));
  fprintf("Conditionarea de norma 1: %d\nNorma euclidiana: %d\n", c1, norma);
end