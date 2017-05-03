function s72ex6
% Bradie: section 7.2, example 6
%
% Note: this is a Matlab function rather than a script.
%
% Goal: approximate the solution to 
%
%   x' = t/x, 
%  x(0) = 1
%
% on [1, 5] using Euler's method with N = 10 steps.  Note that the exact
% solution is given by x(t) = sqrt(t^2 + 1)

a = 0; b = 5;
x0 = 1;

N = 10;
dt = (b-a)/N;

t = a:dt:b; t = t(:);
w = zeros(size(t)); w = w(:);

w(1) = x0;
for i=1:N
    f = rhs(t(i), w(i));
    dw = f*dt;
    w(i+1) = w(i) + dw;
end

% Identify exact solution
x = sqrt(t.^2 + 1);

% pretty print the results
pfmt = ('%1.1f\t %.8f\t\t %.8f\t\t %.6f\n');
clc
fprintf('t\t Approximate Solution\t Exact Solution\t\t |x(t_i) - w_i|\n')
for i=1:N+1
    fprintf(pfmt, t(i), w(i), x(i), abs(x(i)-w(i)))
end
end

function f = rhs(t, x)
f = t./x;
end
