

function [ finalVoltage, conductionVelocities ] = RunAndVisualiseMonodomainSimulation( numberCells, simulationDuration, leftHalfFibreConductivity, rightHalfFibreConductivity, visualiseSimulation)

profile clear

%RUNANDVISUALISEMONODOMAINSIMULATION runs, and optionally visualises, a
%monodomain simulation in a one-dimensional domain (cardiac tissue fibre).
%
%  [finalVoltage, conductionVelocities] =
%                 RUNANDVISUALISEMONODOMAINSIMULATION(numberCells,
%                                                     simulationDuration,
%                                                     leftFibreHalfconductivity,
%                                                     rightFibreHalfconductivity,
%                                                     visualiseSimulation)
%
%  Runs a monodomain simulation in a cardiac fibre made of numberCells
%  cells for simulationDuration milliseconds. A square stimulus is applied
%  after 0.5 ms of the start of the simulation for 1 ms at the middle of
%  the domain. leftHalfFibreConductivity and rightHalfFibreConductivity are
%  the conductivities used in the left and right half of the fibre,
%  respectively. If visualiseSimulation is true, the evolution of the
%  transmembrane potential throughout the simulation is plotted, as well as
%  the action potential shape at both ends of the fibre.
%
%  The simulation returns the transmembrane potential accross the domain
%  at the end of the simulation (finalVoltage) and a vector
%  with the conduction velocity computed at each end of the fibre
%  (conductionVelocities).

% Introduction to Scientific and High Performance Computing with MATLAB
%
% Copyright (c) 2012-2014, Miguel O. Bernabeu, All rights reserved.
% 
% This library is free software; you can redistribute it and/or
% modify it under the terms of the GNU Lesser General Public
% License as published by the Free Software Foundation; either
% version 3.0 of the License, or (at your option) any later version.
% 
% This library is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Lesser General Public
% License along with this library.

% ******* set up the timer
timer = zeros(1,10);



%
% Section 1: setup simulation
%

%start timer for section 1
t1_start = tic;

problemConfiguration.spaceStep = 0.025; % distance between cells (cm)
problemConfiguration.pdeTimeStep = 0.01; % monodomain temporal discretisation time step (ms)
problemConfiguration.odeSolvesPerPdeTimeStep = 10; % number of ODE solves per pde time step (i.e. odeTimeStep = pdeTimeStep/odeSolvesPerPdeTimeStep)
problemConfiguration.stimulusMagnitude = 1e5; % magnitude of the external stimulus applies (A/cm^3)
problemConfiguration.stimulusStart = 0.5; % stimulus application delay (ms)
problemConfiguration.stimulusDuration = 1; % stimulus duration (ms)
problemConfiguration.leftConductivity = leftHalfFibreConductivity; % conductivity in the left half of the fibre (mS/cm)
problemConfiguration.rightConductivity = rightHalfFibreConductivity; % conductivity in the right half of the fibre (mS/cm)
problemConfiguration.cellSurfaceAreaToVolumeRatio = 1400; % cell surface-area to volume ratio (cm^-1)
problemConfiguration.cellMembraneCapacitance = 1; % cell membrane capacitance (uF/cm^2)
problemConfiguration.numberCells = numberCells; % number of cells in the domain

apCellModelsState = CellModelsInitialise(problemConfiguration); % initialise matrix storing column-wise the state of each action potential cell model

previousSolution = CellModelsGetVoltage(problemConfiguration, apCellModelsState);  % Get resting potential from cell models

numberTimeSteps = simulationDuration / problemConfiguration.pdeTimeStep; % Number of time steps to be executed
%

%end timer section 1 and append time to timer vector
timer(1) = toc(t1_start);


% End Section 1
%

%
% Section 6.a: visualise results
%

%start timer for section 6a
t6a_start = tic;

if visualiseSimulation
    gridPoints = (1:numberCells)';
    figure(1);
    plot(gridPoints,previousSolution,'b');
    xlabel('Cell number'); ylabel('Transmembrane potential (mV)'); title('Transmembrane potential along the fibre, timestep 0');
    axis([1 numberCells -90.0 70.0]);
    drawnow; % plot initial solution
end

%end timer section 6a and append time to timer vector
timer(6) = timer(6) + toc(t6a_start);



%
% Section 2: assembly monodomain system matrix
%

%start timer for section 2
t2_start = tic;

systemMatrix = AssemblyFiniteDifferencesMatrix(problemConfiguration);

