% Bradie: section 5.2, example 7
% Update: 1 May 2017

clear

p = [0.5 0.84 0.842 0.85 0.9 1];
P = [0.0001504 0.490 0.500 0.534 0.753 1.0];
t = linspace(0.5, 1, 2^9+1);

pbar = 0.6;

g = doLagrange(p, P, t);
Pbar = doNeville(p, P, pbar)

plot(t, g, '--', p, P, 'ob', pbar, Pbar, '*b')
xlabel('Probability of winning any rally, p')
ylabel('Probability of a shutout, P')
