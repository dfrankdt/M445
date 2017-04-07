function a = myDividedDiff(x, f)
% MYDIVIDEDDIFFERRENCE
%
% Goal: input abscissa x and function values f, output a vector a which
% represents the coefficients of the Newton form of the interpolating
% polynomial using divided differences.

n = length(f) - 1;

F = zeros(n+1, n+1);

F(:,1) = f;

for j=1:n
    for k=j:n
        F(k+1, j+1) = (F(k+1, j) - F(k, j))/(x(k+1)-x(k-j+1));
    end
end

F
a = diag(F);