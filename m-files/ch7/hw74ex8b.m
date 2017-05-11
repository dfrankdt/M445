function hw74ex8b
% Bradie: Section 7.4, exercise 8(b)
%
% Goal: Solve tx' - 4x = t^5 exp(t), x(1) = 0, on 1 <= t <= 2 using a
% Modified Euler Method.  Demonstrate that the global error error is O(h^2)
% using the exact solution x(t) = t^4(exp(t) - exp(1))
    
    % initialize the testing
    ntests = 12;
    err = zeros(ntests, 1);

    % set the grid, initial value
    a=1; b=2; x0=0;
    
    % Do the solving
    for k=1:ntests
        N = 2*2^(k-1);
        [t, w] = doModEuler(a, b, N, x0);

        x = t.^4.*(exp(t) - exp(1));
        err(k) = abs(x(N+1) - w(N+1));

        plot(t, x, 'k', t, w, 'r--')
        pause(0.5)    
    end
    
    % pretty-print the results
    clc
    
    pfmt = '%i\t %.6e\t %.6f\n';
    for k=1:ntests
        if k==1
            fprintf(pfmt, 2^k, err(k), '')
        else
            fprintf(pfmt, 2^k, err(k), err(k-1)/err(k))
        end
    end
        

end

function [ rhs ] = f(t, x)
  rhs = t^4*exp(t) + 4*x/t;
end

function [t, w] = doModEuler(a, b, N, x0)
  h = (b - a)/N;
  t = a:h:b;  t = t(:);
  
  w = zeros(size(t));
  w(1) = x0;
  
  for i=1:N
      k1 = f(t(i), w(i))*h;
      k2 = f(t(i) + h/2, w(i) + k1/2)*h;
      
      dw = k2;
      w(i+1) = w(i) + dw;
  end
end
