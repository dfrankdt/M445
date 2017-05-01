function P = doSyntheticNewton(a, x, t)
% DOSYNTHETICNEWTON
% Update: 1 May 2017
%
% Goal: 
%  Apply the Synthetic division algorithm to contruct the values of
%  the polynomial interpolation P with Newton Form of coefficients a over
%  the values x.
% 
% Inputs:
%  a: vector of length n+1 containing the coefficients of the nth order
%  interpolating polynomial in Newton form.
%  x: vector of length n+1 with distinct abscissa where the Newton form of
%  the interpolynomial was obtained
%  t: vector of arbitrary length where the polynomial is to be evaluated
%
% Output:
%  P: interpolating polynomial evaluated at t

n = length(a) -1;

P = a(n+1);
for k=n-1:-1:0
    P = a(k+1) + (t - x(k+1)).*P;
end

    
