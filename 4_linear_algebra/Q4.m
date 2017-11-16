%% eigenvalues and singular values

% eigen values are to do with scaling of vectors
% matlab has many commands to calculate eigenvalues and singular values

As=randn(2);
% generates a 10x10 square matrix of random values 
e=eig(As)
% generates the eigen values of the square matrix
f=eig(As,'matrix')
%generates eigen values and puts them in a diagonal


%below, this generates the eigen values (V) and eigen vectors (D)
[V,D]=eig(As)

% check that the eigen values and eigen vectors are correct
% they should satisfy A*V = V*D
As*V - V*D

% this should equal 0 ideally 
% Since eig performs the decomposition using 
%floating-point computations, then A*V can,
%at best, approach V*D. 
%In other words, A*V - V*D is close to,
%but not exactly, 0.


clc
%this creates a matrix Ar which contains random values
Ar = randn(10,5);

%performs a singular value decomposition of matrix Ar,
% such that Ar = U*S*V'.
[U,S,V] = svd(Ar)

%check that it worked:
Ar - (U*S*V');
% this tends to zero


% adding argument zero to svd args Finds the economy-size decomposition 
% of a rectangular matrix.
% somehow the eigen values have been compressed the output
% this may be because you can make linear combinations of some rows
[U,S,V] = svd(Ar,0)


clear