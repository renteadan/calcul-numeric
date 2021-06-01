% f - f(x) fct de integrat. ex: f = @(x) 1 + x.^2;
% a,b - limite interare
% n - numarul de patrate. Cu cat n e mai mare => cu atat precizia creste
function I = IntegrateRectangles(f,a,b,n)
    I = solveUsingRectangles(f,a,b,n);
end

% f - f(x) fct de integrat. ex: f = @(x) 1 + x.^2;
% a,b - f:[a,b]->R limitele de domeniului de definitie
% n - numarul de patrate. Cu cat n e mai mare => cu atat precizia creste
function I = solveUsingRectangles(f,a,b,n)
  % delta x;
  dx     = (b-a)/n; 
  I = 0;
  % xi previous
  xip = 0;
  for i=1:n
      xi = a+i*dx;
      I = I + f((xip+xi)/2);
      xip = xi;
  end
  I =  dx * I;
end