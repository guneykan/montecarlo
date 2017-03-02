function [y, var] = Integ(f,w,inv,N)
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here

SUM=0;
F2SUM=0;
for i=1:N
 value=rand;
 inverse=inv(value);
 fvalue=f(inverse)/w(inverse);
 SUM=SUM+fvalue;
 F2SUM=F2SUM+fvalue^2;
end

SUM=SUM/N;
F2SUM=F2SUM/N;
y=SUM;
var= F2SUM-SUM^2;
var=var/N;
end