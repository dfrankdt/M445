clear

P = [308.6 362.6 423.3 491.4];
v = [0.055389 0.047485 0.040914 0.035413];

t = linspace(300, 500, 2^9+1);
n = length(P) - 1;

for j=0:n
    L(j+1, :) = ones(size(t));
    for k=0:n
        if k==j
            L(j+1, :) = L(j+1, :);
        else
            L(j+1, :) = L(j+1, :).*(t - P(k+1))./(P(j+1) - P(k+1));
        end
    end
end

g = zeros(size(t));
for j=0:n
    g = g + L(j+1,:)*v(j+1);
end
[ta, ga] = myLagrange(P, v, 300, 500);
plot(P,v,'ok', t, g,'k', ta, ga, '--r')

hold on
plot(t(2^8+1), g(2^8+1),'*')
hold off
    