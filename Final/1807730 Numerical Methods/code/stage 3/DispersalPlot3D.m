% plot the results
function DispersalPlot3D(xmin, dx, xmax, dt, tmax, solution)
    N = size(solution, 1);
    M = size(solution, 2);
    x = xmin:dx:xmax;
    t = 0:dt:tmax;

    % Create a meshgrid for the 3D surface plot
    [X, T] = meshgrid(x, t);

    % Create the 3D surface plot
    figure;
    surf(X, T, solution');
    xlabel('x');
    ylabel('time');
    zlabel('concentration');
    title('Dispersal Model');
    shading interp;
end
