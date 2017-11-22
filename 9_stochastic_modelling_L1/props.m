%example input number of molecules of each species

% you must input number of molecules as a vector for this to run
% eg n = [2 2 2 2] where n is the number of molecules of each species
% output is a vector of the reaction propensities

function v = props(n)
k1 = 1;
k2 = 2;

khat1 = (2*k1*1*10^9)/((6.022*10^23)*(5*10^-15));
khat2 = (k2*1*10^9)/((6.022*10^23)*(5*10^-15));

v(1) = khat1*n(1)*(n(1)-1)/2;
v(2) = khat2*n(2)*n(3);
end
