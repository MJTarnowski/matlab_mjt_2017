%% Q2 - fsolve command

% Q 2a - oxygen saturation

% equation for oxygen saturation
S = @(P) 1 / (1 + (exp(1))^(-20 * (P - 0.2)));
figure
% fplot is useful for plotting functions, arguments are: the function and
% also second arg is a range over which the function should be applied
fplot(S,[0 1])



%2b
res = @(P) Sg - (1 / (1 + (exp(1))^(-20 * (P - 0.2))));

%2c
Sg = 0.1;
result = fsolve(res,0);