% problem2.m
clear

% The following commands create three sets of points spaced on the
% interval -1 <= x <= 1.

j = 0:14;

xe = -1 + 2*j/14; xe = xe(:);

xc = -cos(j*pi/14); xc = xc(:);

xl = [-0.987992518020485 
    -0.937273392400706    
    -0.848206583410427
    -0.724417731360170
    -0.570972172608539
    -0.394151347077563
    -0.201194093997435
     0
     0.201194093997435
     0.394151347077563
     0.570972172608539
     0.724417731360170
     0.848206583410427
     0.937273392400706
     0.987992518020485];