firstCellActivationTime = 0; lastCellActivationTime = 0;
firstCellActive = false;lastCellActive = false;

%end timer section 2 and append time to timer vector
timer(2) = toc(t2_start);




for timeStepNumber = 1:numberTimeSteps
    profile resume
    %
    %start timer for section 2
    t3_start = tic;
    % Section 3: solve cell models to compute ionic currents
    %
    volumetricStimuli = GetStimuliForTimeStep(problemConfiguration, timeStepNumber);
    [ionicCurrents, apCellModelsState] = CellModelsComputeIonicCurrents(apCellModelsState, ...
                                                                        problemConfiguration, ...
                                                                        timeStepNumber, ...
                                                                        volumetricStimuli/problemConfiguration.cellSurfaceAreaToVolumeRatio);
    % add time for each iteration of loop to the timer sum
    timer(3) = timer(3) + toc(t3_start);
    
    profile off
    
    %
    % Section 4: assembly monodomain system right hand side
    %

    %start timer for section 4
    t4_start = tic;
    
    systemRightHandSide = AssemblyFiniteDifferencesRightHandSide(problemConfiguration, previousSolution, ionicCurrents, volumetricStimuli);
    
    %end timer section 4 and append time to timer vector
    timer(4) = toc(t4_start);
    
    %
    % Section 5: solve monodomain system
    %
    
    %start timer for section 5
    t5_start = tic;
    
    currentSolution = SolveLinearSystem(systemMatrix, systemRightHandSide, previousSolution);
    apCellModelsState = CellModelsSetVoltage(apCellModelsState, problemConfiguration, currentSolution); % Feed into the cell models the voltage computed at tissue level

    %end timer section 5 and append time to timer vector
    timer(5) = toc(t5_start);
    %
    % Section 6.b: visualise results
    %
    
    %start timer for section 6b
    t6b_start = tic;
    
    if visualiseSimulation && mod(timeStepNumber,25)==0
        plot(gridPoints,currentSolution,'b');
        xlabel('Cell number'); ylabel('Transmembrane potential (mV)'); title(['Transmembrane potential along the fibre, timestep ' num2str(timeStepNumber)]);
        axis([1 numberCells -90.0 70.0]);
        drawnow;
    end
    %end timer section 6b and append time to timer vector
    timer(6) = timer(6) + toc(t6b_start);
    
    %
    % Section 7: postprocess results
    %
    
    %start timer for section 7
    t7_start = tic;
    
    
    firstCellVoltage(timeStepNumber) = currentSolution(1);
    lastCellVoltage(timeStepNumber) = currentSolution(end);
    if currentSolution(1) > 0 && not(firstCellActive)
        firstCellActivationTime = (timeStepNumber-1) * problemConfiguration.pdeTimeStep;
        firstCellActive = true;
    end
    if currentSolution(end) > 0 && not(lastCellActive)
        lastCellActivationTime = (timeStepNumber-1) * problemConfiguration.pdeTimeStep;
        lastCellActive = true;
    end
    
    timer(7) = toc(t7_start);
    
    
    %
    % End Section 7
    %
    
    previousSolution = currentSolution;
end

%
% Section 6.c: visualise results
%    
%start timer for section 6c
t6c_start = tic;
    
    
if visualiseSimulation && numberTimeSteps > 0
    figure(2);
    plot(1:numberTimeSteps, firstCellVoltage);
    xlabel('Time step number'); ylabel('Transmembrane potential (mV)'); title('Transmembrane potential over time for cell number 1');
    axis([1 numberTimeSteps -90.0 50.0]);
    drawnow;
    
    figure(3);
    plot(1:numberTimeSteps, lastCellVoltage);
    xlabel('Time step number'); ylabel('Transmembrane potential (mV)'); title(['Transmembrane potential over time for cell number ' num2str(problemConfiguration.numberCells)]);
    axis([1 numberTimeSteps -90.0 50.0]);
    drawnow;
end


halfTheFibreLength = (numberCells - 1) * problemConfiguration.spaceStep / 2;
conductionVelocities = halfTheFibreLength * [1/firstCellActivationTime, 1/lastCellActivationTime]
finalVoltage = previousSolution;

%end timer section 6b and append time to timer vector
timer(6) = timer(6) + toc(t6c_start);


%
% Run a regression test to make sure that bugs have not been introduced
% during optimisation
%
RegressionTest(problemConfiguration, conductionVelocities);

%return timer

timer

end

