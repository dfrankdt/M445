function s78ex27
% Bradie: Section 7.8, example 27.  We solve the catalyzed reaction scheme
% on the interval from 0 <= t <= 1000 using N = 1000000, corresponding to a
% step size of h=0.001.

a = 0; b = 1000;
N = 1e6;
h = (b-a)/N;
hold on
for lambda = [10 1 0.1 0.01]

t = a:h:b; t = t(:);
w0 = [1 1];
w = zeros(N+1, 2);

w(1, :) = w0;

for k=1:N
    k1 = f(t(k), w(k, :))*h;
    k2 = f(t(k) + h/2, w(k, :) + k1/2)*h;
    k3 = f(t(k) + h/2, w(k, :) + k2/2)*h;
    k4 = f(t(k) + h, w(k, :) + k3)*h;
    
    dw = (k1 + 2*k2 + 2*k3 + k4)/6;
    w(k+1, :) = w(k,:) + dw;
end

u = w(:, 1); v = w(:, 2);

plot(u, v)
xlabel('u(t)')
ylabel('v(t)')
end

function rhs = f(t, w)
    rhs = zeros(1, 2);
    u = w(1); v = w(2);
    rhs(1) = -u*(lambda + u - v);
    rhs(2) = -v*(v - u);
end

end
