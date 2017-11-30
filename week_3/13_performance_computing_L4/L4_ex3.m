%% ex3
% 
% “In	computing,	cross-platform,	or	multi-platform,	is	an	attribute	conferred	to	
% computer	 software	 or	 computing	 methods	 and	 concepts	 that	 are	
% implemented	 and	 inter-operate	 on	 multiple	 computer	 platforms.	 Crossplatform
%  software	 may	 be	 divided	 into	 two	 types;	 one	 requires	 individual	
% building	or	compilation	for	each	platform	that	it	supports,	and	the	other	one	
% can	 be	 directly	 run	 on	 any	 platform	 without	 special	 preparation,	 e.g.,	
% software	 written	 in	 an	 interpreted	 language	 or	 pre-compiled	 portable	
% bytecode	 for	 which	 the	 interpreters	 or	 run-time	 packages	 are	 common	 or	
% standard	components	of	all	platforms.”
% 
% MATLAB	 code	 belongs	 to	 the	 latter	 group.	 Provided	 that	 MATLAB	 (i.e.	 ”the	
% interpreter”)	is	installed	in	a	target	machine,	you	can	run	the	code regardless	of	
% the	 target	 machine	 architecture. However, compiled	 C	 code	 (and	 therefore	
% MATLAB	 MEX binary files)	 belongs to	 the	 former,	 i.e.	 one	 requires	 individual	
% compilation	for	each target	architecture.

%% a

% this is an issue for C if submitting our code to a windows cluster 
% because any code must be precompiled for windows instead of linux

% for linux, mexa64 compiled format is used 
% for windows, mexmaci64 compiled format is used 