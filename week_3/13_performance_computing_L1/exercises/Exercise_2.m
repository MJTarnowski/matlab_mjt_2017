%% exercises 2 - : Instrumenting	the	code

%% ex2 - part a

% Use	the	tic and	toc MATLAB	functions	in	order	to	instrument	the	code.	
% The	 objective	 is	 being	 able	 to	 extract	 the
% time	 taken	 by	 the	 7	 main	
% sections

% You	will	need	to	use
% a	 counter	 that	 gets	 updated	 at every	 iteration	


%timer =
% section:

% 1         Setting	up	the	simulation
% 2         Assembling	system	matrix
% 3         Solving	cell	models
% 4         Assembling		right-hand-side
% 5         Solving	linear	system
% 6 a-c     Visualising	the	results
% 7         Postprocessing	the	results
% 

%       1         2         3       4           5       6(a-c)      7
result = [
   0.0021    0.0005    4.7025    0.0000    0.0001    1.4253    0.0000 
   0.0002    0.0001    4.7142    0.0000    0.0001    1.4477    0.0000
   0.0001    0.0001    4.7080    0.0000    0.0001    1.4767    0.0000
   0.0001    0.0002    4.7093    0.0000    0.0001    1.5066    0.0000
   0.0001    0.0001    4.7208    0.0000    0.0001    1.4650    0.0000
   ]
%averages;

mean_times = zeros(1,7);
for i = 1:7
    mean_times(1,i) = mean(result(:,i));
end

mean_times
total_time = sum(mean_times)

% percentage of total time:

pct_total= zeros(1,7);
for i = 1:7
    pct_total(1,i) = (mean_times(1,i) / total_time)*100;
end

pct_total

% this shows the time taken for sections 1-6



%% ex2 qc - repeat with these parameters: (3000,0.5,1.4,1.4,true)


result2 = [
    0.0035    7.7889    9.3867    0.0018    0.5489    0.3743    0.0000
    0.0023    7.8213    9.2604    0.0017    0.5530    0.4231    0.0000
    0.0012    8.6844    9.3406    0.0017    0.5537    0.3327    0.0000
    ]

%i only ran this three times as it was slow and the time results seemed
%consistent between runs

%averages;

mean_times2 = zeros(1,7);
for i = 1:7
    mean_times2(1,i) = mean(result2(:,i));
end

mean_times2
total_time2 = sum(mean_times2)

% percentage of total time:

pct_total2= zeros(1,7);
for i = 1:7
    pct_total2(1,i) = (mean_times2(1,i) / total_time2)*100;
end

pct_total2

% this shows the time taken for sections 1-6

% the main differences are that 
% section 2 now takes 44% of the time compared to <0% for the previous
% parameters
% section 6 takes 10X less time (for visualisation) presumably because
% there is less to visualise since no signal is propagated during 
% the simulation time 


