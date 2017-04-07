function T = doChebyshev(t, n)
% DOCHEBYSHEV
% 
% Goal: 
%  Return the zeroth through nth order Chebyshev polynomials on the
%  interval [-1 1].
% 
% Inputs:
%  t: vector of arbitrary length where the polynomials should be evaluated
%  n: integer determinining the order of the desired Chebyshev polynomial
%
% Output:
%  T: matrix (size n+1 x length(t) ) where the kth row represents the
%  (k-1)st Chebyshev polynomial

nt = length(t);

T = zeros(n+1, nt);
T(1,:) = ones(size(t));
T(2,:) = t;


for k=2:n
    T(k+1, :) = 2*t.*T(k,:) - T(k-1,:);
end

