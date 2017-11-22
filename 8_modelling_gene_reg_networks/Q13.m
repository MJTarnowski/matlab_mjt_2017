%% Q 13 a - positive autoregulation


% function dxdt = deriv(x,y)
% a = 1;
% b0 = 1;
% b1 = 1;
% dxdt = b0 + b1*x - a*x;
% end
% 
% function plotit()
% [t,a] = ode45(@deriv,[0,5],0);
% [t,b] = ode45(@improved_deriv,[0,5],0);
% figure
% plot(t,a,'-o', t, b,'-.')
% end

% for the steady state conc of X , xss to be positive:
% dxdt = 0 at xss 
% this leads to the condition that b1 > a for xss > 0

%% Q 13 b
% positive autoregulation slows down response time compared to simple
% regulation (see slide 21 in lecture)
% this is because a large population of gene product must build up before
% positive autoregulation begins occuring

%% Q 13 c

%the following model (improved deriv) is better than the previous model
%because it is more robust 
% function dxdt = improved_deriv(x,y)
% a = 1;
% b0 = 1;
% b1 = 1;
% K = 1;
% dxdt = b0 + b1*(x/(x+K)) - a*x;
% end

%% 13d - useful in biology to adjust systems response to stimuli

