close all
clc
clear

syms x1 x2 x3 x4 tao m1 m2 I1 I2 l1 lc1 g u;

% Known variables
% m1 = 200;
% m2 = 50;
% I1 = 25;
% I2 = 5;
% l1 = 1;
% lc1 = 0.5;
% g = 9.81;
tao = u;

f1 = x3;
f2 = x4;
f3 = (g*l1*m2*sin(x1) - tao + g*lc1*m1*sin(x1))/(m2*l1^2 + m1*lc1^2 + I1);
f4 = (m2*tao*l1^2 - I2*g*m2*sin(x1)*l1 + m1*tao*lc1^2 - I2*g*m1*sin(x1)*lc1 + I1*tao + I2*tao)/(I2*(m2*l1^2 + m1*lc1^2 + I1));

% Estado de equilibrio
eqs = [f1; f2; f3; f4];
y = x2

A = jacobian(eqs,[x1, x2, x3, x4])
B = jacobian(eqs, u)
C = jacobian(y, [x1, x2, x3, x4])
D = jacobian(y, u)

Aeq = subs(A, [x1,x3,x4,u], [0,0,0,0])
eig(Aeq)
Beq = subs(B, [x1,x3,x4,u], [0,0,0,0])
Ceq = subs(C, [x1,x3,x4,u], [0,0,0,0])