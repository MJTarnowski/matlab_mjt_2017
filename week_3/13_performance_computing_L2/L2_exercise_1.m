%% L2 - ex1 - q a

% systemMatrix = sparse(systemMatrix);


%% L2 - ex1 - q b

%plot bar chart of times
% figure
% bar(times)
% xlabel('section')
% ylabel('time taken (s)')
% title('bar chart of time taken for each section in code')

%1 Setting	up	the	simulation
%2 Assembling	system	matrix
%3 Solving	cell	models
%4 Assembling		right-hand-side
%5 Solving	linear	system
%6 Visualising	the	results
%7 Postprocessing	the	results

% therefore section 2 is matrix assembly
% and section 5 is solving the linear system

%   matrix type     matrix assembly (sec2)          solve linear sys (sec5)
%   dense           0.0071s                            ~28s
%   sparse          0.0228s                             ~3s

%all times:

% dense     0.0008    0.0071    8.9705    0.0450   27.7374    0.5387    0.0018
% sparse    0.0011    0.0228    8.9879    0.0453    3.1818    0.5531    0.0006


% - why is matrix assembly is slower for a sparse matrix
% solving linear system is faster for sparse matrix