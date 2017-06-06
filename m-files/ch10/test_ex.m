function [x, u] = test_ex(t)
% Goal: Truncate the Fourier series solution to the test problem
%
%  u_t = u_xx
%  u(0, t) = u(1, t) = 0
%  u(x, 0) = f(x)
%
% where f(x) = 2x (0 < x < 1/2); 2-2x (1/2 < x < 1)

x = 0:0.05:1; x=x(:);
u = zeros(size(x));

Nterms = 20;

for k=1:Nterms
    n = 2*k-1;
    lam = n*pi;
    bn = 8*(-1)^(k+1)/(lam)^2;
    
    u = u + bn*exp(-lam^2*t)*sin(lam*x);
end
