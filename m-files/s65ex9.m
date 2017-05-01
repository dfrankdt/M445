% Bradie: Section 6.5, example 9
clear; clc

% Goal: approximate the value of the definite integral of f(x) = sin(x) on
% the interval [0, pi] using the trapezoidal rule.  Illustrate the rate of
% convergence O(h^2)

x0 = 0;
xn = pi;

% Standard Newton-Cotes
h = pi;
Th(1) = h/2*(sin(x0) + sin(xn));
Eh(1) = abs(2 - Th(1));

% Composite Newton-Cotes
for k=1:7
    n = 2^k;
    h = pi/n;
    x = x0:h:xn;
    f = sin(x);
    Th(k+1) = (f(1) + 2*sum(f(2:n)) + f(n+1))*h/2;
    Eh(k+1) = abs(2 - Th(k+1));
end

% pretty print results

pfmt = ('%i\t %.7f\t %.7f\t %.6f\n');
fprintf('n \t Th \t\t eh \t\t e2h/eh\n')
fprintf(pfmt, 1, Th(1), Eh(1), '')
for k=1:7
    fprintf(pfmt, 2^k, Th(k+1), Eh(k+1), Eh(k)/Eh(k+1))
end
