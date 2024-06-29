s=tf('s');
H=1/(s^3+2*s^2+5*s+4.25);
pole(H);
u_bar=2;
K=dcgain(H)*u_bar;
u_bar_sin=3;
w0=0.1;
%A
p_H=pole(H);
%B


[mag,phi]=bode(H,w0);

phi_rad=phi/180*pi;
y_bar=mag*u_bar_sin;

%%yss=(0.7*sin(0.1t-0.12)+0.47)e(t)
%%C
w0_2=3;
%%yss=yprime*sin(3t+phi)
[mag_2,phi_2]=bode(H,w0_2);
answer=1/mag_2;

