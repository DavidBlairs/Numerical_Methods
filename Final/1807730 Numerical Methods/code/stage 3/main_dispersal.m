% define the parameters
xmin = 0;
dx = 0.1;
xmax = 20;
dt = 0.001; 
tmax = 50;
d0 = 1.5;
m = 0.5;
n0 = 150;
Q = 100;

% calculate the solution using the dispersal function
[solution, N, M] = dispersal(xmin, dx, xmax, dt, tmax, d0, m, n0, Q);

% plot the results
DispersalPlot3D(xmin, dx, xmax, dt, tmax, solution);