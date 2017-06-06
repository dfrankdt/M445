function [x, t, w] = test_CN(dt)

x0 = 0; xN = 1; Nx = 20;
dx = (xN - x0)/Nx;
x = x0:dx:xN; x=x(:);

t0 = 0; Nt = 40;
t = linspace(t0, dt*Nt, Nt+1);

f = 2*x - 2*(2*x-1).*(2*x-1>0);

w = zeros(Nx-1, Nt+1);
w(:, 1) = f(2:Nx);

A = 2*diag(ones(Nx-1, 1)) - diag(ones(Nx-2, 1), 1) - diag(ones(Nx-2, 1), -1);
lam = dt/dx^2;

for n = 1:Nt
    % solve (I + lam/2 A) w^(n+1) = (I - lam/2 A) w^n
    w(:, n+1) = (eye(Nx-1) + lam/2*A)\((eye(Nx-1) - lam/2*A)* w(:, n));
end

w = [zeros(1, Nt+1)
    w
    zeros(1, Nt+1)];
