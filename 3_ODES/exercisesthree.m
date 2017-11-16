%% exercise sheet 3 - ordinary differential equations

%% Q1ai - y' = x^2 and y(0) = 1
% 
% function SolveSimple1()
% [x,y] = ode45(@deriv,[0,10],1);
% figure
% plot(x,y,'b')
% 
% function dydx = deriv(x,y)
% dydx = x^2;
% end
% 
% function SolveSimple()
% [x,t] = ode45(@deriv2,[0,10],1);
% figure
% plot(x,t)
% figure
% plot(x,y)
% end
% function dxdt = deriv2(t,x)
% dxdt = (t^2)/x;
% end

    

%% Q 1aiii

% function SolveSimple(y1)
% figure
% [x,y] = ode45(@deriv,[1,10],y1);
% plot(x,y,'b');
% 
% function dydx = deriv(x,y)
% 
% dydx = 1 - (y/x);



%% Q 1aiv

% 
% function SolveSimple2()
% t_range=[0,8];
% [t,y]=ode45(@deriv1, t_range, [1,0]);
% % for simplicity, the values of y(1) and y(2) at t = 0 are put in here
% figure
% plot(t,y)
% end
% 
% 
% function dydt=deriv1(t,y)
% %this function stores the derivatives as a matrix of deriv 1 and deriv 2
% dydt = zeros(2,1);
% % make matrix of zeros
% dydt(1) = -y(2);
% % put first differential equation in 
% dydt(2) = y(1);
% % put second differential equation in
% end
% end
%% Q 1av

% function Solvesimple()
% trange=[0,10];
% yinitial=[1,0]
% [t,y]=ode45(@deriv3, trange, yinitial);
% 
% plot(t,y)
% end
% 
% function dydt=deriv3(t,y)
% dydt = zeros(2,1);
% dydt(1)=y(2);
% dydt(2)=-3*y(2)+4*y(1);
% 
% end


%% Q2 - boundary value problems

%2a - Use bvp4c in Matlab to solve the boundary value problem

% function bvp4
% ylow=1;
% yhigh=1;
% solinit=bvpinit(linspace(xlow,xhigh,10),[1,-1]);
% sol=bvp4c(@bvp4ode,@bvp4bc,solinit);
% xint = linspace(xlow,xhigh,20);
% Sxint = deval(sol,xint);
% plot(xint,Sxint(1,:))
% %
% function dydt=bvp4ode(t,y)
% dydt = zeros(2,1);
% dydt(1)=y(2);
% dydt(2)=-3*y(2)+4*y(1);
% %
% function res = bvp4bc(ya,yb)
% res = [ya(1) yb(2)]


sol = bvp4c(@deriv2a,@bcfun,solinit)

function dydt=deriv2a(t,y)
dydt = zeros(2,1);
dydt(1)=y(2);
dydt(2)=-3*y(2)+4*y(1);
end

function res=bcfun(ya,yb)
res = zeros(2,1);
res(1) = 1
res(2) = 1
end
%TBC