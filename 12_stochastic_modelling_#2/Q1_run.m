%% code to run Q1

S = [1,0,-1,0; 0,1,0,-1];
n_0 = [5 1];
T_f = 5000;

N_sim = 20; % number of simulations
N_t = 5000; % number of points in the time grid

% create a grid between 0 and T_f with N_t points
t_i = linspace(0, T_f, N_t)';
x_1i = zeros(N_sim, length(t_i));
x_2i = zeros(N_sim, length(t_i));
%run for loop in parallel
parfor jj = 1 : N_sim
    rng('shuffle')
    [t,x] = ssa_algo(n_0,T_f, S, @props_Q1)
    
    % interpolate(x(:,ii) at the points t_i
    x_1i(jj,:) = interp1q(t,x(:,1),t_i);
    x_2i(jj,:) = interp1q(t,x(:,2),t_i);
end


parfor kk = 1:N_t
    x_1i_mean(kk) = mean(x_1i(:,kk));
    x_2i_mean(kk) = mean(x_2i(:,kk));
% IV. compute standard deviation of x_4i over the first dimension
    x_1i_std(kk) = std(x_1i(:,kk));
    x_2i_std(kk) = std(x_2i(:,kk));
end




% plot(t_i,x_1i(1,:))
% 



% 
% inds_ = 1:100:N_t;
% figure(1);
% errorbar(t_i(inds_), x_2i_mean(inds_), x_2i_std(inds_))
% hold on
% errorbar(t_i(inds_), x_1i_mean(inds_), x_1i_std(inds_))
% hold on
% % 
% title({'stochastic algorithm with parameters from part a'})
% 
% 


% figure(2);
% plot(,x_1i_mean, , x_2i_mean)