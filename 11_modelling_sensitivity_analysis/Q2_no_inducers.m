%% collins toggle switch

% see this paper for details:
% https://www.nature.com/articles/35002131.pdf

%% Q2a

function solve(p0)
trange = [0, 50];
%initial protein concentrations p1 and p2 as vector
% p = [p1 p2]
p0 = [0 0];
[t, p] = ode45(@derivp, trange, p0);

% plot change in concentration of each protein over time
plot(t,p)
hold on
legend('p1','p2')
xlabel('time,t')
ylabel('protein concentration')
title({'plot of change in protein concentrations','for a collins toggle switch'})

%% Q2b

% Q 2b - *simulation with i1 = 0 and i2 = 0*

%plot the phase plane
figure
plot(p(:,1),p(:,2))
hold on
legend('phase plane')
xlabel('protein 1 concentration')
ylabel('protein 2 concentration')
title({'phase plane','comparing protein 1 and 2 concentrations','i1 = 0 and i2 = 0'})

end

%% derivative function for each protein

function dpdt = derivp(t,p)
a1 = 3;
a2 = 2.5;
% initial protein concetrations are required as input
% p1 = ;
% p2 = ;
i1 = 0;
i2 = 0;
b = 4;
g = 4;

dpdt = zeros(2,1);
dpdt(1) = (a1/(1+((p(2)/1+i2)^b))) - p(1);
dpdt(2) = (a2/(1+((p(1)/1+i1)^g))) - p(2);
end



