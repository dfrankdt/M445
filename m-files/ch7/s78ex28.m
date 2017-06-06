function s78ex28
% Bradie: Section 7.8, example 28
%
% Goal: Solve the Van der Pol equation with ep = 4, x(0) = 0.75, x'(0) = 0
% on the interval 0 <= t <= 20.  Plot solutions as a function of t and in
% the phase plane.

a = 0; b = 20;
N = 450;
h = (b-a)/N;

t = a:h:b; t = t(:);

w0 = [0.75 0];
w = zeros(N+1, 2);
w(1, :) = w0;

for k=1:N
    k1 = f(t(k), w(k, :))*h;
    k2 = f(t(k) + h/2, w(k, :) + k1/2)*h;
    k3 = f(t(k) + h/2, w(k, :) + k2/2)*h;
    k4 = f(t(k) + h, w(k, :) + k3)*h;
    
    dw = (k1 + 2*k2 + 2*k3 + k4)/6;
    w(k+1, :) = w(k, :) + dw;
end

subplot(1, 2, 1)
plot(t, w(:, 1), 'k', t, w(:, 2), '--k')
xlabel('t')
ylabel('position/velocity')
legend('position', 'velocity', 'Location', 'SouthEast')

subplot(1, 2, 2)
plot(w(:, 1), w(:, 2), 'k')
xlabel('Position, x')
ylabel('Velocity, x''')

end

function rhs = f(~, u)
    ep = 4; u1 = u(1); u2 = u(2);
    rhs = zeros(1, 2);
    rhs(1) = u2;
    rhs(2) = ep*(1 - u1^2)*u2 - u1;
end

