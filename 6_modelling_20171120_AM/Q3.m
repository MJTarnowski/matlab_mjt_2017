%% Q3

% first load the laplacian matrix
L = load('Q3_matrix.mat')

% for some reason the matrix is stored within the object L... as L.b1

%here is the diagonal matrix
D = diag(diag(L.b1))

% here is the adjacency matrix
A = D - L.b1

% A^2 = A * A
% A^2 is the matrix which shows all connections between vertexes which
% have a length of 2 edges
A2 = A*A

% A3 is the same but connections with length of 3 edges (the count for each
% matrix element corresponds to the number of different pathways between
% the 2 vertices corresponding to that matrix element
A3 = A2 * A
% also A3 = A^3 would work

% An shows number of times you can reach a given vertex from another matrix
% element by passing through n different edges

