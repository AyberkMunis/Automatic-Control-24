A=[-1 0;0 10];
B=[1;1];
C=[1 0];

roots(minpoly(A))

M_r=ctrb(A,B);
rank_mr=rank(M_r);

M_o=obsv(A,C);
rank_mo=rank(M_o)