%a
s=tf('s');
G=1/(1+s)^2;
C=(1+s)^2/(s*(1+s/4));
L=zpk(minreal(G*C,1e-3));
R=C/(1+L);
r=1/s;
u=zpk(minreal(R*r,1e-3));
[num,dem]=tfdata(u,'v');
[r,p]=residue(num,dem);
%c
T=zpk(minreal(L/(1+L),1e-3));
Q=zpk(minreal(G/(1+L),1e-3));
S=zpk(minreal(1/(1+L),1e-3));
R=zpk(minreal(C/(1+L),1e-3));
%BİBO stability için polellarına bakıyoruz
pole(T)
pole(Q)
pole(S)
pole(R)
%d
nyquist(L);
%e

S_1=-S;
w0=1;
sin_u_bar=0.5;
[mag,phi]=bode(S_1,1);
y_sin_bar=mag*sin_u_bar;
phi_rad=phi/180*pi;



%f
y=zpk(minreal(3*T+2*S,1e-3));
K=1*dcgain(y);