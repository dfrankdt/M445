function s73ex11
% Bradie: section 7.3, example 11

a = 1; b = 6; N = 10;
dt = (b-a)/N;
x0 = 1;

t = a:dt:b; t=t(:);
w = zeros(size(t));
w(1) = x0;

for i=1:N
    [f, fp, fpp, fppp] = rhs(t(i), w(i));
    dw = f*dt + 1/2*fp*dt^2 + 1/6*fpp*dt^3 + 1/24*fppp*dt^4;
    w(i+1) = w(i) + dw;
end

w

end

function [f, fp, fpp, fppp] = rhs(t, x)
    f = 1 + x/t;
    fp = (t*f - x)/t^2;
    fpp = fp/t - 2*f/t^2 + 2*x/t^3;
    fppp = fpp/t - 3*fp/t^2 + 6*f/t^3 - 6*x/t^4;
end
