% a function to solve the avection equation in a given boundary
function [solution, N, M] = transport(xmin, dx, xmax, dt, tmax, c, f0)
    % the number of spatial grid points (rounded up to nearest integer)
    N = ceil((xmax - xmin) / dx); 

    % redefined value for xmax, given new N 
    xmax = xmin + N*dx;

    % the number of temporal grid points
    M = ceil(tmax/dt);

    % coefficients based on the value of c, used to solve equation
    k1 = 1 - dt*c/dx;
    k2 = dt*c/dx;

    % initialised solution matrix for each solution in the grid
    solution = zeros(N+1, M+1);

    % vector for storing spacial grid points
    vetx = xmin:dx:xmax;

    % for each row of temporal grid points
    for i=1:N+1
        % evaluate the starting conditions under the function f0
        solution(i,1) = feval(f0, vetx(i));
    end

    % avection equation is not well defined and so a fixed boundary 
    % condition is assumed
    fixedvalue = solution(1, 1);
    
    % for each column of temporal grid points
    for j=1:M
        % evaluate the solution at each point, starting from the initial
        % boundary condition
        solution(:, j+1) = k1*solution(:, j) + k2*[ fixedvalue ; solution(1:N, j) ];
    end
