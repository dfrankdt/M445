function P = doLagrange(x, f, t)
% DOLAGRANGE
%
% Goal: 
%  Create the Lagrange form of the interpolating polynomial through
%  the points (x0, f0), ..., (xn, fn)
%
% Inputs:
%  x: vector containing n+1 distinct abscissa
%  f: vector containing n+1 values to be interpolated
%  t: vector of arbitrary length where the polynomial should be evaluated
%
% Output:
%  P: interpolating polynomial evaluated at the points given by t

n = length(x) - 1;
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