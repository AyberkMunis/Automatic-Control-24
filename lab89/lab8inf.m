s=tf('s');
G=40/(s^2+4*s-9.81);
Css=1.96/s;

Mt=mag2db(0.01/0.1);
zeta=0.455;
Tp=mag2db(1.23);
Sp=mag2db(1.54);
T=0.02;
G_ZOH=1/(1+(s*T)/2);
L_1=G_ZOH*Css*G;
C=Css;
trwc=1.855;
tr=0.3;
wc=trwc/tr;
wnorm=2.2;
wz=wc/wnorm;
Cz=(1+s/wz)^2;
C=C*Cz;
L_2=L_1*Cz;
wp=20*wz;
Cp=1/(1+s/wp);
C=C*Cp;
L_3=L_2*Cp;
K=db2mag(6);
C=C*K;
L_4=L_3*K;
Cz=c2d(C,T,'tustin');
nichols(L_4), hold on;
S_grid(Sp)
T_grid(Tp)
T_grid(Mt);
out=sim('sys1');
plot(out)
stepinfo(out.y.data,out.y.time,'SettlingTimeTreshold',0.001)