s=tf('s');
zeta=0.615;
Tp=20*log10(1.031);
Sp=20*log10(1.34);
tswc=4.5;
wc=tswc/0.75;
Css=5;
G=10/(s*(s+5)*(s+10));
L_1=Css*G;

md=8;
wnorm=0.8;
wd=wc/wnorm;
Cd=((1+s/wd)/(1+s/(wd*md)))^2;
L_2=L_1*Cd;

K=10^(17/20);
L_3=L_2*K;

C=Cd*Css*K;
nichols(L_3), hold on;
S_grid(Sp)
T_grid(Tp)
out=sim('sys1');
plot(out)