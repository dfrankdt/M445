function s101ex1_refine
% We find the numerical solution of Bradie, section 10.1, example 1 and
% refine to verify the scheme satisfies the correct order.
% 
% The exact solution is 2 exp(-pi^2/4 t) sin(2 pi x)

% Spatial/initial profile
N = 512; dx = 1/N;
x = 0:dx:1; x = x(:);
f = 2*sin(2*pi*x);

% Exact solution at t=1
uex = 2*exp(-pi^2/4)*sin(2*pi*x);

ntests = 7;
E_FT = zeros(ntests,1);
E_BT = zeros(ntests,1);
E_CN = zeros(ntests,1);

for k=1:ntests
    nt = 2^k;
    [t, wf] = FTCS(1, nt);
    E_FT(k) = norm(uex - wf(:, nt+1), inf);
    [t, wb] = BTCS(1, nt);
    E_BT(k) = norm(uex - wb(:, nt+1), inf);
    [t, wcn] = CN(1, nt);
    E_CN(k) = norm(uex - wcn(:, nt+1), inf);
end

E_BT(1:k-1)./E_BT(2:k)
    

% FTCS
function [t, w] = FTCS(tf, nt)
    dt = tf/nt;
    t = 0:dt:tf;

    % Initialize approximate solution and construct differentiation matrix
    w = zeros(N-1, nt+1);
    w(:, 1) = f(2:N);

    A = 2*eye(N-1) - diag(ones(N-2, 1), 1) - diag(ones(N-2, 1), -1);
    lam = 1/16*dt/dx^2;

    E = (eye(N-1) - lam*A);

    % step forward
    for n=1:nt
        w(:, n+1) = E*w(:, n);
    end
    % Embed into boundary values
    w = [zeros(size(t));
         w
         zeros(size(t))];
end

% BTCS
function [t, w] = BTCS(tf, nt)
    dt = tf/nt;
    t = 0:dt:tf;

    % Initialize approximate solution and construct differentiation matrix
    w = zeros(N-1, nt+1);
    w(:, 1) = f(2:N);

    A = 2*eye(N-1) - diag(ones(N-2, 1), 1) - diag(ones(N-2, 1), -1);
    lam = 1/16*dt/dx^2;

    E = (eye(N-1) + lam*A);

    % step forward
    for n=1:nt
        w(:, n+1) = E\w(:, n);
    end
    % Embed into boundary values
    w = [zeros(size(t));
         w
         zeros(size(t))];
end

% BTCS
function [t, w] = CN(tf, nt)
    dt = tf/nt;
    t = 0:dt:tf;

    % Initialize approximate solution and construct differentiation matrix
    w = zeros(N-1, nt+1);
    w(:, 1) = f(2:N);

    A = 2*eye(N-1) - diag(ones(N-2, 1), 1) - diag(ones(N-2, 1), -1);
    lam = 1/16*dt/dx^2;

    EL = (eye(N-1) + 1/2*lam*A);
    ER = (eye(N-1) - 1/2*lam*A);

    % step forward
    for n=1:nt
        w(:, n+1) = EL\ER*w(:, n);
    end
    % Embed into boundary values
    w = [zeros(size(t));
         w
         zeros(size(t))];
end

end
