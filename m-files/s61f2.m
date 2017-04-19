% Bradie: section 6.1, friction coefficient motivating problem

clear; close all;

%% data

t = 0:pi/2:5*pi;
F = [5 7.83 12.27 19.22 30.10 47.15 73.86 115.7 181.24 283.9 444.71];


%% fit
a = doDividedDiff(t, F);


%% regression
u = polyfit(t, log(F), 1);
mu = u(1)

%F0 = exp(u(2));
%x = linspace(0, 5*pi, 2^9+1);
%plot(t, F, 'k*', x, F0*exp(mu*x), 'k')

