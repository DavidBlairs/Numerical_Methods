xmin = -10; % minimum x value
xmax = 10;  % maximum x value
dx = 0.1;   % spatial step size
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

function [solution, N, M] = diffusion(xmin, dx, xmax, dt, tmax, d0, n0, m, Q, R)
    % the number of spatial grid points (rounded up to nearest integer)
    N = ceil((xmax - xmin) / dx); 

    % redefined value for xmax, given new N 
    xmax = xmin + N*dx;

    % the number of temporal grid points
    M = ceil(tmax/dt);

    % initialized solution matrix for each solution in the grid
    solution = zeros(N+1, M+1);

    % vector for storing spatial grid points
    vetx = xmin:dx:xmax;

    % Initialize the condition at t = 0 and x = 0
    solution(vetx == 0,1) = Q;

    % Update the solution at each grid point
    for j = 1:M
        for i = 2:N
            % Calculate the nonlinear term
            nl_term = ((solution(i, j)/n0)^m) * (solution(i+1, j) - 2*solution(i, j) + solution(i-1, j))/(dx^2);

            % Update the solution
            solution(i, j+1) = solution(i, j) + dt * d0 * nl_term;
        end
        % Apply boundary conditions
        solution(1, j+1) = 2*solution(2, j+1) - solution(3, j+1); % at x = -R
        solution(N+1, j+1) = 2*solution(N, j+1) - solution(N-1, j+1); % at x = R
    end
end
