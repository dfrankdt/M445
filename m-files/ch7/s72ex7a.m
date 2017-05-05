function s72ex7a
% Bradie: section 7.2, example 7a
%
% Note: this is a Matlab function rather than a script.
%
% Goal: approximate the solution to 
%
%   x' = 1 + x/t, 
%  x(1) = 1
%
% on [1, 6] using Euler's method with N steps.  Note that the exact
% solution is given by x(t) = t(1 + log(t)).  Vary so that the step size is
% h = 1/2, 1/4, 1/8, etc.

a = 1; b = 6;
x0 = 1;

ntests = 8;
err = zeros(ntests, 1);
appx = zeros(ntests, 1);

for k=1:ntests
    pn = k-1;
    N = 10*2^(pn);
    dt = (b-a)/N;

    t = a:dt:b; t = t(:);
    w = zeros(size(t)); w = w(:);

    w(1) = x0;
    for i=1:N
        f = rhs(t(i), w(i));
        dw = f*dt;
        w(i+1) = w(i) + dw;
    end

    % Identify exact solution
    x = t.*(1 + log(t));
    appx(k) = w(N+1);
    err(k) = abs(x(N+1) - w(N+1));
end

% pretty print the results
pfmt = ('1/%i\t %.8f\t\t %.6f\t\t %.5f\n');
clc
fprintf('h\t Approximate Solution\t Absolute Error\t\t Error Ratio\n')
for k=1:ntests
    if k==1
        fprintf(pfmt, 2^k, appx(k), err(k), '')
    else
        fprintf(pfmt, 2^k, appx(k), err(k), err(k-1)/err(k))
    end
end
end

function f = rhs(t, x)
f = 1 + x./t;
end
