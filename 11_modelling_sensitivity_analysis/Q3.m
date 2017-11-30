%% Q3 ERK signalling patyhway
clear; close all;
echo on;
%params - rates


k1 = 0.53;
k2 = 0.0072;
k3 = 0.625;
k4 = 0.00245;
k5 = 0.0315;
k6 = 0.8;
k7 = 0.0075;
k8 = 0.071;
k9 = 0.92;
k10 = 0.00122;
k11 = 0.87;

x10 = 120; %Raf-1*
x20 = 48; %RKIP
x30 = 1.5; %Raf-1*/RKIP
x40 = 4.8; %Raf-1*/RKIP/ERK-PP
x50 = 12.4; %ERK
x60 = 4.8; %RKIP-P
x70 = 87.8; %MEK-PP
x80 = 3.7; %MEK-PP/ERK
x90 = 240.2; %ERK-PP
x100 = 160.5; %PP
x110 = 2.7; %RKIP-P/RP
x0 = [x10,x20,x30,x40,x50,x60,x70,x80,x90,x100,x110];

params = [k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11];

%set the intial state
[t y] = ode15s(@(t,y) erk(t,y,params),[0 100],x0); 
H = plot(t,y);
set(H,'LineWidth',2);
xlabel('time [s]');
ylabel('Concentration [\mu M]');
legend('Raf-1*','RKIP','Raf-1*/RKIP','Raf-1*/RKIP/ERK-PP','ERK','RKIP-P','MEK-PP','MEK-PP/ERK','ERK-PP','PP','RKIP-P/RP');
grid


[yp,ym] = senseanalysis(@erk,[0,100],x0,5,params);
imagesc(yp);
colorbar;
xlabel('Initial condition, plus 5% variation')
ylabel('Output variation');