function [result,i] = Secant(f,x1,x2,err,nmax)
%SECANT - Metoda secantei pentru ecuatii neliniare
%apel [result,i] = Secant(f,x1,x2,err,nmax)
%Input
%f    - functia/ecuatia neliniara
%x1   - prima aproximatie a radacinii
%x2   - a doua aproximatie a radacinii
%err  - toleranta
%nmax - numarul maxim de iteratii
%Output
%result - aproximatia radacinii
%i - numarule de iteratii necesare
  for i = 1:nmax
    result = x2 - ((x2 - x1) .* f(x2)) ./ (f(x2) - f(x1));
    if abs(result - x2) < err + err * abs(result)
      return;
    end
    x1 = x2;
    x2 = result; 
  end
  error("Solutia nu a putut fi gasita in numarul de iteratii dat");
end