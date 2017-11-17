%% Q5 - sparse matrices

% matlab has sparse versions of most inbuilt functions which operate much
% faster than their dense counterparts

A=diag(diag(2*ones(100)))+diag(ones(99,1),1)+diag(ones(99,1),-1);

%Number of nonzero matrix elements
nnz(A)
%Visualize sparsity pattern
% plots the sparsity pattern of any matrix S.
spy(A)

%looking at a different pattern: the connectivity graph of buckminster
%fuller geodesic dome/ football / c60 molecule
B = bucky;
spy(B)

Ainv=inv(A);
spy(Ainv)

%to give an idea of what happens to the matrix, here is analysis of
%Ainv(1:3,1:3)
E = [2 1 0; 1 2 1; 0 1 2]
inv(E)

Ainv(1:3,1:3)

%sparse creates a sparse matrix
B=sparse(A);
spy(B)

% to demonstrate what is happening:
F=sparse(E);
spy(F)

% spy(A-B) example for simpler example
%spy(E-F)
% no pattern is shown because F is the same as E, just a sparse format of
% the matrix

%% whos

% this command shows that A uses 16 fold more space than B
%A inv has lots of non-zero entities because the way that inversing a
%matrix works means that the diagonal matrix is spread outwards through the
%matrix once it has been inverted



% Name        Size             Bytes  Class     Attributes
% 
%   A         100x100            80000  double              
            
%   B         100x100             5576  double    sparse    

%% more sparse matrices

% speye command - this is a sparse identitiy matrix

speye(5)

%Sparse uniformly distributed random matrix
% sprand(m,n,d) gives mxn matrix with rand value density of 10%
C=sprand(10,10,0.1)
spy(C)
% to find the random values:
[i,j,v] = find(C)
%to find the matrix locations where the values have been placed in the
%matrix
[i,j]=find(C>0.5)


% spdiags:  Extract and create sparse band and diagonal matrices
t = spdiags(ones(10,1),10,10)
% spdiags(A,d,m,n) where A is matrix and d is density and m and n are
% matrix dimensions
s = spdiags(ones(10,1)*[-1,2,-1],[-1,0,1],10,10)
spy(t)
clear



%% 5b - 

% eye gives square identity matrix 

A=2*eye(500)-diag(ones(499,1),1)-diag(ones(499,1),-1);

tic, A*A; toc
B=spdiags(ones(500,1)*[-1,2,-1],[-1,0,1],500,500);
tic, B*B; toc

% B is sparse so it is much quicker to perform matrix multiplication#

b=ones(500,1);

tic,A\b; toc
tic, B\b; toc

% it is much faster to do N\b for sparse matrices