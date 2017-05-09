function s74ex13
% Bradie: section 7.4, example 13
%
% Goal: Approximate the solution to
%
%  x' = 1 + x/t
%  x(1) = 1
%
% using a RK2 method, specifically the Heun method.  The exact solution is
% x(t) = t(1 + log(t))

a = 1; b = 6;
x0 = 1;

N = 10; dt = (b-a)/N;
t = a:dt:b; t = t(:);

w = zeros(size(t));
w(1) = x0;

for i=1:N
    % compute two slopes
    k1 = rhs(t(i), w(i));
    k2 = rhs(t(i) + dt, w(i) + dt*k1);
    
    % step forward using average
    dw = (k1 + k2)/2*dt;
    w(i+1) = w(i) + dw;
end

% exact solution
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
