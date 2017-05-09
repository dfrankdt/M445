function s74f4
% Bradie: section 7.4, figure 4. 
%
% Goal: estimate the solution to the two IVP which produce Figure 4.

% Subfigure (a): solve x' = 1 + x/t, x(1) = 1.
a = 1; b = 6;
x0 = 1;

N = 100;

dt = (b-a)/N;
t = a:dt:b;

wM = zeros(size(t));
wM(1) = x0;

wH = wM;
wO = wM;
wT = wM;

for i = 1:N
    % Modified Euler
    k1 = rhs1(t(i), wM(i));
    k2 = rhs1(t(i) + dt/2, wM(i) + dt/2*k1);
    
    dwM = k2*dt;
    wM(i+1) = wM(i) + dwM;
    
    % Heun
    k1 = rhs1(t(i), wH(i));
    k2 = rhs1(t(i) + dt, wH(i) + dt*k1);
    
    dwH = (k1 + k2)/2*dt;
    wH(i+1) = wH(i) + dwH;
    
    % Optimal RK2
    k1 = rhs1(t(i), wO(i));
    k2 = rhs1(t(i) + 2*dt/3, wO(i) + 2*dt*k1/3);
    
    dwO = (k1 + 3*k2)/4*dt;
    wO(i+1) = wO(i) + dwO;
    
    % Second order Taylor
    f = 1 + wT(i)/t(i);
    fp = (t(i)*f - wT(i))/(t(i))^2;

    dwT = f*dt + 1/2*fp*dt^2;
    wT(i+1) = wT(i) + dwT;
end

x = t.*(1 + log(t));
eM = abs(x - wM);
eH = abs(x - wH);
eO = abs(x - wO);
eT = abs(x - wT);

subplot(2,1,1)
plot(t, log10(eM), t, log10(eH), t, log10(eO), t, log10(eT))
xlabel('t')
ylabel('log_{10}(absolute error)')
legend('Modified Euler', 'Heun', 'Optimal RK2', '2nd Taylor', ...
    'Location', 'SouthEast')

%

% Subfigure (a): solve x' = t/x, x(0) = 1.
a = 0; b = 5;
x0 = 1;

N = 100;

dt = (b-a)/N;
t = a:dt:b;

wM = zeros(size(t));
wM(1) = x0;

wH = wM;
wO = wM;
wT = wM;

for i = 1:N
    % Modified Euler
    k1 = rhs2(t(i), wM(i));
    k2 = rhs2(t(i) + dt/2, wM(i) + dt/2*k1);
    
    dwM = k2*dt;
    wM(i+1) = wM(i) + dwM;
    
    % Heun
    k1 = rhs2(t(i), wH(i));
    k2 = rhs2(t(i) + dt, wH(i) + dt*k1);
    
    dwH = (k1 + k2)/2*dt;
    wH(i+1) = wH(i) + dwH;
    
    % Optimal RK2
    k1 = rhs2(t(i), wO(i));
    k2 = rhs2(t(i) + 2*dt/3, wO(i) + 2*dt*k1/3);
    
    dwO = (k1 + 3*k2)/4*dt;
    wO(i+1) = wO(i) + dwO;
    
    % Second order Taylor
    f = t(i)/wT(i);
    fp = (wT(i) - t(i)*f)/(wT(i))^2;

    dwT = f*dt + 1/2*fp*dt^2;
    wT(i+1) = wT(i) + dwT;
end

x = sqrt(1 + t.^2);
eM = abs(x - wM);
eH = abs(x - wH);
eO = abs(x - wO);
eT = abs(x - wT);

subplot(2,1,2)
plot(t, log10(eM), t, log10(eH), t, log10(eO), t, log10(eT))
xlabel('t')
ylabel('log_{10}(absolute error)')

end

function f = rhs1(t, x)
  f = 1 + x/t;
end

function f = rhs2(t, x)
  f = t/x;
end