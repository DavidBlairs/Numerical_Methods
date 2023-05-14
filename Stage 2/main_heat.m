% Set parameters
dt = 0.001;
dx = 0.1;
dy = 0.1;
Tmax = 10;
Tsnap = [1, 2, 4, 6, 8, 10];
value = 5;
bounds = [0.1, 0.9, 0.1, 0.9];
alpha = 1; % set alpha to control strength of heat source

U = Heat2D_modified(dt, dx, dy, Tmax, Tsnap, value, bounds, alpha);
