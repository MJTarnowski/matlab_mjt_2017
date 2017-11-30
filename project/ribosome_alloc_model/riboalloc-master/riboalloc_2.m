function out = riboalloc_2 (R_pool, a_e, a_h, N_e, N_h, t_e, t_h, s_h, t_end)
%--------------------------------------------------------------------------
% Model of the ribosome usage between two different types of transcripts:
% (i) an endogenous "average" transcript, and (ii) a heterologous foreign
% transcript. The model consists of the following parameters, provided as
% arguments to this function:
%
%   R_pool:   number of total ribosomes in the cell.
%
%   a_e/a_h:  translation initiation rates for endogenous and heterologous 
%             transcripts.
%
%   N_e/N_h:  number of endogenous and heterologous transcripts.
%   
%   t_e/t_h:  translation time of the endogenous and heterologous 
%             transcripts.
%
%   s_h:      ribosome sites per heterlogous transcript.
%
%   t_end:    length of time to simulate for.
%
%--------------------------------------------------------------------------
% Author:  Thomas E. Gorochowski
% Updated: 19th August 2015
% License: GNU GPLv3 license
%--------------------------------------------------------------------------

    % Delays for the [endogenous, heterologous] number of transcripts
% added lag for h1 and h2
    lags = [t_e, t_h(1), t_h(2)];
    max_t = max(lags);
    
    % Solve the equation over the interval [0, t_end]
    options = ddeset('AbsTol',1e-6);
    out = dde23(@ddeRiboAlloc, lags, @ddeRiboAllocHis, [0, t_end], options);
    
    % The DDE equation to solve
    function dydt = ddeRiboAlloc(t,y,Z)
        % Grab the historical states
        
        ylag_e = Z(:,1);
        ylag_h1 = Z(:,2);
        ylag_h2 = Z(:,3);
        
        % Variable to store derivative
        dydt = zeros(3, 1);
        
        % Ribosome allocation (now)
        R_e = y(1);
        R_h(1) = y(2);
        R_h(2) = y(3);
        R_f = R_pool - R_e - R_h(1) - R_h(2);
        % Ribosome allocation (delayed for t_e)
        R_e_de = ylag_e(1);
        R_h_de(1) = ylag_e(2);
        R_h_de(2) = ylag_e(3);
        R_f_de = R_pool - R_e_de - R_h_de(1) - R_h_de(2);
        % Ribosome allocation (delayed for t_h(1))
        R_e_dh1 = ylag_h1(1);
        R_h_dh1(1) = ylag_h1(2);
        R_h_dh1(2) = ylag_h1(3);
        R_f_dh1 = R_pool - R_e_dh1 - R_h_dh1(1) - R_h_dh1(2);
        % Ribosome allocation (delayed for t_h(2))
        R_e_dh2 = ylag_h2(1);
        R_h_dh2(1) = ylag_h2(2);
        R_h_dh2(2) = ylag_h2(3);
        R_f_dh2 = R_pool - R_e_dh2 - R_h_dh2(1) - R_h_dh2(2);

        
        
        % Calculate the probability of collision (proportional to density)   
        Pc_h(1) = R_h(1)/(N_h(1)*s_h(1));
        if Pc_h(1) < 0; Pc_h(1) = 0; end
        if Pc_h(1) > 1; Pc_h(1) = 1; end
        Pc_h_dh(1) = R_h_dh1(1)/(N_h(1)*s_h(1));
        if Pc_h_dh(1) < 0; Pc_h_dh(1) = 0; end
        if Pc_h_dh(1) > 1; Pc_h_dh(1) = 1; end
       
        % duplicate for h2
        Pc_h(2) = R_h(2)/(N_h(2)*s_h(2));
        if Pc_h(2) < 0; Pc_h(2) = 0; end
        if Pc_h(2) > 1; Pc_h(2) = 1; end
        Pc_h_dh(2) = R_h_dh2(2)/(N_h(2)*s_h(2));
        if Pc_h_dh(2) < 0; Pc_h_dh(2) = 0; end
        if Pc_h_dh(2) > 1; Pc_h_dh(2) = 1; end
        

        
        % Rates on mRNA taking collisions into account
        Rc_h(1) = (s_h(1)/t_h(1))*(1-Pc_h(1));
        Rc_h_dh(1) = (s_h(1)/t_h(1))*(1-Pc_h_dh(1));
        % duplicate for h2
        Rc_h(2) = (s_h(2)/t_h(2))*(1-Pc_h(2));
        Rc_h_dh(2) = (s_h(2)/t_h(2))*(1-Pc_h_dh(2));
        
        % Effective initation rates (cannot exceed rate on mRNA)
        eff_a_h(1) = a_h(1) ;
        if eff_a_h(1) > Rc_h(1); eff_a_h(1) = Rc_h(1); end
        eff_a_h_dh(1) = a_h(1);
        if eff_a_h_dh(1) > Rc_h_dh(1); eff_a_h_dh(1) = Rc_h_dh(1); end
        
        % duplicate for h2
        eff_a_h(2) = a_h(2) ;
        if eff_a_h(2) > Rc_h(2); eff_a_h(2) = Rc_h(2); end
        eff_a_h_dh(2) = a_h(2);
        if eff_a_h_dh(2) > Rc_h_dh(2); eff_a_h_dh(2) = Rc_h_dh(2); end
        
        % Handle the history at the start of the simulation
        if t < t_e
            dydt(1) = (R_f * a_e * N_e);
        else
            dydt(1) = (R_f * a_e * N_e) - (R_f_de * a_e * N_e);
        end
        if t < t_h(1)
            dydt(2) = (R_f * eff_a_h(1) * N_h(1));
        else
            dydt(2) = (R_f * eff_a_h(1) * N_h(1)) - (R_f_dh1 * eff_a_h_dh(1) * N_h(1));
 %                                                 - (R_f_dh2 * eff_a_h_dh(2) * N_h(2));
        end
        if t < t_h(2)
            dydt(3) = (R_f * eff_a_h(2) * N_h(2));
        else
            dydt(3) = (R_f * eff_a_h(2) * N_h(2)) - (R_f_dh2 * eff_a_h_dh(2) * N_h(2));
                                                  
%                                                  - (R_f_dh1 * eff_a_h_dh(1) * N_h(1))...
        end
    end

    % Provide initial historical conditions
    function s = ddeRiboAllocHis(t)
        s = zeros(3, 1);
    end
end
