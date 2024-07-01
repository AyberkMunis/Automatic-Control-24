s=tf('s')
A=[-0.2 -1;1 0];
B=[0.5;0];
C=[0 1];
D=0;

M_r=ctrb(A,B);
rank_mr=rank(M_r);

s=0.06;
ts=2;
alpha=2;

zeta=(abs(log(s)))/(sqrt(pi^2+log(s)^2));
wn=log((alpha/100)^-1)/(zeta*ts);

lambda_1=-zeta*wn+j*wn*sqrt(1-zeta^2);
lambda_2=-zeta*wn-j*wn*sqrt(1-zeta^2);

lambda_des=[lambda_1 lambda_2];

K=place(A,B,lambda_des);

sys_N=ss(A-B*K,B,C,D);
N=1/dcgain(sys_N);

sys_controller=ss(A-B*K,B*N,C,D);

t_sim=linspace(0,20,10000);
step(sys_controller,t_sim);
%b
%analytic expression is 
%u(t)=-Kx(t)+Nr(t)