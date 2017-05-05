function s73ex9
% Bradie: section 7.3, example 9.
%
% Goal: Reproduce the figure Bradie uses to demonstrate that, functions
% evaluations being equal, the higher order method out performs the lower
% order method.

a = 1; b = 6;
x0 = 1;

% Euler method, N = 40 steps (using 40 function evaluations)
N = 40; dt = (b-a)/N;
te = a:dt:b; te = te(:);
we = zeros(size(te));
we(1) = x0;

for i=1:N
    [f, ~, ~, ~] = rhs(te(i), we(i));
    dw = f*dt;
    we(i+1) = we(i) + dw;
end
xe = te.*(1 + log(te));

% Second order Taylor method, N = 20 steps (using 40 function evaluations)
N = 20; dt = (b-a)/N;
t2 = a:dt:b; t2 = t2(:);
w2 = zeros(size(t2));
w2(1) = x0;

for i=1:N
    [f, fp, ~, ~] = rhs(t2(i), w2(i));
    dw = f*dt + 1/2*fp*dt^2;
    w2(i+1) = w2(i) + dw;
end
x2 = t2.*(1 + log(t2));

% Fourth order Taylor method, N = 10 steps (using 40 function evaluations)
N = 10; dt = (b-a)/N;
t4 = a:dt:b; t4 = t4(:);
w4 = zeros(size(t4));
w4(1) = x0;

for i=1:N
    [f, fp, fpp, fppp] = rhs(t4(i), w4(i));
    dw = f*dt + 1/2*fp*dt^2 + 1/6*fpp*dt^3 + 1/24*fppp*dt^4;
    w4(i+1) = w4(i) + dw;
end
x4 = t4.*(1 + log(t4));

% do the plotting to compare
plot(te, log(abs(xe - we))/log(10), 'k',...
    t2, log(abs(x2-w2))/log(10), 'k-.', ...
    t4, log(abs(x4-w4))/log(10), 'k--')
legend('Euler''s Method', '2nd order Taylor', '4th order Taylor', ...
    'Location', 'Northwest')
xlabel('t')
ylabel('log_{10} (absolute error)')



end





function [f, fp, fpp, fppp] = rhs(t, x)
    f = 1 + x/t;
    fp = (t*f - x)/t^2;
    fpp = fp/t - 2*f/t^2 + 2*x/t^3;
    fppp = fpp/t - 3*fp/t^2 + 6*f/t^3 - 6*x/t^4;
end
