% define the constants for the model
starting_population = 10;
time                = 0:0.01:20;
carrying_capacity   = 100;

% define the constants for the plot (odd number preferable)
number_of_lines = 21;
growth_rate_inc = 0.5;

% plot different growth rates on the same graph
clf
hold on
% for each line on the plot / each growth rate
for plot_index = 1:number_of_lines
    % calulate the growth rate
    growth_rate = -0.5 - (growth_rate_inc * ((number_of_lines - 1)/2)) ...
        + (growth_rate_inc * plot_index);
   
    % determine the population over the time interal
    current_population = X(time, carrying_capacity, ...
        growth_rate, starting_population);
    
    % plot this information
    plot(time, current_population, "DisplayName", string(growth_rate))

    % set the legend
    lgd = legend;
    title(lgd,'Growth Rate');
    lgd.FontSize = 14;
end
xlabel("Time", 'FontSize', 14)
ylabel("Population Size", 'FontSize', 14)
hold off

% calculate the population at a specific time or array of times
function rtn = X(t, K, r, X_0)
    A   = (K - X_0) / X_0;
    rtn = K./(1 + A.*exp(-r.*t));
end



