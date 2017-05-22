function s78ex28alt
% Bradie: Section 7.8, example 28 -- Alternate Approach
%
% Goal: Solve the Van der Pol equation with ep = 4, x(0) = 0.75, x'(0) = 0
% on the interval 0 <= t <= 20.  Plot solutions as a function of t and in
% the phase plane.  Just use Matlab's built in ODE45

a = 0; b = 20;
w0 = [0.75 0];

[t, w] = ode45(@f, [a b], w0);

subplot(1, 2, 1)
plot(t, w(:, 1), 'r', t, w(:, 2), '--r')
xlabel('t')
ylabel('position/velocity')
legend('position', 'velocity', 'Location', 'SouthEast')

subplot(1, 2, 2)
plot(w(:, 1), w(:, 2), 'r')
xlabel('Position, x')
ylabel('Velocity, x''')

size(w)
end

function rhs = f(~, u)
    ep = 4; u1 = u(1); u2 = u(2);
    rhs = zeros(2, 1);
    rhs(1) = u2;
    rhs(2) = ep*(1 - u1^2)*u2 - u1;
end
