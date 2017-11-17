%% Q2 from linear algebra worksheet

%create a square matrix of random numbers using randn(dimension)
A = randn(512);
% matrix b is of dimensions (512 x 1) ie one column of 512 random numbers
b = randn(512,1);


% length returns the length of the largest array dimension
length(A)
length(b)

%gives size of matrix dimensions
size(b)

% to get the final element in a matrix use matrix(end)
b(end)

%to get the n-5 elements of a matrix plus the last element:
b(end-5:end)

% elements are counted by individual rows then columns
F = [1:3;4:6;7:9]
F(end-4:end)

G = randn(5,3)
%triu(F) gives the upper triangle of F iincluding the diagonal
triu(G)

%tril(F) gives the lower triangle of F including the diagonal
tril(G)

%diag gives a list of the values of the matrix along the diagonal
diag(G)

%to turn the list of diagonal elements in to a diagonal matrix, use the
%diag function recursively
diag(diag(G))

F
F'


clear
