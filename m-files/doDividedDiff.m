function a = doDividedDiff(x, f)
% DODIVIDEDDIFFERRENCE
% Update: 1 May 2017
%
% Goal:
%  Algorithm for performing divided differences in order to obtain
%  the Newton form of the interpolating polynomial.
%
% Input:
%  x: vector containing n+1 distinct abscissa
%  f: vector containing n+1 values in order to interpolate 
%
% Output:
%  a: vector containing the coefficients of the desired Newton form
%  of the interpolating polynomial 

n = length(f) - 1;

F = zeros(n+1, n+1);

F(:,1) = f;

for j=1:n
    for k=j:n
        F(k+1, j+1) = (F(k+1, j) - F(k, j))/(x(k+1)-x(k-j+1));
    end
end

a = diag(F);
