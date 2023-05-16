% define the parameters
xmin = 0;
dx = 0.01;
xmax = 10;
dt = 0.01;
tmax = 10;
c = 1;

% various functions to try
f0 = @(x) sin(pi*x);
f1 = @(x) x^2;
f2 = @(x) abs(x);

% calculate some solutions to the equation 
[solution_1, N_1, M_1] = transport(xmin, dx, xmax, dt, tmax, c,  f1);