clear all
close all
clc
s=tf('s');
Kc=0.8;
C_SS=0.8;
M_T_HF=mag2db((0.8*10^-2)/1);
zeta=0.48;
T_p=mag2db(1.185);
S_p=mag2db(1.5);
trwc=1.88;
tr=0.25;
wc_des=trwc/tr;
T_s=0.015;
G_ZOH=1/(1+(s*T_s)/2);
G=120/(s^3+15.8*s^2+12*s);
C0=C_SS;
L_1=G_ZOH*G*C_SS;
wnorm=7.75;
wz=wc_des/wnorm;
Cz=(1+s/wz);
C0=C0*Cz;
L_2=L_1*Cz;
wp=150*wz;
Cp=1/(1+s/wp);
C0=C0*Cp;
L_3=L_2*Cp;
K=db2mag(2.5);
C0=K*C0;
L_4=K*L_3;
Cd=c2d(C0,T_s,'tustin');
figure(1)
nichols(L_4), hold on;
T_grid(T_p);
S_grid(S_p);
T_grid(M_T_HF);
%overshootandrisetime
rho=1;
dda=0;
ddt=0;
wdt=100;
out=sim("s298637_sim.slx");
figure(1);
plot(out);
stepinfo(out.y.data,out.y.time)
%yda
rho=0;
dda=0.4;
ddt=0;
wdt=100;
outyda=sim("s298637_sim.slx");
figure(2);
plot(outyda);
stepinfo(out.y.data,out.y.time)
%ydt
rho=0;
dda=0;
ddt=1;
wdt=100;
outydt=sim("s298637_sim.slx");
figure(3);
plot(outydt);
stepinfo(out.y.data,out.y.time)

