%% worked example of using bvp4c to solve boundary condition problems
% see https://www.youtube.com/watch?v=iEep1-WnjlM

% sample problem - d^2y/dx^2 + y = 1
% y(0) = 1 and y (pi/2) = 0

%bvp4c handles both lineasr and nonlinear equations of arbitrary (any) order 
%bvp4c carries out finite differences on systems of ODEs

% sol = bvp4c(odefun,bcfun,solinit)

%odefun defines odes
% bcfun defines boundary conditions
% solinit gives an initial mesh (location of points) and guess for solutions(guesses
% are constant over mesh) - a guess is given for both y(x) and dy(x)/dx in this
% case
% for non-linear problems it has to do an iterative solution and therefore
% it needs the mesh
% thus for nonlinear problems the mesh isnt that criticial
% since bvp4c is iterative, it adjusts the mesh as needed

% just like the initial value problem solvers (ode45 etc) this routine is
% based on solving systems of first order ODEs
% so the first step we have to do is take our second order ODE and break it
% down in to a system of first order ODES


% thus y is variable #1 in  the solution vector:  y(1)
% and dy/dx = z is variable #2 in the solution vector: y(2)

% let z = dy/dx = y(2)
%therefore d2y/dx2 = dz/dx = 1-y(1)...
% therefore our second first order equation is: 1-y(1)

% thus the initial equations have been turned in to first order ODEs by
% using the substitution z=dy/dx

% thus in the function below, our second order eqn has been redefined as
% two first order equations
% function dydx = bvp4ode(x,y)
% dydx = [ y(2) 1-y(1) ];
% 
% % boundary conditions
% % ya(1) is y(1) at x = a
% % ya(2) is y(2) at x = a
% % yb(1) is y(1) at x = b
% % yb(2) is y(2) at x = b
% 
% % (a = 0 and b = pi/2)
% 
% % we need two eqns that define our BC at a point
% % this is set up like root finding so we need two equations that should be
% % zero when the BC are met
% % in our case the BC are y(1)-1 = 0 at x=a this means that our first
% % variable at x=a should be 1 
% % and y(1) = 0 at x=b
% 
% function bvp4
% sol = bvp4c(@bvp4ode,@bvp4bc,solinit);
% function res = bvp4bc(ya,yb)
% res = [ya(1)-1 yb(1)];
% % when this vector is [0 0 ] then we have satisfied our BC
% 
% % initialisation - decide how many mesh points to start with
% % we also have to provide initial guesse for y and z (=dy/dx)
% % guess is more critical for nonlinear equations
% % we will guess y=1 and z=-1
% % we also must provide a min and max value of x to set our region of
% % interest
% 
% xlow=0;
% xhigh=pi/2;
% solinit = bvpinit(linspace(xlow,xhigh,10),[1 -1]);
% %bvpinit is a routine that is built in to matlab
% % linspace is used to create 10 x values that are equally space from zero to
% % pi/2
% % we put in our initial guesses as a vector
% % so this takes our mesh, our initial guesses, sends them to bvpinit and
% % returns solinit.. we will now send solinit to bvp4c
% 
% %post processing, use linspace with the default of 100 points between xlow
% %and xhigh
% xint = linspace(xlow,xhigh);
% % deval routine evaluates the solution to our boundary value problem at the
% % ppoints we defined in xint
% Sxint = deval(sol,xint);
% % then we plot the first column of Sxint, which is our y vectors so this
% % will plot y vs x when bvp4c is done
% plot(xint,Sxint(1,:))



%% putting the code all together

% function bvp4
% xlow=0;
% xhigh=pi/2;
% solinit = bvpinit(linspace(xlow,xhigh,10),[1 -1]);
% sol = bvp4c(@bvp4ode,@bvp4bc,solinit);
% xint = linspace(xlow,xhigh);
% Sxint = deval(sol,xint);
% plot(xint,Sxint(1,:))
% 
% function dydx = bvp4ode(x,y)
% dydx = [ y(2) 1-y(1) ];
% 
% function res = bvp4bc(ya,yb)
% res = [ya(1)-1 yb(1)];



%% applying the code to problem 2(a)
function bvp4
xlow=0;
xhigh=1;
solinit = bvpinit(linspace(xlow,xhigh,10),[1, -1]);
sol = bvp4c(@bvp4ode,@bvp4bc,solinit);

x_sol = sol.x;
y_sol = sol.y;

% % xint = linspace(xlow,xhigh);
% % Sxint = deval(sol,xint);
plot(x_sol,y_sol(1,:))
end

function dydx = bvp4ode(x,y)
dydx = [ y(2); -3*y(2)+4*y(1) ];

end

function res = bvp4bc(ya,yb)
res = [ya(2); yb(1)-1];
end

%% notes

% a mesh AKA a partition of an interval
% a partition of an interval [a,b] on the real line (equation line) is a
% finite sequence of real numbers such that a = x0 < x1 < x2 < ... < xk =b
% thus it is a strictly increasing sequence of numbers belonging to the
% interval I starting from the initial point of I and ending at the final
% point of I

%% Qs 
