A=[-2 0 0;0 0 2;0 0 0];
B=[1;1;1];
C=[1 0 0];
D=-2;
%a
eig_1=roots(minpoly(A));
%c
H=zpk(minreal(tf(ss(A,B,C,D)),1e-3));
pole(H);


