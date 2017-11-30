%% L2 ex 3 - vectorisation

%% a - vectorising cellmodels-setvoltage
% Vectorization	means	 converting	 for	 and	 while	 loops	
% to	 equivalent	 vector	 or	 matrix	operations

% The	speed	up	comes	 from	removing the	overhead	associated	with	looping	over	
% all	the	elements of	a	matrix/vector and	allowing some	internal	optimisations	to	
% happen.	 In	 addition, vectorial	 operations	 are	 closer	 to	 mathematical	 language	
% and	improve readability

% apCellModelsState(5,:) = updatedVoltages;

% this makes sections 1 and 6 a lot faster
%    0.0003    0.0221    8.9259    0.0441    0.0062    0.4527    0.0001

%% b vectorising AssemblyFiniteDifferencesRightHandside
% 
% 	output	of	 this	 function	is	a	vector	resulting	 from	an	algebraic	
% operation	applied	to	some	input	vectors. Vectorise	this	operation	and	the	
% assignment


%     0.0025    0.0255    9.0904    0.0017    0.0042    0.7504    0.0007

% section 1 is now slower but section 4 is faster


