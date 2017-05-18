% PROBLEM3.m
%
% Goal: Demonstrate the Trapezoidal rule is O(h^2) on the test problem with
% f(x) = (x-1)^2 exp(-x^2) on the interval -1 <= x <= 1.

clear

% set the grid and initialize the tests
a = -1; b = 1;
ntests = 9;
T = zeros(ntests, 1);

% step through the tests refining the grid size by a factor of 2 each time
for k=1:ntests
    % set the grid
    n = 2^k;
    h = (b-a)/n;
    
    % set x and f(x)
    x = a:h:b; x = x(:);
    f = (x-1).^2.*exp(-x.^2);
    
    % do the trapezoidal rule
    T(k) = (sum(f(1:n)) + sum(f(2:n+1)))*h/2;
end

% pretty print the results
clc
fprintf('n\t h\t T_h(f)\t\t Error Ratio\n')
for k=1:ntests
    if k<=ntests-2
        RatDiff = (T(k) - T(k+1))/(T(k+1)-T(k+2));
        fprintf('%i\t 1/%i\t %.8f\t %.6f\n', 2^k, 2^(k-1),T(k), RatDiff)
    else
        fprintf('%i\t 1/%i\t %.8f\n', 2^k, 2^(k-1), T(k))
    end        
end
