clear

w = [10 20 40 60 80 100];
V = [1.498 2.138 2.840 2.542 1.877 1.201];
wbar = 50;

[t, P] = myLagrange(w, V, 10, 100);
Vbar = myNeville(w, V, wbar)

plot(t, P, '--', w, V, 'ob', wbar, Vbar, '*b')
xlabel('Percent of anhydrous solute weight, w')
ylabel('Relative viscosity, V')