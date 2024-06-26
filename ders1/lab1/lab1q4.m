s=tf('s');
A=[0 1 0 0;-1 0 0 0;3 0 0 0;0 0 2 0];
B=[1;0;0;0];
C=[1 0 0 0];
D=0;
x0=[0;0;0;0];
w0=sqrt(2);
w0_b=1;
U=w0/(s^2+w0^2);
U_b=w0_b/(s^2+w0_b^2);
%a
Y=zpk(minreal(C*inv(s*eye(4)-A)*(x0+B*U)+D*U,1e-2));
[num1,dem1]=tfdata(Y,'v');
[r1,p1]=residue(num1,dem1);

M_1=abs(r1(2));
phi_1=angle(r1(2));

%b
Y_b=zpk(minreal(C*inv(s*eye(4)-A)*(x0+B*U_b)+D*U_b,1e-2));
[num1_b,dem1_b]=tfdata(Y_b,'v');
[r1_b,p1_b]=residue(num1_b,dem1_b);

%%Bu fonksiyon Y(s)=-0.25i/(s-1)+0.25i/(s+1) fonksiyonu sorudaki koşula
%%benzediğinden dolayı  sorudaki koşul gibi çıkaracağız ondan dolayı extra 
%% bir t gelmekte
