% HeatImpl.m
clear;
clc;

deltax = 0.01;
deltat = 0.001;
tmax = 0.1 ;
N = round(1/deltax);
deltax=1/N;
M = round(tmax/deltat);
deltat=tmax/M;
sol = zeros(N+1,M+1);
rho = deltat / (deltax)^2
rho2 = 1+2*rho;
B = diag(rho2 * ones(N-1,1)) - ...
   diag(rho*ones(N-2,1),1) - diag(rho*ones(N-2,1),-1);
vetx = 0:deltax:1;

for i=2:ceil((N+1)/2)
   sol(i,1) = 2*vetx(i);
   sol(N+2-i,1) = sol(i,1);
end

%for i=2:N
%   sol(i,1) = sin(pi*vetx(i));
%end

for j=1:M
   sol(2:N,j+1) = B \ sol(2:N,j);   
end

eigs(inv(B),1)

eigs(B,1)

for j=1:4
subplot(2,2,j)
plot(vetx,sol(:,1+round((j-1)*M/3)))
xlabel('x');
ylabel('u(.,t_i)');
axis([0 1 0 1])
end
