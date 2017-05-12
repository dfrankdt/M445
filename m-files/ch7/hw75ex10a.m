function hw75ex10a
% Bradie: Section 7.5, exercise 10(a)
%
% Goal: Demonstrate that the global error associated with the two-step
% Adams-Bashforth method is O(h^2).  
    clc

    a = 0; b = 5;
    x0 = 1;

    ntests = 12;
    err = zeros(ntests, 1);

    for k = 1:ntests
        N = 10*2^(k-1);
        [t, w] = doAB2(a, b, N, x0);

        x = sqrt((2*t.^2 + sqrt(2)).^2 - 1);

        err(k) = abs(x(N+1) - w(N+1));

        plot(t, x, 'k', t, w, 'r--')
        pause(0.25)
    end
    
    % pretty print results
    fprintf('N\t Error\t\t Error Ratio\n')
    pfmt = '%i\t %.6e\t %.6f\n';
    for k=1:ntests
        if k==1
            fprintf(pfmt, 2^k, err(k), '')
        else
            fprintf(pfmt, 2^k, err(k), err(k-1)/err(k))
        end
    end

end

function rhs = f(t, x)
    rhs = 4*t*sqrt(x^2 + 1)/x;
end

function [t, w] = doAB2(a, b, N, x0)
    h = (b-a)/N;
    t = a:h:b; t = t(:);
    
    w = zeros(size(t));
    w(1) = x0;
    
    % get next step with Heun Method
    k1 = f(t(1), w(1))*h;
    k2 = f(t(1) + h, w(1) + k1)*h;
    
    dw = (k1 + k2)/2;
    w(2) = w(1) + dw;
    
    % implement the multistep method
    b2 = f(t(1), w(1))*h;
    for i=2:N
        b1 = f(t(i), w(i))*h;
        
        dw = (3*b1 - b2)/2;
        w(i+1) = w(i) + dw;
        
        b2 = b1;
    end
end