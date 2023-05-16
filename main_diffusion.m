xmin = -10; % minimum x value
xmax = 10;  % maximum x value
dx = 0.01;   % spatial step size
tmax = 10;  % maximum time
dt = 0.01;  % time step size
d0 = 0.1;   % diffusion coefficient
n0 = 1;     % reference density
m = 1;      % nonlinearity exponent
Q = 100;    % initial quantity
R = 10;     % spatial range

[solution, N, M] = diffusion(xmin, dx, xmax, dt, tmax, d0, n0, m, Q, R);

% plot the solution at the final time step
plot(linspace(xmin, xmax, N+1), solution(:, end));
xlabel('x');
ylabel('Density of Insects');
title('Solution at final time step');
