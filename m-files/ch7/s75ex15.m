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
w = zeros(size(t));

w(1) = x0;

% Get the one additional value through a second order one-step method,
% specifically here we use a second order Taylor method.

k1 = f(t(1), w(1));
k2 = (t(1)*f(t(1), w(1)) - w(1))/(t(1))^2;

dw = k1*h + 1/2*k2*h^2;
w(2) = w(1) + dw;

% implement the multistep method.
b2 = f(t(1), w(1))*h;
for i=2:N
    b1 = f(t(i), w(i))*h;
    
    dw = (3*b1 - b2)/2;
    w(i+1) = w(i) + dw;
    
    % overwrite b2 with b1 for the next step.
    b2 = b1;
end

% get exact solution
x = t.*(1 + log(t));

% pretty print results

pfmt = '%.1f\t %.6f\t %.6f\n';

for i=1:N+1
    fprintf(pfmt, t(i), w(i), abs(x(i)-w(i)))
end

    

end

function rhs = f(t, x)
    rhs = 1 + x/t;
end