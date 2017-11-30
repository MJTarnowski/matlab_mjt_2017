function [t, x] = ssa_algo(x_0, T_f, Stoich, propensities)
echo on
%run using this command:
% ssa_algo([5, 1],5000, [1,0,-1,0; 0,1,0,-1], props_Q1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stochastic simulation direct method
% Inputs:
% x_0          - Initial number of species
% T_f          - Final simulation time
% Stoich       - stoichiometric matrix 
% propensities - function returning propensities
%                given the number of species
% Outputs: 
% t      - times when reactions occur
% x      - matrix with number of species at time t
%          Its number of rows is equal to  the length of t
%          Its number of columns is equal to the 
%                               number of species
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if (length(propensities(x_0)) ~= size(Stoich, 2)) 
        throw(MException('SSA:Error',...
            'Dimension inconsistency in Stoich and props(x_0)'))
    elseif (size(Stoich,1) ~= length(x_0))
        throw(MException('SSA:Error',...
            'Dimension inconsistency in Stoich and x_0'))
    end
    % setting current time, number of species and the number of occured
    % reactions
    t_cur = 0;
    x_cur = x_0;
    i = 1; 

    while t_cur <= T_f 
        x(i,:) = x_cur;
        t(i) = t_cur;

        % getting the values of propensity functions
        v   = propensities(x_cur);
        v_0 = sum(v); 
        % if v_0 is equal to zero, then no reaction will ever occur,
        % we terminate
        if( v_0 == 0 )
            i = i + 1;
            break
        end
% I. Generate tau using the exponential distirubtion 
% with parameter v_0 
        tau = log(1/rand)*1/v_0;

% II. Generate the number of the next  
% reaction n_reac where 
% P(i = n_reac) = v_i(n)/v_0(n)
        p = zeros(length(v),1);
        for k = 1 : length(v)
            p(k) = sum(v(1:k));
        end
        n_reac = find(p - rand*v_0*ones(length(v), 1) > 0, 1, 'first');

        % updating current time, number of species and the number of occured
        % reactions
        x_cur = x_cur + Stoich(:, n_reac)';
        t_cur = t_cur + tau;
        i = i + 1;
    end
    x(i,:) = x_cur;
    t(i) = T_f;
    t = t(:);
end