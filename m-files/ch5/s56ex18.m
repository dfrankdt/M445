% Bradie: section 5.6, example 18
% Update: 1 May 2017
clear

% Goal: Get the clamped cubic spline to f(x) = (x+1)exp(-x) on [-1, 1].
%
% Note that the value of the derivative at the endpoints is f'(-1) = exp(1)
% and f'(1) = -exp(-1).

% set x, f, and f' values at the endpoints
x = linspace(-1, 1, 5);
f = (x+1).*exp(-x);
fp0 = exp(1);
fpn = -exp(-1);

% get the spline on the finer mesh given by t
t = linspace(-1, 1, 2^9+1);

y = [fp0 f fpn];
fs_clamped = spline(x, y, t);

% plot to compare
plot(x, f, 'o', t, fs_clamped, 'r')

%%
% Also get the cubic spline using not-a-knot bc
fs_not = spline(x, f, t);

% plot the errors
f_exact = (t+1).*exp(-t);
err_clamped = f_exact - fs_clamped;
err_not = f_exact - fs_not;

plot(t, err_clamped, 'k', t, err_not, '--k')
