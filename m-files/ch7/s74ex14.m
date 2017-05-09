function s74ex14
% Bradie: section 7.4, example 14
%
% Goal: approximate the solution to x' = 1 + x/t, x(1) = 1 on the interval
% 1 <= t <= 6 using the classical RK4 method.

a = 1; b = 6;
x0 = 1;
N = 5;

dt = (b-a)/N;
t = a:dt:b; t = t(:);

w = zeros(size(t));
w(1) = x0;

for i=1:N
    k1 = rhs(t(i), w(i));
    k2 = rhs(t(i) + dt/2, w(i) + dt/2*k1);
    k3 = rhs(t(i) + dt/2, w(i) + dt/2*k2);
    k4 = rhs(t(i) + dt, w(i) + dt*k3);

    dw = (k1 + 2*k2 + 2*k3 + k4)/6*dt;
    w(i+1) = w(i) + dw;
end

x = t.*(1 + log(t));

% pretty print results
clc
pfmt = '%.1f\t %.6f\t %.6f\t %.6f\n';
fprintf('t_i\t w_i\t\t x(t_i)\t\t |x(t_i) - w_i|\n')
for i=1:N+1
    fprintf(pfmt, t(i), w(i), x(i), abs(x(i) - w(i)));
end
end

function f = rhs(t, x)
  f = 1 + x/t;
end
  