% Bradie: section 5.2, example 6

clear

w = [10 20 40 60 80 100];
V = [1.498 2.138 2.840 2.542 1.877 1.201];
wbar = 50;
t = linspace(10, 100, 2^9+1);

P = doLagrange(w, V, t);
Vbar = doNeville(w, V, wbar);

plot(t, P, '--', w, V, 'ob', wbar, Vbar, '*b')
xlabel('Percent of anhydrous solute weight, w')
ylabel('Relative viscosity, V')