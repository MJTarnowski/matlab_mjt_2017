%% part C Q1

% firstly I will write out the stoichiometric vector

%columns are k1*A and k-1*B*C
% rows are A;B;C
S = [-1 1;
    1 -1;
    1 -1]

null(S','r')
% N0 = [Na Nb Nc]
N0 = [2 1 0];