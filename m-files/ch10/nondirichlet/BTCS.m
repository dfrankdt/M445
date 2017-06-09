function [x, t, w] = BTCS(nt)
% Goal: Use BTCS to approximate the solution to the test problem given in
% Bradie, section 10.4, example 10.

% discretize space, set initial profile
x0 = 0; xN = 1; 
N = 20; dx = (xN - x0)/N;
x = x0:dx:xN; x = x(:);
f = 2*sin(2*pi*x);

% discretize time, set boundary functions
t0 = 0; tf = 6;
dt = (tf - t0)/nt;
t = t0:dt:tf;

% Set constants
D = 1/16;
lambda = D*dt/dx^2;

% Set boundary functions
alpha = zeros(size(t));
p = 2*ones(size(t));
q = ones(size(t));
r = 8*t.*exp(-t);

% Initialize the approximate solution
w = zeros(N+1, nt+1);
w(:, 1) = f;

% Step through time
for n=1:nt
    % get decay, source terms, which depend on the current time step
    s = exp(-t(n+1))*(8*x.^2 - t(n+1));
    beta = 4*x.*(1-x);

    % Get source term corresponding to boundary conditions
    b = zeros(size(x));
    % adjust for Neumann condition at x=0
    b(1) = -2*dx*alpha(n+1);  
    % adjust for Robin condition at x=1
    b(N+1) = -2*dx*r(n+1)/q(n+1);    
    
    % Center space second derivative
    A = 2*eye(N+1);
    A = A - diag(ones(N, 1), 1) - diag(ones(N, 1), -1);
    % adjust for Neumann condition at x=0
    A(1, 2) = -2;
    % adjust for Robin condition at x=1
    A(N+1, N) = -2;  
    A(N+1, N+1) = 2*(1 + dx*p(n)/q(n));
    
    % decay term
    B = diag(beta);
    
    % BTCS matrix
    E_BTCS = (eye(N+1) + lambda*A + dt*B);
    
    % Step forward
    w(:, n+1) = E_BTCS\(w(:, n) - lambda*b + dt*s);
end

