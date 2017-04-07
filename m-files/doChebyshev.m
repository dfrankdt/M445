function [x, T] = doChebyshev(n)
% DOCHEBYSHEV
% 
% Goal: Return the zeroth through nth order Chebyshev polynomials on the
% interval [-1, 1]

nx = 2^9+1;

x = linspace(-1.1, 1.1, nx);

T = zeros(n+1, nx);
T(1,:) = ones(size(x));
T(2,:) = x;


for k=2:n
    T(k+1, :) = 2*x.*T(k,:) - T(k-1,:);
end

