s=tf('s');
A=[0 1 0 0;-1 -1 0 0;0 0 -10 0;0 0 0 -5];
B=[1;0;0;1];
C=[1 0 1 1];
D=0;
x0=[0;0;0;0];
U=(s+1)/s^2;
U_b=0;
x_0_b=[0;0;1;1];
 
%a
Y=zpk(minreal(C*inv(s*eye(4)-A)*(x0+B*U)+D*U,1e-2));
[num1,dem1]=tfdata(Y,'v');
[r1,p1]=residue(num1,dem1);

M_1=abs(r1(2));
phi_1=angle(r1(2));

%b
X=zpk(minreal(inv(s*eye(4)-A)*x_0_b+inv(s*eye(4)-A)*B*U_b,1e-2));
[num2,dem2]=tfdata(X(3),'v');
[r2,p2]=residue(num2,dem2);
[num3,dem3]=tfdata(X(4),'v');
[r3,p3]=residue(num3,dem3);
