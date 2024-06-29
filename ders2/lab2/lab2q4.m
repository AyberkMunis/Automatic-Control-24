A=[5 -1 2;3 1 0;-5 4 0];
B=[2 ;1 ;-1];
C=0.5*[1 -1 3];
D=0;
%a
eig_1=roots(minpoly(A));
%c
H=zpk(minreal(tf(ss(A,B,C,D)),1e-3));
pole(H);
