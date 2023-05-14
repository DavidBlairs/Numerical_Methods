function DispersalPlot(xmin, dx, xmax, dt, solution, time)
    N = size(solution, 1);
    M = size(solution, 2);
    x = xmin:dx:xmax;

    % Find the closest time index corresponding to the desired time
    time_index = round(time / dt) + 1;

    % Check if the time index is within bounds
    if time_index > M
        disp('The specified time is beyond the maximum time of the solution.');
        return;
    end

    % Create the 2D plot at the specified time index
    figure;
    plot(x, solution(:, time_index));
    xlabel('x');
    ylabel('concentration');
    title(['Dispersal Model at time = ', num2str(time)]);
    grid on;
end
