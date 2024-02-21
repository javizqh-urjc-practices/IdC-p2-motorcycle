close all
clc
clear

syms q1 q1dot q1ddot q2 q2dot q2ddot tao m1 m2 I1 I2 l1 lc1 g u;

% Known variables
% m1 = 200;
% m2 = 50;
% I1 = 25;
% I2 = 5;
% l1 = 1;
% lc1 = 0.5;
% g = 9.81;
tao = u

% State space representation x = [q1, q2, q1dot, q2dot];

% Define the dynamic equations
ecuaciones = [((m1*lc1^2 + m2*l1^2 + I1 + I2)*q1ddot + I2*q2ddot -(m1*lc1 +m2*l1)*g*sin(q1)==0),
(I2*q1ddot + I2*q2ddot - tao ==0)];
% Solve q1ddot and q2ddot
[q1ddot, q2ddot] = solve (ecuaciones,[q1ddot, q2ddot]);

% State representation
xdot = [q1dot; q2dot; q1ddot; q2ddot]
