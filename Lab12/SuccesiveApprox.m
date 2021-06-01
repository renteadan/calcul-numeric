function [z,ni] = SuccesiveApprox(f,fd,x0,err,nmax)
%Newtonsyst - metoda lui Newton pentru ecuatii neliniare in R si R^n
%Input
%f  - sistem de fct nelinare
%fd - derivatele lui f
%x0 - aproximarea initiala
%err - toleranta
%nmax - numar maxim de iteratii

    i = 1;
    xp = x0; % xp - x previous
    Lambda=fd(x0);
    while i <= nmax
        xc = xp - Lambda\f(xp); % xc - x current
        if norm(xc-xp,inf) < err
            z  = xc;
            ni = i;
            return;
        end
        xp = xc;
        i = i+1;
    end
    error('Could not compute inside the given number of iterations');
end