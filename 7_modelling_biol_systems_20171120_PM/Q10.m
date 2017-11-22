%% Q10 a 

% despite the network not being closed, the system can still be analysed in
% terms of rate equations because all the species and rates that affect the
% system are explicit

%% Q 10 b

syms v1 v2 v3 v4 v5 v6 b1 b2 b3 b4

% flux matrix V
V = [v1 v2 v3 v4 v5 v6 b1 b2 b3 b4]'

% stoichiometry matrix S 

S = [-1 1 0 0 0
    0 -1 1 0 0
    0 1 -1 0 0
    0 0 -1 1 0
    0 0 1 -1 0
    0 0 -1 0 1
    -1 0 0 0 0
    0 -1 0 0 0
    0 0 0 -1 0
    0 0 0 0 -1];

null(S, 'r');

St = S';

NSV = null(St, 'r')

%% Q 10 c

%vt1 corresponds to eqm between B and C
vt1 = [0 1 1 0 0 0 0 0 0 0]'
% vt2 corresponds to D being produced from b3; v5 and v3 are going and so
% is b2 therefore the system pushes stuff from b3 via D, C, B and out via
% b2
vt2 = [0 0 1 0 1 0 0 1 -1 0]'
% similar to above, B is produced, conv to C then to E and then out of the
% system
vt3 = [0 1 0 0 0 1 0 -1 0 1]'

S' * vt1
S' * vt2
S' * vt3

% in each case, the vector multiplied by matrix gives zero therefore all of
% these vectors are equilibrium fluxes

