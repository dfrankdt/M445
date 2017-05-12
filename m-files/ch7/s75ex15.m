function s75ex15
% Bradie: section 7.5, example 15
%
% Goal: Implement the two-step Adams-Bashforth method on the test problem 
%
%  x' = 1 + x/t, 1 <= t <= 6
%  x(1) = 1
%
% using N = 10 steps.
clc

a = 1; b = 6;
x0 = 1;

N = 10;
h = (b-a)/N;

t = a:h:b; t = t(:);

% Get the solution through a second order Taylor method

wt = zeros(size(t));
wt(1) = x0;
for i=1:N
    [ft, fpt] = f_taylor(t(i), wt(i));
    dw = ft*h + 1/2*fpt*h^2;
    
    wt(i+1) = wt(i) + dw;
end

% do the multistep method
wm = zeros(size(t));

wm(1) = x0;
% Get the one additional value through a second order one-step method,
% specifically here we the previously computed second order Taylor method.

wm(2) = wt(2);

% implement the multistep method.
f2 = f(t(1), wm(1))*h;
for i=2:N
    f1 = f(t(i), wm(i))*h;
    
    dw = (3*f1 - f2)/2;
    wm(i+1) = wm(i) + dw;
    
    % overwrite f2 with f1 for the next step.
    f2 = f1;
end

% get exact solution, errors
x = t.*(1 + log(t));
et = abs(x - wt);
em = abs(x - wm);

% pretty print results

pfmt = '%.1f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n';
fprintf('Time\t Multistep\t Error\t\t Taylor\t\t Error\t\t Ratio of errors\n')
for i=1:N+1
    fprintf(pfmt, t(i), wm(i), em(i), wt(i), et(i), em(i)/et(i))
end

    

end

function rhs = f(t, x)
    rhs = 1 + x/t;
end

function [y, yp] = f_taylor(t, x)
    y = 1 + x/t;
    yp = (t*y - x)/t^2;
end