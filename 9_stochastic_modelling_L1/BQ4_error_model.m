function res = error_model(fun, x_0, T_f, Stoich, propensities)
%select number of times to repeat algorithm
nrepeats = 10;

%create matrix for storing different values of each x(n)



x1 = [];
x2 = [];
x3 = [];
x4 = [];

for i = 1:nrepeats
    [t,x] = fun(x_0, T_f, Stoich, propensities);
    x1(,i) = x(1);
    x2(,i) = x(2);
    x3(,i) = x(3);
    x4(,i) = x(4);
    t(,i) = t
    