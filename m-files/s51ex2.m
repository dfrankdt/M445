%function s51ex2

x = [0 1.6 3.8 4.5 6.3 9.2 10];
n = length(x) - 1;

t = linspace(0, 10, 2^9+1);

j=1; 
L61 = ones(size(t));
for k=0:n
    if k==j
        L61=L61;
    else
        L61 = L61.*(t - x(k+1))./(x(j+1) - x(k+1));
    end
end

j = 3;
L63 = ones(size(t));

for k=0:n
    if k==j
        L63=L63;
    else
        L63 = L63.*(t - x(k+1))./(x(j+1) - x(k+1));
    end
end


plot(t, L61, 'k', t, L63, '--k', x, zeros(size(x)),'ok')
