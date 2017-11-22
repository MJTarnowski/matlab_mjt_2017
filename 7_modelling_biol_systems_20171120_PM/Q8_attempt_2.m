%input the stoichiometry matrix
S = [-1 0 0
    -1 1 0
    1 0 -1
    1 -1 0
    0 0 1
    0 0 1]

%calculate S transpose
St = S'

% find the vectors in the null space of S transpose
null(St,'r')