function val = hermite(x, x1, f, f1)
% xi = nodurile
% f = valorile functiei in noduri 
% f1 = valorile derivatei functiei in noduri
m=length(x1);
for i=1:m
   z(2*i-1)=x1(i);
   z(2*i)=x1(i);
   Q(2*i-1,1)=f(i);
   Q(2*i,1)=f(i);
   Q(2*i,2)=f1(i);
   if (i~=1)
      Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
   end
end
for i=3:2*m
   for j=3:i
      Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
   end
end
s=Q(1,1);
p1=1;
for i=2:2*m
   if (mod(i,2)==1)
      p1=p1*(x-x1((i-1)/2));
   else
      p1=p1*(x-x1(i/2));
   end
   s=s+p1*Q(i,i);
end
val=s;