A=[0 1;0.1 -0.3];
B=[0;1];
C=[7 7];
D=0;
T=1;
z=tf('z',T);
x0=[0;0];
U=z/(z-1);
X=minreal(zpk(inv(z*eye(2)-A)*(x0+B*U)),1e-3);
[num1,dem1]=tfdata(X(1),'v');
[r,p,k]=residuez(num1,dem1)
[num2,dem2]=tfdata(X(2),'v');
[r,p,k]=residuez(num2,dem2);

Y=zpk(minreal(C*inv(z*eye(2)-A)*(x0+B*U)+D*U,1e-2));
[num3,dem3]=tfdata(Y,'v');
[r,p,k]=residuez(num3,dem3)


