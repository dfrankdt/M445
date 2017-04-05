p = [0.5 0.84 0.842 0.85 0.9 1];
P = [0.0001504 0.490 0.500 0.534 0.753 1.0];

pbar = 0.6;

[t, g] = myLagrange(p, P, 0.5, 1);
Pbar = myNeville(p, P, pbar)

plot(t, g, '--', p, P, 'ob', pbar, Pbar, '*b')
xlabel('Probability of winning any rally, p')
ylabel('Probability of a shutout, P')