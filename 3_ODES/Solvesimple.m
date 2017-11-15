function Solvesimple(y0)
x1=[0,8];
[t,y]=ode45(@deriv4, x1, y0);

plot(t,y)
end


function dydx=deriv(x,y)
dydx=x^2;
end

function dydx=deriv1(x,y)
dydx=x^2/y;
end

function dydx=deriv2(x,y)
dydx=1-y/x;
end

function dydt=deriv3(t,y)
dydt = zeros(2,1);
dydt(1)=y(2);
dydt(2)=-3*y(2)+4*y(1);

end
 
function dydt=deriv4(t,y)
dydt= zeros(2,1);
% this creates an empty vector of y equations
dydt(1)=-y(2);
% this is dy1dt, the first array element of the vector
dydt(2)=y(1);
% this is dy2dt, the second array element
end