% Bradie: section 6.5, example 6.11
% Update: 1 May 2017
clear

% Goal: demonstrate O(h^2) rate of convergence for definite integral of
% f(x) = sqrt(1 + x^3) on interval [0, 1] without exact value of integral

x0 = 0;
xn = 1;

% Standard Newton-Cotes
h = (xn - x0)/1;
Th(1) = h/2*(sqrt(1 + x0^3) + sqrt(1 + xn^3));

% Composite Newton-Cotes
for k=1:8
    n = 2^k;
    h = (xn - x0)/n;
    x = x0:h:xn;
    f = sqrt(1 + x.^3);
    Th(k+1) = (f(1) + 2*sum(f(2:n)) + f(n+1))*h/2;
end

% pretty print results
pfmt = ('%i\t %.12f\t\t %.6f\n');
fprintf('n \t Th \t\t\t Ratio of Differences\n')
for k=1:6
    R = (Th(k) - Th(k+1))/(Th(k+1) - Th(k+2));
    fprintf(pfmt, 2^(k-1), Th(k), R)
end
for k=7:8
    fprintf(pfmt, 2^(k-1), Th(k), '')
end
