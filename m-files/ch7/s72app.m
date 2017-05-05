function s72app
m = 1.8; % per week
c = 0.001; % per person-week
H0 = 2850;
P = 3000;

a = 0; b = 10;
N = 100;

dt = (b-a)/N;
t = a:dt:b; t = t(:);
D = zeros(size(t));

for i=1:N
    f = rhs(D(i));
    dD = f*dt;
    D(i+1) = D(i) + dD;
end
H = H0*exp(-c*D/m);
I = P - H - D;

plot(t, H, 'k', t, I, '-.k', t, D, '--k')
xlabel('Time (weeks)')
ylabel('Number of Individuals')
legend('Healthy', 'Infected', 'Dead')
D(end)

function f = rhs(y)
    f = m*(P - y - H0*exp(-c*y/m));
end
end
