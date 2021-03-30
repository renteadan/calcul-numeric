
ex3(3);

function ex3(n)
  
  A = rand(n,n);
  B = ones(n,1);
  disp('Gauss: ');
  x = pb1(A, B);
  disp(x);
  disp('LUP: ');
  x = pb2(A, B);
  disp(x);
  
end