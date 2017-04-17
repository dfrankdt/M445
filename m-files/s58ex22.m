% Bradie: section 5.8, example 22

clear; close all

% distance
x = [12;
     25;
     33;
     43;
     50;
     52;
     59;
     67;
     73;
     82;
     87;
     90;
     95];
 
 % toll
 y = [.45;
     .7;
     .95;
     1.2;
     1.85;
     1.45;
     1.55;
     1.70;
     1.85;
     2.15;
     2.2;
     2.4;
     2.65];
 
 u = polyfit(x, y, 1);
 a = u(2)
 b = u(1)
 
 xhat = [min(x) max(x)];
 yhat = a + b*xhat;
 
 % to get the toll at a distance of 48 miles from the toll both, we use the
 % matlab function polyval
 
 xnew = 48;
 ynew = polyval(u, xnew)
 
 plot(x, y, '*', xhat, yhat, 'k', xnew, ynew, 'ok')
 
 
     