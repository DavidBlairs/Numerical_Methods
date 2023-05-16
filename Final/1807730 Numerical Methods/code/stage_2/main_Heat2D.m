% Set parameters
dt = 0.001;
dx = 0.1;
dy = 0.1;
Tmax = 10;
Tsnap = [1, 2, 4, 6, 8, 10];
value = 5;
bounds = [0.1, 0.9, 0.1, 0.9];

U = Heat2D(dt, dx, dy, Tmax, Tsnap, value, bounds);
