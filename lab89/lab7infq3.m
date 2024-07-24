T=1;
z=tf('z',T);
A=[-0.2 0 0;0 1 0;0 0 1];
roots(minpoly(A))