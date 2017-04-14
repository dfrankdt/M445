% Bradie: section 5.6, example 17

%%
clear
t = linspace(0.005, 2, 2^9+1);

% molality
M = [0.005 0.010 0.020 0.050 0.100 0.200 0.500 1.000 2.000];
% Coefficient
C = [0.924 0.896 0.859 0.794 0.732 0.656 0.536 0.430 0.316];

% goal: estimate activity coefficient for molality 0.032 and 1.682
M0 = [0.032 1.682];

%%
% first try: degree 8 polynomial
C0 = doLagrange(M, C, M0)
a = doDividedDiff(M, C);
P = doSyntheticNewton(a, M, t);
plot(M, C, 'o', M0, C0, '*b', t, P, 'r')
axis([0 2 0 1])

% the estimate at 0.032 is a reasonable 0.831 but the estimate at 1.682 is
% an unreasonable -216711.  The polynomial fit is not reasonable.

%%
% second try: cubic spline with not-a-knot
C0s = spline(M, C, M0)  % gives values in question
Cs = spline(M, C, t); % gives spline on finer grid

plot(M, C, 'o', M0, C0s, '*b', t, Cs, 'r')

% the estimate at 0.032 is a reasonable 0.8279 and the estimate at 1.682 is
% a reasonable 0.3489.  The cubic spline fit is much more appropriate.