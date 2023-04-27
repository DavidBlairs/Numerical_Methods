xmin=2; dx=0.05; xmax=10; dt=0.01; tmax=1; c=5; f0=@(x) 2*x.^2;
N = ceil((xmax - xmin) / dx);
xmax = xmin + N*dx;
M = ceil(tmax/dt); %change in time axis
k1 = 1 - dt*c/dx;
k2 = dt*c/dx;
solution = zeros(N+1,M+1);
vetx = xmin:dx:xmax;
for i=1:N+1
   solution(i,1) = feval(f0,vetx(i));
end
fixedvalue = solution(1,1);

% this is needed because of finite domain 

for j=1:M
   solution(:,j+1) = k1*solution(:,j) + k2*[ fixedvalue ; solution(1:N,j) ];
end
subplot(2,2,1);
plot(xmin:dx:xmax, solution(:,1));
subplot(2,2,2);
plot(xmin:dx:xmax, solution(:,25));
subplot(2,2,3);
plot(xmin:dx:xmax, solution(:,50));
subplot(2,2,4);
plot(xmin:dx:xmax, solution(:,101));