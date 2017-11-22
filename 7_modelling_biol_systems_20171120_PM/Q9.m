%% Q9 ai

% columns are k1, k-1, k2

S1 = [-1 1 0
    -1 1 1
    1 -1 -1
    0 0 1]

S1t = S1'
null(S1t,'r')

% in words, this enz network shows enzyme and substrate binding to form an
% interaction complex (SE) and then product formation and enzyme returning
% to its original state

%% Q9aii

S2 = [-1 1 0 0 0
      -1 1 0 0 1
      1 -1 -1 0 0
      0 0 1 -1 -1
      0 0 0 1 0
      0 0 0 0 1]
 
 null(S2,'r')
 S2t = S2'
 null(S2t,'r')
 
 % in words, this enz network represents enzyme converting substrate to an
 % interaction complex (X) and that complex forming a secon reaction
 % intermediate (Y) and then Y forms either a byproduct Z or product P
 % along with the original enzyme
 
 
 
 %% Q9aiii
 
 S3 = [-1 1 0
     1 -1 -1
     0 0 -1
     0 0 1]
 
 null(S3,'r')
 S3t = S3'
 
 null(S3t,'r')
 
 % this enz network represents A reacting with X to allow X to duplicate
 % (though this is reversible)
 % also B can react with X to irreversibly form C
 
 