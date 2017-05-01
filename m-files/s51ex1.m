% Bradie: section 5.1 example 1
% Update: 1 May 2017
clear

x = 400;

P = [362.6 423.3];
vg = [0.047485 0.040914];

y = (x - P(2))/(P(1) - P(2))*vg(1) + (x - P(1))/(P(2)-P(1))*vg(2)

