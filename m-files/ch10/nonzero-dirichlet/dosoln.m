% construct exact solution
clear; close all

[x, t, wcn] = CN(1, 100);
[x, t, wbt] = BTCS(1, 100);

xex = 0:0.01:1; xex = xex(:);
xex = x;
u0 = sin(pi*xex/2) + 1/2*sin(2*pi*xex);
for n = 1:length(t)
    uex = exp(-pi^2*t(n)/4)*sin(pi*xex/2) + 1/2*exp(-4*pi^2*t(n))*sin(2*pi*xex);
    plot(xex, uex, xex, u0, x, wbt(:, n), 'o')
    axis([0 1 0 1])
    xlabel('x')
    ylabel('u(x, t)')
    ptitle = ['Test Problem, t = ', num2str(t(n))];
    title(ptitle)    
    
    %Ebt = uex - wbt(:, n);
    %Ecn = uex - wcn(:, n);
    %plot(x, Ebt, x, Ecn)
    
    pause
end
