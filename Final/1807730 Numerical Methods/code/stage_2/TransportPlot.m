% TransportPlot.m 
function TransportPlot(xmin, dx, xmax, dt, tmax, solution_1)
    % array of spacial grid points
    spacial = xmin:dx:xmax;
    size(spacial)    

    % array of temporal grid points
    temporal = 0:dt:tmax;
    size(temporal)
    
    size(solution_1)
    % plot 3D
    mesh(temporal, spacial, solution_1);

    % axis label
    ylabel("Spacial Points");
    xlabel("Temporal Points");
    zlabel("Solution");

    % axis limits
    xlim([temporal(1), temporal(end)])
    ylim([spacial(1), spacial(end)])
    zlim([min(solution_1(:)), max(solution_1(:))])
    
