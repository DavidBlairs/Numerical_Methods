% define constants for the model
number_of_steps   = 90;
initial_value     = 30; % 18077 - 30
carrying_capacity = 20;
growth_rate       = 0.05; 

% define variables for the model
time_horizons = [80 120]; 
volatilities  = [-0.2 -0.1 0, 0.1 0.2];

% reset the seed for the random number (reproducible)
% rng(1)

% run the simulation for a certain number of steps
clf
hold on

% for each volatility value
for volatility_index = 1:length(volatilities)
    % for each time horizon value
    for time_horizon_index = 1:length(time_horizons)
        % set the array to store the population
        population    = [initial_value];
        
        % keep same seed across simulations
        % rng(1)

        % calculate all the steps for those parameters
        for step_index = 2:number_of_steps
            population(step_index) = X_next(population(step_index - 1), ...
                growth_rate, carrying_capacity, volatilities(volatility_index), ...
                time_horizons(time_horizon_index), number_of_steps);
        end

        % plot that specific population over time
        plot(population, "DisplayName", sprintf( ...
            "%.2f - %d", volatilities(volatility_index), ...
           time_horizons(time_horizon_index)))
    end 
end
% set the legend
lgd = legend;
title(lgd,'Volatility - Time Horizon');
lgd.FontSize = 14;

% set the axis
xlabel("Time", 'FontSize', 14)
ylabel("Population Size", 'FontSize', 14)

hold off

% return the next population value
function rtn = X_next(X_previous, r, K, sigma, T, N)
    dt  = T / N;
    eps = normrnd(0, 1);
    rtn = (r * X_previous * (1 - (X_previous / K)) * dt) + ...
        (sigma * X_previous * eps * sqrt(dt)) + X_previous;
end
