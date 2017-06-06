function [x, t, w] = FTCS(tf, nt)
% [x, t, w] = FTCS(tf, nt)
%
%  x - spatial scale
%  t - temporal scale
%  w - appx solution
%
% tf - final time (end time)
% nt - number of steps
%
% Goal: solve the test problem with nonzero boundary condition using N = 10
% steps in the x variable

% Spatial/initial profile
N = 10;  dx = 1/N;
x = 0:dx:1; x = x(:);

f = sin(pi*x/2) + 1/2*sin(2*pi*x);

% Temporal scale/boundary conditions
dt = (tf - 0)/nt;
t = 0:dt:1;

u0 = zeros(size(t));
u1 = exp(-pi^2*t/4);

% Initialize approximate solution and construct differentiation matrix
w = zeros(N-1, nt+1);
w(:, 1) = f(2:N);

A = 2*eye(N-1) - diag(ones(N-2, 1), 1) - diag(ones(N-2, 1), -1);
lam = dt/dx^2;

E = (eye(N-1) - lam*A);

% step forward
for n=1:nt
    b = zeros(N-1, 1);
    b(1) = u0(n);
    b(N-1) = u1(n);
    c = lam*b;
    
    w(:, n+1) = E*w(:, n) + c;
end

% embed w into boundary values

w = [u0
     w
     u1];
 



