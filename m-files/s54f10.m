% Bradie: section 5.4, figure 10

clear
n = 4;
x = linspace(-1, 1, 2^9+1);

T = doChebyshev(x, 4);

plot(x, T(2:end, :), 'k')
