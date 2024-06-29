H=10/(s^2+1.6*s+4);
%a
zeta=0.4;(%from formulas)
wn=2;(%from formulas)
t=1/(zeta*wn);
%b
%look all values from graph
step(H)
yss=2.5;
overshoot=((4.045-2.5)/2.5)*100;
peak_time=1.725;
rise_time=1.08;
t_settling=3.8;

