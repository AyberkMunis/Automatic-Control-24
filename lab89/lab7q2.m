A=[0.5 -1;0 1];
B=[2;0];
C=[2 4];
D=0;
T=1;
z=tf('z',T);
x0=[2;1];
U=(z/(z-0.9));
Y=zpk(minreal(C*inv(z*eye(2)-A)*(x0+B*U)+D*U,1e-2));
[num3,dem3]=tfdata(Y,'v');
[r,p,k]=residuez(num3,dem3)
sys=ss(A,B,C,D);
[num,dem]=tfdata(sys);
H=tf(num,dem,-1);
pole(H)