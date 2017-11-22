%% Q 8 c
function dadt_function()
a = 1;
b = 1;
c = 0.5;
d = 0;
e = 0;
f = 0;

v1 = 3; 
v2 = 1;
v3 = 4;

[t,a] = ode45(@deriva,[0,5],a);
[t,b] = ode45(@derivb,[0,5],b);
figure
plot(t,a,'-o', t, b,'-.')
end

function dadt = deriva(t,a)
%a = 1;
b = 1;
c = 0.5;
d = 0;
e = 0;
f = 0;

v1 = 3; 
v2 = 1;
v3 = 4;
dadt = -a*b*v1;
end

function dbdt = derivb(t,b)
a = 1;
%b = 1;
c = 0.5;
d = 0;
e = 0;
f = 0;

v1 = 3; 
v2 = 1;
v3 = 4;
dbdt =  d*v2 - a*b*v1;
end
