%% L2  ex 4 parfor loops 

% A	parfor-loop	is	useful	in	situations	where	you	need	many	loop	iterations	of	a	
% simple	calculation,	such	as	a	Monte	Carlo	simulation.	parfor	divides	the	loop	
% iterations	into	groups	so	that	each	worker	executes	some	portion	of	the	total	
% number	 of	 iterations.	 parfor-loops	 are	 also	 useful	 when	 you	 have	 loop	
% iterations	that	take	a	long	time	to	execute,	because	the	workers	can	execute	
% iterations	simultaneously.
% You	cannot	use	a	parfor-loop	when	an	iteration	in	your	loop	depends	on	the	
% results	 of	 other	iterations.	Each	iteration	must	be	independent	 of	all	 others.	
% Since	there	is	a	communications	cost	involved	in	a	parfor-loop,	there	might	be	
% no	 advantage	 to	 using	 one	 when	 you	 have	 only	 a	 small	 number	 of	 simple	
% calculations.	The	example	of	this	section	are	only	to	illustrate	the	behavior	of	
% parfor-loops,	 not	 necessarily	 to	 demonstrate	 the	 applications	 best	 suited	 to	
% them

%% part a, b, c

% parfor loop implemented
% resulting times for each section (see previous exercise for a comparison)
% 0.0020    0.0246    6.9633    0.0028    0.0071    0.6972    0.0010

% section 3 is made 25% faster

% there are 4 matlab processes running on my machine

% time = 15 simulation is 15 fold slower for section 3 with a parfor loop..
% this is because of the communications cost
% without parfor (t=15)
% 0.0001    0.0001    4.3289    0.0078    0.0081    1.5762    0.0012
% with parfor (t=15)
% 0.0001    0.0002   56.2893    0.0307    0.0264    1.9111    0.0041

%% part e - parfor loop 

% you get this error:

% Error: File: RunAndVisualiseMonodomainSimulation.m Line: 109 Column: 73
% The temporary variable apCellModelsState in a parfor is uninitialized.
% See Parallel for Loops in MATLAB, "Uninitialized Temporaries".

