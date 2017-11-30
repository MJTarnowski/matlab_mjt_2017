%% Q6
   % initial number of species 
   % had to re-write n_0 as a row as that is what BQ4 takes as inputs
n_0 = [10 0 10 0];
T_f = 3; % final time of the simulation
S = [-1, 0;...% Stoichiometric matrix
    1, -1;...
    0, -1;...
    0, 1];
N_sim = 5; % number of simulations
N_t = 1000; % number of points in the time grid


%I. Create a grid between 0 and T_f with N_t points:
t_i = linspace(0,T_f,N_t)';
x_4i = zeros(N_sim, length(t_i));
for jj = 1: N_sim
    [t, x] = BQ4_more_stochastic_approach(n_0, T_f, S, @props);

    %II. interpolate x(:,4) at the points t_i:
    x_4i(jj,:) = interp1q(t,x(:,4),t_i);
end

% III. compute mean of x_4 over the first dimension
for kk = 1:N_t
    x_4i_mean(kk) = mean(x_4i(:,kk));
% IV. compute standard deviation of x_4i over the first dimension
    x_4i_std(kk) = std(x_4i(:,kk));
end



inds_ = 1:50:N_t;
figure(1);
errorbar(t_i(inds_), x_4i_mean(inds_), x_4i_std(inds_))