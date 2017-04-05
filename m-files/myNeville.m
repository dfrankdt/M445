function P = myNeville(x, f, xbar)
% MYNEVILLE
%
% Goal: use Neville's algorithm to evaluate the interpolating polynomial P
% at a non-abscissa point.

n = length(x) - 1;

Q = zeros(n+1, n+1);

Q(:,1) = f;

for j=1:n
    for i=j:n
        Q(i+1, j+1) = (xbar - x(i-j+1))*Q(i+1, j) - (xbar - x(i+1))*Q(i, j);
        Q(i+1, j+1) = Q(i+1, j+1)/(x(i+1) - x(i-j+1));
    end
end

%% To see the matrix Q, uncomment the following

%Q

P = Q(end, end);
