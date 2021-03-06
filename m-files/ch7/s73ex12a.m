function s73ex12a
% Bradie: section 7.3, example 12 (second order Taylor refinement)

a = 1; b = 6; 
x0 = 1;

ntests = 8;
err = zeros(1, ntests);

for k=1:ntests
    pn = k-1;

    N = 10*2^pn;
    dt = (b-a)/N;

    t = a:dt:b; t=t(:);
    w = zeros(size(t));
    w(1) = x0;

    for i=1:N
        [f, fp] = rhs(t(i), w(i));
        dw = f*dt + 1/2*fp*dt^2;
        w(i+1) = w(i) + dw;
    end
    
    x = t.*(1 + log(t));
    err(k) = abs(x(N+1) - w(N+1));

    % pretty print the results

    pfmt = ('1/%i\t %.6e\t %.4f\n');
    clc
    fprintf('h\t Absolute Error\t Error Ratio\n')
    for k=1:ntests
        if k==1
            fprintf(pfmt, 2^k, err(k), '')
        else
            fprintf(pfmt, 2^k, err(k), err(k-1)/err(k))
        end
    end
end
 
end

function [f, fp] = rhs(t, x)
    f = 1 + x/t;
    fp = (t*f - x)/t^2;
end