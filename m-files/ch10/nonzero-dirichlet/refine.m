% Goal: do a refinement test.
clear; close all

tf = 1; 
ntests = 7;
rmsE = zeros(ntests, 1);
maxE = zeros(ntests, 1);

for k=1:ntests
    nt = 10*2^(k-1);
    [x, t, w] = BTCS(tf, nt);
    N = length(x)-1;
    
    uex = exp(-pi^2/4)*sin(pi*x/2) + 1/2*exp(-4*pi^2)*sin(2*pi*x);
    err = uex - w(:, nt+1);
    
    rmsE(k) = sqrt(1/N*sum(err(2:end-1).^2));
    maxE(k) = max(err(2:end-1));
end

rmsE(1:ntests-1)./rmsE(2:ntests)
maxE(1:ntests-1)./maxE(2:ntests)    

