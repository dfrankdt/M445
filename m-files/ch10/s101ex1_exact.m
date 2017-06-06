x0 = 0; xN = 1;
N = 2^6; dx = (xN - x0)/N;
x = x0:dx:xN; x=x(:);

u0 = 2*sin(2*pi*x);

plot(x, u0)

tf = 2; nt = 10; dt = (4 - 0)/nt;
t = 0:dt:tf;

u = 2*(sin(2*pi*x))*(exp(-pi^2/4*t));


surf(t, x, u)