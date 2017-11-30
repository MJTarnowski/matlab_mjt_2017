%example input number of molecules of each species

% you must input number of molecules as a vector for this to run
% eg n = [2 2 2 2] where n is the number of molecules of each species
% output is a vector of the reaction propensities

%the input n is going to have 17 possibilities
function v = props(n)

%low
khat1 = 2;
% high 
khat2 = 1;

v(1) = khat1;
v(2) = khat2*n(2);
end
