A=[1 3;6 4];
B=[2;4];
C=[1 0];
D=0;
%a
eig_1=roots(minpoly(A));
%c
H=zpk(minreal(tf(ss(A,B,C,D)),1e-3));
pole(H);


