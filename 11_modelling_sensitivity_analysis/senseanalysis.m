function [yp,ym] = senseanalysis(funct,timeperiod,x0,perc,params);  

[t out] = ode45(@(t,y) funct(t,y,params),timeperiod,x0);
x00 = x0;
paramsmod = params;
for i = 1:length(x0);   
    paramsmod(i) = paramsmod(i)*(1+perc/100);
    
    [t y] = ode45(@(t,y) funct(t,y,paramsmod),timeperiod,x0);
    yp(i,:) = (y(end,:)-out(end,:))./y(end,:);
    %reset paramsmod to params to look at -5%
    paramsmod = params;
    %compute params - 5% (gives ym)
    paramsmod(i) = params(i)*(1-perc/100);
    [t y] = ode45(@(t,y) funct(t,y,paramsmod),timeperiod,x00);
    ym(i,:) = (y(end,:)-out(end,:))./y(end,:);
    paramsmod = params;
    i
end
