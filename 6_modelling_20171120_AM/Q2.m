%% construct adjacency matrix

% i used the variable tab to modify a matrix variable such that it is the
% adjacency matrix and I saved this as adjacency_matrix1.mat
% here I load that file in to the workspace
load('adjacency_matrix1.mat')

% naming issues.. 
adjacency_matrix = adjacency_matrix1

% printmat(adjacency_matrix,'adjacency_matrix')

%% diagonal vector

l = length(adjacency_matrix);
diag_vector = zeros(1,l);

%fill diag matrix
for i = 1:l
    diag_vector(i) = sum(adjacency_matrix(i,:));
end

%diagonalise the elements
degree_matrix = diag(diag_vector)

%printmat(degree_matrix,'degree_matrix')


%% construct laplacian matrix

laplacian_matrix = degree_matrix - adjacency_matrix

%printmat(laplacian_matrix,'laplacian_matrix')

% g = graph(adjacency_matrix)
% laplacian_matrix = laplacian(g)


%% diameter of a graph

% this is the max shortest distance between any two vertices (excl back
% tracking and looping)

% the diameter of figure 1 is the distance between the vertices 5 and 3
% * diameter is 3 *


