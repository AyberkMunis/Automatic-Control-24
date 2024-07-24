zeta=0.505;
Tp=20*log10(1.15);
Sp=20*log10(1.46);
tswc=6;
ts=0.002;
wc=tswc/ts;
s=tf('s');
G=(1.4*10^9)/(s^2*(s+4.4*10^4));
Css=5;
L_1=G*Css;
Ms=20*log10(0.01/0.5);
C=Css;
wnorm=1.5;
wz=wc/wnorm;
Cz=(1+s/wz);
C=C*Cz;
L_2=L_1*Cz;
K=db2mag(45);
L_3=K*L_2;
C=C*K;
wp=70*wz;

Cp=1/(1+s/wp);
C=C*Cp;
L_4=L_3*Cp;
nichols(L_4), hold on;
S_grid(Sp)
T_grid(Tp)
S_grid(Ms);
out=sim('feedback_simulation_2.slx');
plot(out)
stepinfo(out.y.data,out.y.time,'SettlingTimeTreshold',0.002)



