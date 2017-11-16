%% linear algebra

% mat lab is all about linear algebra
% it started as a way to access more comprehensive libraries
% matlab stands for matrix laboratory
% calculus was fsolve; odes - putting derivatives in matrix form... these
% two functions are powered by linear algebra. matlab 
% is entirely built on its linear algebra capability
% "all these functions are fairly useluess if you dont know how they're
% working

% singular matrices don't have an inverse

% this day's work leads on from the maths module on vectors

%% a vector is an n dimensional geometric object with both magnitude and direction
% as well as vectors there are matrices
% really a matrix reps a set of differential equations
% in the case where lines are parallel (no solutions) or the same (infinite solutions) 
% ...the matrix will be singular and has a determinant of zero
% can use planes instead of lines but it's  easier to deal with this in
% just two dimensions

%% the action of a matrix - scaling and rotating
% A*x* = *b*
% scaling related to eigen values  (changes magnitude)
% ie eva scale x by a certain amt
% rotation is related to eigen vectors
% you're generally more interested in eva as you may be repeatedly applying
% a matrix to the same vector
% eva < 1 means A^n = lambda^n x tends to zero; eva > 1 means it tends to
% infinite

% errors on slide before spectral decomposition and I didnt hear thing
% about n values - ask

%% spectral decomposition of matrices
% limited to square m
%% SVD - for any non square matrix
% V*  is first rtation matrix
% E is scaling
% U is the third rotation
% overdetermined system - more equations than unknowns

% just looking at the most important (top 10 or 20) singular values can
% tell you about the modes in your data
%% solving sys of euations
% gaussian elimination, LU decomposition are direct methods
% iterative methods are most practical way of solving an equation
% iterative processs that converges to your sollution
% there are a bunch of diff methods, we will use each one and apply them to
% one problem to compare the methods

%% jacobi method
% all relaxation methods - decompose matrix in some sort of fashion
% since the method is iterative, you need a vector to start the problem
% initial vector x0
% first new estimate x1
% the equation gives you a new value of x for your current value of x
% D^-1 is easy to calculate (1/each diagonal element)

%% relaxation methods in general
% A = M - N
% M has to be easy to invert
% M has to be dominant in some way such that M^-1 * N has a spectral radius
% < 1 and thus sth will converge to zero and you will converge to your
% result
% eg for jacobi, M = D and N = L + U
% alternative is M = D + L and N = U

% preconditioners are important to speed up relaxation methods - they are
% picked such that the new equations that you are trying to solve are
% easier
% matlab does make it easy for you but it's good to know the diff classes
% of methods

%% sparse matrices

% only store the non-zero elements to save space but also to speed up
% application to a vector

% a compact representation to speed things up and save memory

% krylov makes use of sparse matrix format

% there are direct and iterative methods to solve sparse matrices
% the iterative methods remain the same however direct methods differ 
