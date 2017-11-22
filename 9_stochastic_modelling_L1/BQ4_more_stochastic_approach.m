%% function

function [t, x] = ssa_algo(x_0, T_f, Stoich, propensities)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stochastic simulation direct method
% Inputs:
% x_0 - Initial number of species
% T_f - Final simulation time
% Stoich - stoichiometric matrix
% propensities - function returning propensities
% given the number of species
% Outputs:
% t - times when reactions occur
% x - matrix with number of species at time t
% Its number of rows is equal to the length of t
% Its number of columns is equal to the
% number of species
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Next few lines of code are not important:
if (length(propensities(x_0)) ~= size(Stoich, 2))
    throw(MException('SSA:Error',...
        'Dimension inconsistency in Stoich and props(x_0)'))
elseif (size(Stoich,1) ~= length(x_0))
    throw(MException('SSA:Error',...
        'Dimension inconsistency in Stoich and x_0'))
end
% setting current time, number of species and the number
% of occured reactions
t_cur = 0;
x_cur = x_0;
i = 1;
while t_cur <= T_f
    x(i,:) = x_cur;
    t(i) = t_cur;
    % getting the values of propensity functions
    v = propensities(x_cur);
    v_0 = sum(v);
    % if v_0 is equal to zero, then no reaction will
    % ever occur, we terminate
    if( v_0 == 0 )
        i = i + 1;
        break
    end
    
    % II. Generate the number of the next
    % reaction n_reac where
    % P(i = n_reac) = v_i(n)/v_0(n)
    % ie 
    Re1 = v(1)/v_0;
    if rand(1) < Re1
        n_reac = 1;
    else
        n_reac = 2;
    end
%     
%     
%     for n = 1:length(v)
%         Pn(n) = v(n)/v_0;
%         if Pn(n) > maxP
%             maxP = Pn(n);
%             n_reac = n;
%         end
%     end
%     %reset maxP
%     maxP = 0;
    
    % I. Generate tau using the exponential distirubtion
    % with parameter v_0
    tau = (1/v_0)*log(1/rand(1));
    % updating current time, number of species and
    % the number of occured reactions
    x_cur = x_cur + Stoich(:, n_reac)';
    t_cur = t_cur + tau;
    i = i + 1;
end
x(i,:) = x_cur;
t(i) = T_f;
t = t(:);

%now plot the results on a graph
plot(t,x(:,:))
xlabel('time')
ylabel('number of molecules')
legend('X1','X2','X3','X4')

end

%% input properties:

% x_0 = [10 10 10 10]
% T_f = 10 ?? (this is final simulation time)
% Stoich = [-2, 0; 1, -1; 0, -1; 0, 1]
% propensities = props (??)

%% unused code


    % r = [];
    % randno = rand(1);
    % for j = 1:length(v)
    %     r(j) = rand(1);
    % end
    % 
    % if randno < r(1)




    % for n = 1:(T_f - t_cur)
    %     Pn = v_i(n)/v_0(n);
    %     if Pn > 0.999
    %         n_reac = n;
    %     end
    % end