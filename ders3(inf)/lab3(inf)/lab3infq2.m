A=[-0.2 -1;1 0 ];
B=[0.5;0];
C=[0 1];
D=0;
x_0=[-0.1;0.1];
x_0hat=[0;0];

M_r=ctrb(A,B);
rank_mr=rank(M_r);

zeta=0.66;
wn=2.93;

lambda_1=-zeta*wn+j*wn*sqrt(1-zeta^2);
lambda_2=-zeta*wn-j*wn*sqrt(1-zeta^2);

K=place(A,B,[lambda_1 lambda_2]);
A_N=A-B*K;
B_N=B;
C_N=C;
D_N=D;
sys_N=ss(A_N,B_N,C_N,D_N);
N=1/dcgain(sys_N);

M_o=obsv(A,C);
rank_mo=rank(M_o);

lambda_o_des=[-zeta*wn -zeta*wn]*5;
L=acker(A',C',lambda_o_des)';

A_I=[A -B*K;L*C A-B*K-L*C];
B_I=[B;B]*N;
C_I=[C zeros(1,2)];
D_I=0;

sys_controller=ss(A_I,B_I,C_I,D_I);
t_sim=linspace(0,20,10000);
u_sim=ones(size(t_sim));
[y,t,x]=lsim(sys_controller,u_sim,t_sim,[x_0;x_0hat]);


