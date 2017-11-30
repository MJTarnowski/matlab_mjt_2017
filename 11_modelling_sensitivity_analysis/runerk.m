clear; close all;
echo on;
%states
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
[t y] = ode15s(@erk,[0 100],x0); 
H = plot(t,y);
set(H,'LineWidth',2);
xlabel('time [s]');
ylabel('Concentration [\mu M]');
legend('Raf-1*','RKIP','Raf-1*/RKIP','Raf-1*/RKIP/ERK-PP','ERK','RKIP-P','MEK-PP','MEK-PP/ERK','ERK-PP','PP','RKIP-P/RP');
grid

[yp,ym] = senseanalysis(@erk,[0,100],x0,5);
imagesc(yp);
colorbar;
xlabel('Initial condition, plus 5% variation')
ylabel('Output variation');