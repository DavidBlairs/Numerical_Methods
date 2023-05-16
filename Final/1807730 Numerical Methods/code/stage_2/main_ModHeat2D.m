% Set parameters
dt = 0.001;
dx = 0.1;
dy = 0.1;
Tmax = 10;
Tsnap = [1, 3, 7, 10];
value = 5;
bounds = [0.1, 0.9, 0.1, 0.9];
alpha = -10^-10;

U = ModHeat2D(dt, dx, dy, Tmax, Tsnap, value, bounds, alpha);
