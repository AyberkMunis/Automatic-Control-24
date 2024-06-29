A=[0 1;-1 -1];
B=[2;4];
C=[1 0];
D=0;
%a
eig_1=roots(minpoly(A));
%c
H=zpk(minreal(tf(ss(A,B,C,D)),1e-3));
pole(H);
%d
A_2=(1/3)*A;
eig_2=roots(minpoly(A_2));
H_2=tf(ss(A_2,B,C,D));

%e

t1=abs(1/(real(eig_1(1))));
%first system has faster convergence