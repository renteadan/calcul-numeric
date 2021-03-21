

for n=10:15
  c1 = cond(hilb(n));
  ci = cond(hilb(n), Inf);
  norma = norm(hilb(n));
  fprintf("Conditionarea de norma 1: %d\nConditionarea de norma infinita: %d\nNorma euclidiana: %d\n", c1, ci, norma);
end