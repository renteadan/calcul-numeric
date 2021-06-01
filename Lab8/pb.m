d=[exp(0), exp(3)]; % derivata e^x
t=linspace(0,3,200)';
x=0:3; y=exp(x);

% complete
[a1,b1,c1,d1]=CoeficientiiSpline(x,y,d,0);
s1=EvaluareSpline(x,[a1,b1,c1,d1],t);

% derivate secunde
[a2,b2,c2,d2]=CoeficientiiSpline(x,y,d,1);
s2=EvaluareSpline(x,[a2,b2,c2,d2],t);

% naturale
[a3,b3,c3,d3]=CoeficientiiSpline(x,y,[0, 0],2);
s3=EvaluareSpline(x,[a3,b3,c3,d3],t);

% deBoor
[a4,b4,c4,d4]=CoeficientiiSpline(x,y,[0, 0], 3);
s4=EvaluareSpline(x,[a4,b4,c4,d4],t);

yg=exp(t);
plot(x,y,'o',t,[yg,s1,s2,s3,s4])
legend('noduri','f','complete', 'deriv secunde', 'natural', 'deBoor')