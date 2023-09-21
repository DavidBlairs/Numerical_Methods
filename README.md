# Numerical Methods

This contains my assignment for the "Numerical Methods" module offered to third year bachelor and masters degree students (with modified assesment criteria) at Brunel University London. This final write up for this project was in LaTeX and all code was written in Matlab. You can find specific details on what was done in each section below.

### Completed Sections:

1. In Section 1, the focus was on familiarizing participants with the logistic growth model and the simple stochastic simulation of populations.

2. Section 2 revolved around understanding, controlling, and modifying programs that would be beneficial for modeling specific biological situations in the final segment.

3. For Section 3, algorithms were derived to solve PDE problems, and subsequently, programs were written to approximate the partial differential equation (PDE) models for specific biological situations.

### Completed Tasks for Section 1:

The following tasks were completed:

1. The role of r and K in the deterministic logistic equation from Section 4 was described, and its analytical solution starting from an initial population $X_0$ was determined.
  
2. A Matlab script was created that:
    (a) illustrated on a single graph the typical solutions of the deterministic logistic model.
    (b) generated 10 runs of solutions in the stochastic case for a range of five chosen volatility values (σ) and two different time horizons. The chosen values for volatility spanned a wide range to produce varied behaviors.

### Completed Tasks for Section 2:

The following tasks were completed for Section 2:

1. Two programs were written to address:
    - a one-dimensional time-dependent PDE problem,
    - a two-dimensional diffusion time-dependent problem.

2. The numerical scheme for an advection equation was implemented. Various questions related to this scheme were answered. The output was provided in the form of graphical representations showcasing the solutions at multiple time points, sufficiently distinct to observe the evolution of the solution.

3. 
    (a) The numerical scheme outlined in `Heat2D.m` for the two-dimensional heat equation was implemented for two different initial values, producing two qualitatively distinct results.
    
    (b) The program `Heat2D.m` was modified to accommodate a new initial condition. This modified program was illustrated using three chosen initial conditions, each leading to three qualitatively distinct outcomes.

### Completed Tasks for Section 3:

The following tasks were accomplished for Section 3:

1. Finite difference numerical algorithms were derived to solve the provided PDE models associated with insect dispersal.

2. These derived algorithms were implemented in Matlab.


