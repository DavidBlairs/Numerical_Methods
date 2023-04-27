
x0=10;
NRepl=5;
NSteps=100;
T=300;
sigma=0.01;
r=0.05;
K=20;
x = zeros(NRepl, 1+NSteps);
x(:,1) = x0;
dt = T/NSteps;
sidt = sigma*sqrt(dt);
t=linspace(0,T, NSteps+1);
for i=1:NRepl
   for j=1:NSteps
      x(i,j+1)=x(i,j)*(1+r*(1-(x(i,j))/K)*dt + sidt*randn);
   end
end

plot(t,x)
