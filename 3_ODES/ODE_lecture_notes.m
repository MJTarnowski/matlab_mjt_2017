%% ODE lecture notes

%matlab expects ODE in the standard form
%solve simple problems analytically

% for the problems in the sheet you just need to use the methods of:
%  - separable solutions
% - integrating factor
% - auxiliary equation
% he will give examples at the end

%numerical differentiation can be used to solve normal odes too

% the euler method
% pay attention to initial conditions\
% forward euler is explicit
% backward euler is implicit
% essentially this refines sth until you get a value that is sufficiently
% small

% implicit methods are unconditionally stable - doesn't matter how big
% delta x is, it'll always be stable, just that the error may be huge

%explicit methods more accurate but unstable cf implicit methods less accurate
%but more stable

% for higher order ODES
% introduce a substitution such that d/dx = z hence d2y/dx2 =dz/dx
%these can be extended to higher order ODES

% runge kutte - take single step and divide it in to multiple points
% matlab can use each of these methods

%matlab has many functions for solving odes but in practice you only use
%two of them: ode45 (explicit) and ode15s (implicit)
%thus generally you go with ode45 first and if it explodes or doesn't work
%then try ode15s

%explicit method means you can go instantly from one step to the next step
% implicit means you have to solve an equation to go from one step to the
% next

% errors accumulate over time for unstable methods
% if you have an equation for the error then it would increase exp
% thus your numerical solution would be diverging from the true solution

%matlab chooses its points intelligently
% the functions  will return a vector of values at which it solved the
% equation



% example problem
function SolveSimple(y0)
[x,y] = ode45(@deriv,[0,1],y0);
plot(x,y,'b');

function dydx = deriv(x,y)

dydx = x*y;



%this returns two vectors, first one has all the values of x it chose to
%solve the equation at and y which it thinks are the results

% integrating factors - multiply through by the integrating factor and then
% use the product rule to simplify