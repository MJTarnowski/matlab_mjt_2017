%% exercise 1


%% a. how	 many	 input/output	 parameters	RunAndVisualiseMonodomainSimulation takes

% the function RunAndVisualiseMonodomainSimulation has:

% 2 output parameters:  [ finalVoltage, conductionVelocities ]

% 5 input parameters: (numberCells,
%                    simulationDuration,
%                    leftFibreHalfconductivity,
%                    rightFibreHalfconductivity,
%                    visualiseSimulation)

% definitions of parameters:
% 

% outputs: 
% finalVoltage - transmembrane potential accross the domain
%  at the end of the simulation
% conductionVelocities - a vector
%  with the conduction velocity computed at each end of the fibre

% inputs: 
% numberCells, number of cells in simulation
% simulationDuration, how long the simulation will be run for
% leftFibreHalfconductivity,conductivities used in the left and right half of the fibre, respectively.
% rightFibreHalfconductivity,conductivities used in the left and right half of the fibre, respectively.
% visualiseSimulation - If visualiseSimulation is true, the evolution of the
%  transmembrane potential throughout the simulation is plotted, as well as
%  the action potential shape at both ends of the fibre.

%% ex1 qb

RunAndVisualiseMonodomainSimulation(50,15,1.4,1.4,true)

% the plots that are outputted are the membrane potential along the fibre
% over time
% then that plot disappears and only the potential along the fibre at final
% time is shown
% the transmembrane potential over time is shown for the cell at the start
% and end of the fibre is shown as a plot too

% conduction velocities is a vector with the conduction velocity 
% computed at each end of the fibre


conductionVelocities =

    0.0522    0.0522
    
    
% both elements of this vector are roughly the same, as expected
% because:
%  A square stimulus is applied
%  after 0.5 ms of the start of the simulation for 1 ms at the middle of
%  the domain.

%% ex1 qc
% condition                      a       b       c       d
% leftHalfFibreConductivity     1.4     1.4     1.4     2.8
% rightHalfFibreConductivity    0.7     1.4     2.8     2.8
% conductionVelocities(1)       0.0524  0.0522  0.0519  Inf
% conductionVelocities(2)       Inf     0.0522  0.0730  Inf

%% ex1 qd

% the results for conditions a and d in question c are not expected
% as they show infinite conduction velocities
% in both simulations this result is obtained by dividing by zero,
% this occurs because under condition a, the final cell is never activated
% and under condition b, the cells at each end of the fibre are never
% activated

% conductionVelocities = halfTheFibreLength * [1/firstCellActivationTime, 
%                                               1/lastCellActivationTime]
