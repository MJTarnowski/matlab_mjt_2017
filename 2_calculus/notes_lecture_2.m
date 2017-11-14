%% introduction to MATLAB notes

% Matthew Tarnowski
% 14th November 2017
% synthetic biology 
% day 2 of DTC MATLAB module
% read on for notes and exercises

%% summary

%roots
%numerical differentiation
%numerical integration

%% lecture notes


y = x^2

roots(y)
%fzero,fsolve is similar to fzero but it takes a vector vvalued function
%for systems of equations rather than single equations
% fourier series decomposes your function f(x) in to series fo cos and sin
% functions

% taylor expansion is an approximation of your function around a given point
% eg at a given point, xi, you will look at x and y at x+1 and x-1
% if your at one end of the vector such that x-1 or x+1 is not given then
% you can just use forward difference or backward difference to just use
% the information that is available

%diff
%gradient
%del2 - calculates the second gradient of your function in terms of x plus
%the second gradient of your function in terms of y

%syms is symbolic differentiation like you do it by hand on pen and paper


%numerical integration - rectangle rule, trapezium rule, simpson's rule
% the equations on his slide aren't fully correct so look them up online

% sum returns sum of entrie of a vector
% trapz
%quad(myfun,a,b)


%% worked example of bisection method in matlab

%first question in todays exercises
%f(a) < 0 and % f(b) > 0
% this means that the function must cross the x axis between 0 and 1

a = 0;
b = 1;

%we will use an anonymous function (similar to lambda functions in python
%or C++ or java)
% an anonymous function makes things easier because that way you don't have
% to create a whole nother file and you can just write it in line
f = @(x) 3*x + sin(x) - exp(x);

%use f(x,y) to write anon function with multiple variables
% you can take a normal function and turn it in to an anonymous function by
% doing stuff like f = @sin .. this turns sin in to an anon function.. some
% functions in matlab require this
%


%no particular tolerance given
i = 0;
while abs(b-a) > 0.00001
    i = i+1;
    c = (a + b) / 2;
    if f(c) < 0
        a = c;
    elseif f(c) > 0
        b = c;
    else
        a = c;
        b = c;
    end
end

fprintf('f(x) = 0 at x = %f. Took %d iterations',c,i)

%there is also a disp function as well as fprintf but its more annoying
%appazappazappazappazappazappazappazappazappaz

%this q wants the root and asks you how many bisections are necessary
% therefore you need to put in a loop counter
%% notes

% eoin recommended using /etc/fstab to make a permanent mount of your sd
% card in a certain place (eg /usr/home) which you can probably use to download matlab or
% other programs in to
% but he said not to save thesis or other important files on to it as SD
% cards are not made for more than 1000x writes at each cell (bit); they
% are more for storage



%% questions

% are there other matlab modules that I will need to download for the
% course