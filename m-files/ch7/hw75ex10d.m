function hw75ex10d
% Bradie: Section 7.5, exercise 10(d)
%
% Goal: Demonstrate that the global error associated with the two-step
% Adams-Bashforth method is O(h^2).  
    clc

    a = 0; b = 2;
    x0 = -2;

    ntests = 12;
    appx = zeros(ntests, 1);

    for k = 1:ntests
        N = 10*2^(k-1);
        [t, w] = doAB2(a, b, N, x0);

        appx(k) = w(N+1);

        plot(t, w, 'r--')
        pause(0.25)
    end
    
    % pretty print results
    fprintf('N\t Approximate w(2)\t Difference Ratio\n')
    pfmt = '%i\t %.6f\t\t %.6f\n';
    for k=1:ntests
        if k<=2
            fprintf(pfmt, 2^k, appx(k), '')
        else
            fprintf(pfmt, 2^k, appx(k), (appx(k-2)- appx(k-1))/(appx(k-1) - appx(k)))
        end
    end

end

function rhs = f(t, x)
    rhs = 2*t*(x+1)/x;
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