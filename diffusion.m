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
    [~, idx] = min(abs(vetx));  % find the index closest to 0
    solution(idx,1) = Q;

    % Update the solution at each grid point
    for j = 1:M
        for i = 2:N
            % Calculate the nonlinear term
            nl_term = ((solution(i, j)/n0)^m) * (solution(i+1, j) - 2*solution(i, j) + solution(i-1, j))/(dx^2);

            % Update the solution
            solution(i, j+1) = solution(i, j) + dt * d0 * nl_term;
            
            % Check if the solution is becoming unstable
            if isnan(solution(i, j+1)) || isinf(solution(i, j+1))
                error('Solution is becoming unstable. Try decreasing dt or dx.');
            end
        end
        % Apply boundary conditions
        solution(1, j+1) = 2*solution(2, j+1) - solution(3, j+1); % at x = -R
        solution(N+1, j+1) = 2*solution(N, j+1) - solution(N-1, j+1); % at x = R
    end
end
