N=[10;20;50;100;200;500;1000;2000;5000];

I=zeros(length(N),1);
var_I=zeros(length(N),1);
var_F=2.97513-(1.38165)^2;
variance_error=zeros(length(N),1);


I2=zeros(length(N),1);
var_I2=zeros(length(N),1);
var_F2=2.97513-(1.38165)^2;
variance_error2=zeros(length(N),1);

for i=1:length(N)
    
  [I(i), var_I(i)]=Integ(@(x) f(x),@(x) 1,@(x) inverse1(x),N(i));
   variance_error(i)=N(i)*var_I(i)/var_F;

end


for i=1:length(N)
    
  [I2(i), var_I2(i)]=Integ(@(x) f(x),@(x) w(x),@(x) inverse2(x),N(i));
   variance_error2(i)=N(i)*var_I2(i)/var_F;

end

%varianceOfvariance=
columnNames = {'N','I1','Var_I1','Var_IF1','VarError1','I2','Var_I2','Var_IF2','VarError2'};
T = table(N,I,var_I,variance_error,variance_error-1,I2,var_I2,variance_error2,variance_error2-1,'VariableNames',columnNames)




cvariance=zeros(length(N),1);
I=zeros(50,1);
vars=zeros(50,1);

for i=1:length(N)
    temp=zeros(1000,1);
  for j=1:1000  
    [I(j),temp(j)]=Integ(@(x) f(x),@(x) 1,@(x) inverse1(x),N(i));
  end
  cvariance(i)=var(temp);
end


columnNames = {'N','VarOfVars','VarOfVarsError'};
T = table(N,cvariance,N.*cvariance./var_F,'VariableNames',columnNames)

figure
fplot(@(x) f(x),[0 1]);










