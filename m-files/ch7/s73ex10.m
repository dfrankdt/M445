function s73ex10
% Bradie: section 7.3, example 10

a = 1; b = 6; N = 20;
dt = (b-a)/N;
x0 = 1;

t = a:dt:b; t=t(:);
w = zeros(size(t));
w(1) = x0;

for i=1:N
    [f, fp] = rhs(t(i), w(i));
    dw = f*dt + 1/2*fp*dt^2;
    w(i+1) = w(i) + dw;
end

w

end

function [f, fp] = rhs(t, x)
    f = 1 + x/t;
    fp = (t*f - x)/t^2;
end
