% Bradie: section 6.1, copper examples
% Update: 1 May 2017

clear; close all

% data
N = [0.0521 0.1028 0.2036 0.4946 0.9863 2.443 5.06];
D = [1.65 2.10 2.27 2.76 3.12 2.92 2.07];
t = linspace(0.05, 5.1, 2^9+1);

%% polynomial fit is bad!
a = doDividedDiff(N, D);
Pn = doSyntheticNewton(a, N, t);
plot(N, D, 'ok', t, Pn, 'k')
%axis([min(t) max(t), 1, 3.5])

%% cubic spline with not-a-knot is better!
Sc = spline(N, D)
plot(N, D, 'ok', t, ppval(Sc, t), 'k')

a = Sc.coefs(5, 1);
b = Sc.coefs(5, 2);
c = Sc.coefs(5, 3);

Ncp = N(5) + (-(2*b) - sqrt((2*b)^2 - 4*(3*a)*c))/(2*(3*a))
Dmax = ppval(Sc, Ncp)

hold on
plot(Ncp, Dmax, '*r')
