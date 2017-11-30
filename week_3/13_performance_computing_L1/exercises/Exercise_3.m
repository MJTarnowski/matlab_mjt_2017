% In	 Exercise 2.b you	 should	 have	 found	 that,	 when	 running	 with	 parameters	
% (50,15,1.4,1.4,true), Section	 3	 is	 the	 most	 time	 consuming.	 Now	 use	
% MATLAB’s	profile tool to	study	where	time	is	being	spent	within	that section

%% ex3 q a

% used profile clear; profile resume; profile off 
% to analyse a certain section of code within your script
% done

%% ex3 q b

% use profile viewer to look at the profile report



% this shows that the majority of time is spent in line 136 which actually
% calls this function:
% CellModelsComputeIonicCurrents

% line 41 of CELLMODELSCOMPUTEIONICCURRENTS is also heavy on run time
% ...
    
%% ex 3 q c

% Self time is the time spent in a function excluding the time spent in 
% its child functions. Self time also includes overhead 
% resulting from the process of profiling

% total time - time spent in the function, including its child functions

% total time - self time = time spent in child functions

%% ex 3 q d & e

% In	 the	Profile	Summary,	you	can	compute	the	 total	
% execution	 time	of	 the section	 by	 adding	 up	 the	 Self	 Time	 column.

% the total time without profiler was around 6 seconds
% with profiler, the total time is 44 seconds
% presumably profiler makes everything run slower because it must:
% count	how	many	time	a	line	is	hit,	time it,	etc

% File	name and line number    run-L136    cell-L41    luo-L178,L136
% Number of calls               1500        750,000     750,000
% %	of total section time       86%         73%         ~10%


%% ex 3 q f 

% the children funcs of CellModelsComputeIonicCurrents:

% luo_rudy_1991_time_deriv() - 69% of non self-time
%luo_rudy_1991_iionic() - 14 % of non self-time

% yes, these children functions do account for all of the non self time of 
% CellModelsComputeIonicCurrents

%% ex 3 q g

% code analyser suggests:
% he variable 'ionicCurrents' appears to change size on every
% loop iteration. Consider preallocating for speed.

%% ex 3 q h

% coverage analysis is useful for performance analysis because
% it could tell the user Code lines that did not run
% https://en.wikipedia.org/wiki/Code_coverage

%  code coverage is a measure used to describe the degree to which the
% source code of a program is executed when a particular test suite runs.

% A program with high code coverage, measured as a percentage, has had more
% of its source code executed during testing which suggests it has a lower 
% chance of containing undetected software bugs compared to a program with 
% low code coverage.
% 
% Many different metrics can be used to calculate code coverage; some of the
% most basic are the percentage of program subroutines and the percentage of
% program statements called during execution of the test suite.