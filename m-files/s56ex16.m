% Bradie: section 5.5, example 14

clear

%% Section 5.1, example 4 revisited...
T = 300:100:1100;
E = [0.024 0.035 0.046 0.058 0.067 0.083 0.097 0.111 0.125];
t = linspace(300, 1100, 2^9+1);

a = doDividedDiff(T, E);
P = doSyntheticNewton(a, T, t);

plot(t, P, '--', T, E, 'k*')
xlabel('Temperature (K)')
ylabel('Emittance')

%% Now for the cubic spline interpolant
Ps = spline(T, E, t);
hold on
plot(t, Ps, 'r')
hold off
