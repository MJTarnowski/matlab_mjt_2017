%% Q7 - two species symbiosis

%% Q 7a.

% this math model describes growth of x1 and x2 at rate r1 and r2 respectively 
%to give more of themselves over time
% also there is a symbiotic relationship whereby when x1 and x2 meet, x1
% grows at rate a1 and x2 grows at rate a2

%% Q 7b - symbiosis model including death of x1 and x2

% yes this model is better, di represents death of population i
% a biologically meaningful steady state of this model is for example a
% state where the population of each species is not changing

%% Q 8a

%here is a representation of the change in each substrate (rows

%initialise species as symbols
syms a b c d e f


S = [-a*b, 0, 0; ...
    -a*b, d, 0; ...
    a*b, 0, -c; ...
    a*b, -d, 0; ...
    0, 0, c;
    0, 0, c];

%initialise the symbols v1,v2,v3
syms v1 v2 v3

% v1 = 10
% v2 = 100
% v3 = 1000

v = [v1;
    v2;
    v3];

xdot = S * v

%% find conservation relationships to reduce model to three diff equations 


% the three algebraic relationships are:
% E - F = cst    
% A + C + E = cst
% B + D = cst

% and the three differential equations are:
% dedt = dfdt  => just include dedt as dfdt can be calculated from E
% dbdt = -dddt => just include dbdt
% dcdt = -dadt - dedt => just include dadt



%% Q 8b - solve for steady state concentrations as function of rate concentrations

% at the steady state all differential equations equal zero 

% from the equations above, 

% see Q sheet

%% Q 8c
% continued in different file because function files must have function at
% start of file in matlab
% a = 1
% b = 1
% c = 0.5
% d = 0
% e = 0
% f = 0
% 
% v1 = 3 
% v2 = 1
% v3 = 4

a = 1;
b = 1;
v1 = 3;
dadt = -3;

function dadt_function()
[t,a] = ode45(@deriv,[0,10],1);
figure
plot(t,a,'b')
end

function dadt = deriv(t,a)
a = 1;
b = 1;
v1 = 3;
dadt = -3;
end


% 
% function SolveSimple1()
% [x,y] = ode45(@deriv,[0,10],1);
% figure
% plot(x,y,'b')
% end
% 
% function dydx = deriv(x,y)
% dydx = x^2;
% end