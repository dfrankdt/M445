T = 300:100:1100;
E = [0.024 0.035 0.046 0.058 0.067 0.083 0.097 0.111 0.125];

[t, P] = myLagrange(T, E, 300, 1100);

plot(t, P, 'k', T, E, 'k*')
xlabel('Temperature (K)')
ylabel('Emittance')