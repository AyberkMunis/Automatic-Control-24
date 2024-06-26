s=tf('s');
A=[0 1;-1 -1];
B=[27 0;-23 1];
C=[1 0];
D=0;
x0=[0;0];
U=[0;1];

X=zpk(minreal(inv(s*eye(2)-A)*x0+inv(s*eye(2)-A)*B*U,1e-2));
[num1,dem1]=tfdata(X(1),'v');
[r1,p1]=residue(num1,dem1);
M_1=abs(r1(2));
phi_1=angle(r1(2));

[num2,dem2]=tfdata(X(2),'v');
[r2,p2]=residue(num2,dem2);
M_2=abs(r2(1));
phi_2=angle(r2(1));

Y=zpk(minreal(C*inv(s*eye(2)-A)*(x0+B*U)+D*U,1e-2));
[num3,dem3]=tfdata(Y(1),'v');
[r3,p3]=residue(num3,dem3);

M_3=abs(r3(2));
phi_3=angle(r3(2));



