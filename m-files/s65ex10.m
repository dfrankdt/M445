% Bradie: Section 6.5, example 10
clear; clc

% Goal: approximate the value of the definite integral of f(x) = sin(x) on
% the interval [0, pi] using Simpson's rule.  Illustrate the rate of
% convergence O(h^4)

x0 = 0;
xn = pi;

% Standard Newton-Cotes
n = 2;
h = pi/2;
Th(1) = h/3*(sin(x0) + 4*sin((x0+xn)/n) + sin(xn));
Eh(1) = abs(2 - Th(1));

% Composite Newton-Cotes
for k=1:6
    n = 2^(k+1);
    h = pi/n;
    x = x0:h:xn;
    f = sin(x);
    Th(k+1) = (f(1) + 4*sum(f(2:2:n)) + 2*sum(f(3:2:n-1)) + f(n+1))*h/3;
    Eh(k+1) = abs(2 - Th(k+1));
end

% pretty print results

pfmt = ('%i\t %.11f\t %.11f\t %.6f\n');
fprintf('n \t Th \t\t eh \t\t e2h/eh\n')
fprintf(pfmt, 2, Th(1), Eh(1), '')
for k=1:6
    fprintf(pfmt, 2^(k+1), Th(k+1), Eh(k+1), Eh(k)/Eh(k+1))
end
