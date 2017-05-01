% Why does the error in section 6.2, example 4 creep in at about h =
% 10^(-5) or 10^(-6)?

% Goal: Solve 6 ep exp(-x) - x^3 = 0 using Newton's method for various ep.

for k=1:15
ep = 10^(-k);

ep_list(k) = ep;

x = 0; 

g = 6*ep*exp(-x) - x^3;
gp = -6*ep*exp(-x) - 3*x^2;
check = abs(g); tol = 1e-14;
while (check > tol)
    
    x = x - g/gp;
    g = 6*ep*exp(-x) - x^3;
    gp = -6*ep*exp(-x) - 3*x^2;
    
    check = abs(g);
end

xlist(k) = x;
end
