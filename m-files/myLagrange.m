function [t, P] = myLagrange(x, f, a, b)
% myLagrange
%
% Goal: create the Lagrange form of the interpolating polynomial through
% the points (x0, f0), ..., (xn, fn)
%
% Outputs: 
%
%  t - a finer grid
%  P - polynomial

n = length(x) - 1;
t = linspace(a, b, 2^9 + 1);
L = ones(n+1, length(t));
for j=0:n
    for k=0:n
        if k==j
            L(j+1, :) = L(j+1, :);
        else
            L(j+1, :) = L(j+1, :).*(t - x(k+1))./(x(j+1) - x(k+1));
        end
    end
end

P = zeros(size(t));
for j=0:n
    P = P + L(j+1,:)*f(j+1);
end