%% ex2 

%% part a 
% 
% Replace	 job=createJob() with	
% job=createCommunicatingJob() to	 create	 a	 job	 capable	 of	
% running	 parfor loops
% 
% You	 can	 only	 define	 one	 task	 inside	 each	
% communicating	 job.	 This	 task	 will	 be	 able to	 use	 multiple	 MATLAB	
% workers

%% part b

% job=createCommunicatingJob()
% job.NumWorkersRange = [#workers #workers]

