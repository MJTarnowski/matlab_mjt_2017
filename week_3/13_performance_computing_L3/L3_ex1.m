%% lecture 3 - implementing C scripts within a matlab script

% Following the	 improvements	 implemented	 over	 the	 past	 two	 sessions,	
% CellModelsComputeIonicCurrents ought	 to be	 the	 program	 section
% taking	most	of	the	execution	time,	even	for	large	problem	sizes. In	this	exercise,
% we	will	learn	how	to	compile	and	use	a	C	version	of	one	of	its	children	function	in	
% order	to	speed	up	the	code.

%% part a - results of profiler onn run of code

% code implemented:

% profile clear
% profile resume
% profile off

% this shows that cellmodelscomputeioniccurrents and its child functions
% require the most time 

             

%% part b - 

% parameters: (3000,0.5,1.4,1.4,true)

% Total for CMCIC - 17.5s            Self-Time      % total
% CellModelsComputeIonicCurrents      2.965             17%
% luo_rudy_1991_time_deriv            14.084            81%
% luo_rudy_1991_iionic                0.475             3%

%% part c,d

% mex luo_rudy_1991_iionic_mex_adaptor.cpp luo_rudy_1991_c_implementation.cpp

% mex is using gcc to compile
% the latter file is what is to be adapted to a usable matlab format
% the former file is the format that the latter file is converted in to
% a .mexa64 file is outputted. This	 file	defines	a	
% MATLAB	function	with	the	same	interface (i.e.	input/output	parameters)
% as	luo_rudy_1991_iionic.




%% part e


% parameters: (3000,0.5,1.4,1.4,true)

% Total for CMCIC - 17.16s            Self-Time      % total
% CellModelsComputeIonicCurrents      3.05             18%
% luo_rudy_1991_time_deriv            13.92            81%
% luo_rudy_1991_iionic                0.195             1%

% approx 3 fold increase in speed to compute ionic currents