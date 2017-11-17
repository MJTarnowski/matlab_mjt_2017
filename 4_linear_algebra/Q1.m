%% q1 - EXPERIEMENT 

% THIS ADDS A VECTOR AS SINGLE ROW, 
%COMMAS INDICATE DIFFERENT ROW ELEMENTS
x=[1,2,3]
% THIS ADDS A VECTOR AS A SINGLE ROW AND TRANSPOSES IT SO THAT IT IS IN THE
% FORM OF A SINGLE COLUMN
y=[2,4,6]'
% THIS ADDS A VECTOR AS A SINGLE COLUMN
% COLONS INDICATE THE END OF A COLUMN
z=[2;4;6]

% MULTIPLICATION OF VECTORS IS NOT COMMUTATIVE 
%(ORDER MATTERS)
% THE RESULTING MATRIX HAS SAME ROWS AS FIRST MATRIX AND SAME NUMBER
% COLUMNS AS SECOND MATRIX IN THE MULTIPLICATION
x*y
y*x
% IF THE NUMBER OF COLUMNS OF FIRST MATRIX ARE NOT EQUAL TO NUMBER OF ROWS
% OF SECOND MATRIX THEN THE MATRICES CANNOT BE MULTIPLIED
% y*z

% YOU CAN MULTIPLY MATRIX ELEMENTS BY ANOTHER MATRIX IF THEY ARE THE SAME
% DIMENSIONS
% x.*y
x'.*y
% x.*z
y.*z
% YOU CAN CALCULATE THE SUM OF ALL THE ELEMENTS OF A GIVEN MATRIX USING THE
% SUM FUNCTION
sum(x)
% CALCULATE THE PRODUCT OF MATRIX ELEMENTS USING PROD()
prod(y)

% HERE IS A 3X3 MATRIX
A=[1,2,3;4,5,6;1,3,2]
% HERE IS ITS TRANSPOSE
B = A'
% HERE IS IT MULTIPLIED BY Y :
% 3 X 3 * (3 X 1) -> 3 X 1
A*y
% A MATRIX MULTIPLIED BY ITS INVERSE
A*B

% THE DETERMINANT OF A MATRIX CAN BE CALCULATED
det(A)

% MATRICES CAN BE INVERTED 
% THIS IS MUCH SIMPLER USING A MATLAB COMMAND THAN BY HAND

inv(B)

% A MATRIX MULTIPLIED BY ITS INVERSE IS EQUAL TO THE IDENTITY MATRIX 
% THE IDENTITY MATRIX IS ESSENTIAL "1" BUT IN MATRIX FORM
B*inv(B)

% In linear algebra, the trace of an n-by-n 
%square matrix A is defined to be the sum of 
%the elements on the main diagonal 
%(the diagonal from the upper left to the lower right) of A
trace(A)

% A(i,j) gives the element in the ith row and the jth column
A
A(1,2)
% using the colon gives all elements in a given row or column
A(:,2)
% more matrix slicing...
A(2,2:3)
% and re-ordering of matrix
A([2,1,3],:)

% A MULTIPLIED BY ITSELF
A^2

% EVERY ELEMENT IN A SQUARED INDIVIDUALLY
A
A.^2

%SUM OF ELEMENTS IN INDIVIDUAL COLUMNS
A
sum(A,1)
% AND IN INDIVIDUAL ROWS
sum(A,2)

% the same can be done for products
prod(A,1)
prod(A,2)

%C is created from matrix A with an extra column added
C=[A,z]

% matrix of ones can be created
ones(5,1)
% or a square matrix
ones(5)

% matrix of zeros too
zeros(1,5)

%to clear all variables from workspace, use the clear command


clear