n = 4;

[x, T] = doChebyshev(4);

plot(x, T(2:end, :), 'k')
axis([-1.1 1.1 -1.1 1.1])