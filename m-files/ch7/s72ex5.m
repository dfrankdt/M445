function s72ex5
% Bradie: section 7.2, example 5
%
% Note: this is a Matlab function rather than a script.
%
% Goal: approximate the solution to 
%
%   x' = 1 + x/t, 
%  x(1) = 1
%
% on [1, 6] using Euler's method with N = 10 steps.  Note that the exact
% solution is given by x(t) = t(1 + log(t)).

a = 1; b = 6;
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
x = t.*(1 + log(t));

% pretty print the results
pfmt = ('%1.1f\t %.8f\t\t %.8f\t\t %.6f\n');
clc
fprintf('t\t Approximate Solution\t Exact Solution\t\t |x(t_i) - w_i|\n')
for i=1:N+1
    fprintf(pfmt, t(i), w(i), x(i), abs(x(i)-w(i)))
end
end

function f = rhs(t, x)
f = 1 + x./t;
end
