% define the parameters
xmin = 0;
dx = 0.1;
xmax = 10;
dt = 0.001; % Update dt value to a smaller time step
tmax = 5;
d0 = 0.5;
m = 1.5;
n0 = 100;
Q = 100;

% calculate the solution using the dispersal function
[solution, N, M] = dispersal(xmin, dx, xmax, dt, tmax, d0, m, n0, Q);

% plot the results
DispersalPlot3D(xmin, dx, xmax, dt, tmax, solution);