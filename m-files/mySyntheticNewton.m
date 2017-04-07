function P = mySyntheticNewton(a, x, t)
% MYSYNTHETICNEWTON
%
% Goal: Apply the Synthetic division algorithm to contruct the values of
% the polynomial interpolation P with Newton Form of coefficients a over
% the values x.

n = length(a) -1;

P = a(n+1);
for k=n-1:-1:0
    P = a(k+1) + (t - x(k+1)).*P;
end

    