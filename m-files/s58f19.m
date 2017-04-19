% Bradie: Section 5.8, Figure 5.19

clear; close all

% Data: x = run size, y = total cost
x = [1550;
     852;
     2120;
     1128;
     1518; 
     786;
     1505;
     1264;
     1963;
     1414;
     2175;
     1213;
     3050;
     1215;
     2207;
     1234;
     1616;
     3089;
     2033;
     1467;];

 y = [17224;
      11314;
      22186;
      15982;
      16497;
      10536;
      15888;
      13055;
      22215;
      17510;
      24095;
      13474;
      29349;
      14459;
      23483;
      14444;
      18949;
      31237;
      21384;
      18012;];
  
  
  plot(x, y/1000, '*')
  xlabel('Run size')
  ylabel('Total production cost (thousands of dollars)')
  
  %% linear fit via gradient approach
  n = length(x);
  xbar = sum(x)/n;
  ybar = sum(y)/n;
  
  b = (n*sum(x.*y) - sum(x)*sum(y))/(n*sum(x.*x) - sum(x)^2)
  a = ybar - b*xbar
  
  xhat = [500 3500];
  yhat = a + b*xhat;
  
  plot(x, y/1000, '*', xhat, yhat/1000, 'k')
  xlabel('Run size')
  ylabel('Total production cost (thousands of dollars)')
  
  % Alternate approach: use polyfit to find the degree 1 polynomial which
  % best fits the data.  Note that the coefficients are of the form 
  %
  %    u(1)x + u(2)
  %
  % so the overhead cost (above given as a) is u(2) and the price per unit
  % (above given as b) is u(1)
  
  u = polyfit(x, y, 1);
  u(1)
  u(2)