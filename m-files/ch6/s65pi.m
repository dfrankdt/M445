% Bradie: section 6.5, estimate pi
% Update: 1 May 2017
clear
    
% Goal: estimate pi to within 5e-5 using a definite integral of the
% function f(x) = 1/(1+x^2) on [0, 1].

x0 = 0;
xn = 1;

%% Trapezoidal Rule
n = 116;
h = (xn - x0)/n;
x = x0:h:xn;
f = 1./(1+x.^2);

Tn = h/2*(f(1) + 2*sum(f(2:n)) + f(n+1));
e = abs(4*Tn - pi)

%% Simpson's Rule
n = 12;
h = (xn - x0)/n;
x = x0:h:xn;
f = 1./(1+x.^2);

Sn = h/3*(f(1) + 4*sum(f(2:2:n)) + 2*sum(f(3:2:n-1)) + f(n+1));
e = abs(4*Sn - pi)
