function s72ex6b
% Bradie: section 7.2, example 6
%
% Note: this is a Matlab function rather than a script.
%
% Goal: approximate the solution to 
%
%   x' = t/x, 
%  x(0) = 1
%
% on [1, 5] using Euler's method with N = 10 steps.  Note that the exact
% solution is given by x(t) = sqrt(t^2 + 1)

a = 0; b = 5;
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
    x = sqrt(t.^2 + 1);
    appx(k) = w(N+1);
    err(k) = abs(w(N+1) - x(N+1));
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
f = t./x;
end
