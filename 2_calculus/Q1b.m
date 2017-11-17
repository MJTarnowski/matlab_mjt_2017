%% Q1b - newton raphson method for root finding
%NR finds successively better approximations to the roots (or zeroes) of a
%real-valued function
% initial guess is x0
x0 = 1;
err_tol = 1e-7;
iteration = 0;
% this will be the difference between 
difference = 100;
%step = 0.001;

% f is the equation for which roots must be found
f = @(x) 3*x + sin(x) - (exp(1))^x;
% derivative is defined
dfdx = @(x) 3 + cos(x) - (exp(1))^x;

%start from the intial guess value
guess = x0;

% repeat NR approximation as it converges to the root 
% therefore difference between guesses should get smaller and smaller
while difference > err_tol
    
    guess1 = guess - (f(guess)/dfdx(guess));
    difference = abs(guess1 - guess);
    % set the new guess as the input for calculation of the following guess
    guess = guess1;
    %record number of iterations
    iteration = iteration + 1;
end

root = guess
iteration