%% exercise sheet 3 - ordinary differential equations

% Q1ai - y' = x^2 and y(0) = 1

function SolveSimple(y0)
[x,y] = ode45(@deriv,[0,1],y0);
plot(x,y,'b');

function dydx = deriv(x,y)

dydx = x*y;