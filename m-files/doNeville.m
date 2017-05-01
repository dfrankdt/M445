function Pbar = doNeville(x, f, xbar)
% DONEVILLE
% Update: 1 May 2017
%
% Goal: 
%  Use Neville's algorithm to evaluate the interpolating polynomial P
%  at a non-abscissa point.
%
% Inputs:
%  x: vector containing n+1 distinct abscissa
%  f: vector containing n+1 points to interpolate
%  xbar: single value where the interpolating polynomial is to be evaluated
%
% Output:
%  Pbar: value of nth order interpolating polynomial at xbar

n = length(x) - 1;

Q = zeros(n+1, n+1);

Q(:,1) = f;

for j=1:n
    for i=j:n
        Q(i+1, j+1) = (xbar - x(i-j+1))*Q(i+1, j) - (xbar - x(i+1))*Q(i, j);
        Q(i+1, j+1) = Q(i+1, j+1)/(x(i+1) - x(i-j+1));
    end
end

% Note: To see the matrix Q, uncomment the following line
%Q

Pbar = Q(end, end);
