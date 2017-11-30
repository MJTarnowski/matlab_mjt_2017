%example input number of molecules of each species

% you must input number of molecules as a vector for this to run
% eg n = [2 2 2 2] where n is the number of molecules of each species
% output is a vector of the reaction propensities

%the input n is going to have 17 possibilities
function v = props_Q1b(n)
% v = zeros(,4);
a1 = 10;
a2 = 10;

b1 = 6;
b2 = 6;

d1 = 1;
d2 = 1;

v(1) = a1/(1+(n(2)^b1));
v(2) = a2/(1+(n(1)^b2));
v(3) = d1*n(1);
v(4) = d2*n(2);

end
