f = @(x) (exp(1))^(-x);
dfdx = @(x) (-(exp(1))^(-x));
% number of steps
N = 40;

% min x
a = 0;
% max x
b = 10;

%create the steps of x to approximate over
xsteps = linspace(a,b,N);

%calculate y for each x
for n = 1:length(xsteps)
    ysteps(n) = f(xsteps(n));
end

%calculate derivative of y for each x
for n = 1:length(xsteps)
    dysteps(n) = dfdx(xsteps(n));
end

%plot the function and its derivative
figure
xlabel(x)
ylabel(y)
title('approximating derivatives')
%plot derivative
plot(xsteps,dysteps)
hold on
%plot y
plot(xsteps,ysteps)
hold on

% vector containing differences between the steps
fwd_differences = diff(ysteps)

%calculate h
h = (1/N)*(b-a);
%code for forward approximation
for n = 1:length(fwd_differences)
    fwdapprox(n) = ((fwd_differences(n))/h);
end



plot(xsteps(2:end),fwdapprox)

legend('dfdx','f','fwdapprox')




% g = @(x) x * sin(x);