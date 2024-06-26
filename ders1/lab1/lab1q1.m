s=tf('s');
A=[5 8;1 3];
B=[4;-1];
C=[3 -4];
D=7;
x0=[3;-3];
U=0;
U_2=4/s;

%a

X=zpk(minreal(inv(s*eye(2)-A)*x0+inv(s*eye(2)-A)*B*U,1e-2));
[num1,dem1]=tfdata(X(1),'v');
[r1,p1]=residue(num1,dem1);

[num2,dem2]=tfdata(X(2),'v');
[r2,p2]=residue(num2,dem2);


Y=zpk(minreal(C*inv(s*eye(2)-A)*(x0+B*U)+D*U,1e-2));
[num3,dem3]=tfdata(Y,'v');
[r3,p3]=residue(num3,dem3);
%Residueları bulduktan sonra pdften bakarak formüllere dönüştürebilirsiniz

%b

X_b=zpk(minreal(inv(s*eye(2)-A)*x0+inv(s*eye(2)-A)*B*U_2,1e-2));
[num1_b,dem1_b]=tfdata(X_b(1),'v');
[r1_b,p1_b]=residue(num1_b,dem1_b);

[num2_b,dem2_b]=tfdata(X_b(2),'v');
[r2_b,p2_b]=residue(num2_b,dem2_b);

Y_b=zpk(minreal(C*inv(s*eye(2)-A)*(x0+B*U_2)+D*U_2,1e-2));
[num3_b,dem3_b]=tfdata(Y_b,'v');
[r3_b,p3_b]=residue(num3_b,dem3_b);

%Residueları bulduktan sonra pdften bakarak formüllere dönüştürebilirsiniz
