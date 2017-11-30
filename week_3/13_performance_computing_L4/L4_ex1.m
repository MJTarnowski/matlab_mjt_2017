%% eExercise	1:	Writing	a	MATLAB	submission	script.

% Submitting	jobs	locally


%% part a - c

% task - creates a task within a job
% t = createTask(j, F, N, {inputargs})
% t
% Task object or vector of task objects.
% j
% The job that the task object is created in.
% F
% A handle to the function that is called when the task is evaluated, or an array of function handles.
% N
% The number of output arguments to be returned from execution of the task function. This is a double or array of doubles.


% job - Create independent job on cluster
% obj = createJob(cluster)


%% ex1 part d

% sched = parcluster();
% job = createJob(sched);
% task = createTask(job, @RunAndVisualiseMonodomainSimulation,3,{50,1.5,1.4,1.4,false});
% task2 = createTask(job, @RunAndVisualiseMonodomainSimulation,3,{120,1.5,1.4,1.4,false});
% submit(job);
% wait(job,'finished');
% job_results  = fetchOutputs(job);


