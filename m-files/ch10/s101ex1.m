% Bradie: Section 10.1, example 1
%
% Goal: Approximate the solution to the heat equation u_t = D u_xx with
% zero Dirichlet boundary conditions and u(x, 0) = 2 sin(2 pi x) on the
% interval 0 <= x <= 1 with N = 4 and dt = 0.25.
clear

D = 1/16;
x0 = 0; xN = 1;
N = 2^6;
dx = (xN - x0)/N;
x = x0:dx:xN; x=x(:);

dt = 0.25; nt = 10;
t = 0:dt:dt*nt;

u0 = 2*sin(2*pi*x(2:N));
w = u0;
%%
A = diag(2*ones(1, N-1)) - diag(1*ones(1, N-2), 1) - diag(1*ones(1, N-2), -1);
lam = D*dt/(dx)^2;
b = zeros(N-1, 1);
%%
for n=1:nt
    w(:, n+1) = (eye(N-1) - lam*A)*w(:, n) + lam*b;
end

w = [zeros(1, nt+1); w; zeros(1, nt+1)]

for n=1:nt+1
    plot(x, w(:, n))
    axis([0 1 -4 4])
    pause(0.5)
end
