x1 = linspace(1, 10, 20);
f = sin(x1);
f1 = cos(x1);
x = 1.2:0.5:10.1;

val = [];
for i=1:length(x)
   val(i) = hermite(x(i),x1,f,f1);
end 

hold on
plot(x+0.5,sin(x),'r-','LineWidth',2);
plot(x,val,'g-');
hold off
