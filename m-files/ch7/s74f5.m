function s74f5
% Bradie: section 7.4, figure 5
%
% Goal: approximate the solution to x' = 1 + x/t, x(1) = 1 on the interval
% 1 <= t <= 6 using Euler, Modified Euler, and classical RK4 method,
% changing the step size so that each solution requires the same number of
% steps.
close all

a = 1; b = 6;
x0 = 1;

% RK4
N = 50;

dt = (b-a)/N;
t4 = a:dt:b; t4 = t4(:);

w4 = zeros(size(t4));
w4(1) = x0;

for i=1:N
    k1 = rhs(t4(i), w4(i));
    k2 = rhs(t4(i) + dt/2, w4(i) + dt/2*k1);
    k3 = rhs(t4(i) + dt/2, w4(i) + dt/2*k2);
    k4 = rhs(t4(i) + dt, w4(i) + dt*k3);

    dw = (k1 + 2*k2 + 2*k3 + k4)/6*dt;
    w4(i+1) = w4(i) + dw;
end

x = t4.*(1 + log(t4));
ew4 = abs(x - w4);

% Modified Euler
N = 100;

dt = (b-a)/N;
t2 = a:dt:b; t2 = t2(:);

w2 = zeros(size(t2));
w2(1) = x0;

for i=1:N
    k1 = rhs(t2(i), w2(i));
    k2 = rhs(t2(i) + dt/2, w2(i) + dt/2*k1);

    dw = k2*dt;
    w2(i+1) = w2(i) + dw;
end
x = t2.*(1 + log(t2));
ew2 = abs(x - w2);

% Standard Euler

N = 200;

dt = (b-a)/N;
t1 = a:dt:b; t1 = t1(:);

w1 = zeros(size(t1));
w1(1) = x0;

for i=1:N
    dw = rhs(t1(i), w1(i))*dt;
    w1(i+1) = w1(i) + dw;
end
x = t1.*(1 + log(t1));
ew1 = abs(x - w1);

% do the plotting
plot(t1, log10(ew1), t2, log10(ew2), t4, log10(ew4))
xlabel('t')
ylabel('log_{10}(absolute error)')
end

function f = rhs(t, x)
  f = 1 + x/t;
end