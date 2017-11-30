%% exercise 2 - writing mex interfaces for C code

% the time deriv calculator within CMCIC was changed to a C code

% parameters: (3000,0.5,1.4,1.4,true)

% Total for CMCIC - 4.624s            Self-Time      % total
% CellModelsComputeIonicCurrents      2.586             56%
% luo_rudy_1991_time_deriv            1.906            41%
% luo_rudy_1991_iionic                0.131             3%


% amount of time required for time deriv vastly decreased (from 14 seconds
% to 2 seconds!)

% total speed up thanks to mex is approx 73% decrease in time taken
% thus vast improvement