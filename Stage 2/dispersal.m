function [solution, N, M] = dispersal(xmin, dx, xmax, dt, tmax, d0, m, n0, Q)
    % the number of spatial grid points (rounded up to nearest integer)
    N = ceil((xmax - xmin) / dx); 

    % redefined value for xmax, given new N 
    xmax = xmin + N*dx;

    % the number of temporal grid points
    M = ceil(tmax/dt);

    % initialised solution matrix for each solution in the grid
    solution = zeros(N+1, M+1);

    % vector for storing spacial grid points
    vetx = xmin:dx:xmax;

    % for each row of spatial grid points
    for i=1:N+1
        % evaluate the starting conditions with a quantity Q at x=0 and
        % n0 elsewhere
        if vetx(i) == 0
            solution(i,1) = Q;
        else
            solution(i,1) = n0;
        end
    end

    % for each column of temporal grid points
    for j=1:M
        % solve the finite difference equation for the dispersal model at each
        % point, starting from the initial conditions
        for i=2:N
            solution(i, j+1) = solution(i, j) + (dt * d0 * (solution(i, j)^m) * (solution(i+1, j) + solution(i-1, j) - 2*solution(i, j))) / (n0^m * dx^2);
        end
        % apply boundary condition at x=0
        solution(1, j+1) = solution(2, j+1);
    end
end
