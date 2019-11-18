clc;
clear all;
close all;
 %parameters(index,nut)
 %%index represents different sets of params
 %%nut(PEP and Pyr): 0-rich; 1-starved;

 
 global p
parameters_cnbmac2019(3,0)

 global Gln
 Gln=2000;%cellular glutamine level


  [T,Y] = ode15s('cnbmac2019_func',[0,150],[0.2,1000,100,20,10,50,50]);
 
%% figures %%

%% comparison with experiment + dynamics of nucleotides %%
figure();
hold on;
subplot(4,1,1);
plot(T,Y(:,1),'k');
hold on;
 y0=[0.050, 0.276, 0.156, 0.104, 0.090,0.075,0.036];
x0=[33, 58, 48, 78, 98, 118, 138];%%x0 and y0 are from experimental data of cdG
scatter(x0+2.5,y0,35,'filled');
xlabel('time')
ylabel('concentration')
legend('c-di-GMP')
legend('experiment','simulation')
subplot(4,1,2);
plot(T,Y(:,3),'r');
legend('(p)ppGpp')
subplot(4,1,3);
plot(T,Y(:,2),'b');
legend('GTP')
subplot(4,1,4);
plot(T,Y(:,4),'g');
legend('GMP')


%% steady states of PTS system %%

figure();
subplot(3,1,1);
plot(T,Y(:,5));%EIP
legend('EIP')
subplot(3,1,2);
plot(T,Y(:,6));%NPrP
legend('NPrP')
subplot(3,1,3);
plot(T,Y(:,7));%EIIAP
xlabel('Time/min')
ylabel('Concentration/\muM')
legend('EIIAP')








