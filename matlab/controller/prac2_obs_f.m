function  xhatdot  = f(xhat, w, y)
% Known variables
m1 = 200;
m2 = 50;
I1 = 25;
I2 = 5;
l1 = 1;
lc1 = 0.5;
g = 9.81;

% Ponemos los polos multiples en -2
pcon = [-2, -2.1, -2.2, -2.3];
pobs = [-2, -2.1, -2.2, -2.3];

% Redefinimos las matrices y creamos E
A = [0, 0, 1, 0;
     0, 0, 0, 1;
     (g*l1*m2 + g*lc1*m1)/(m2*l1^2 + m1*lc1^2 + I1), 0, 0, 0;
     -(I2*g*l1*m2 + I2*g*lc1*m1)/(I2*(m2*l1^2 + m1*lc1^2 + I1)), 0, 0, 0];
B = [0; 0; -1/(m2*l1^2 + m1*lc1^2 + I1);(m2*l1^2 + m1*lc1^2 + I1 + I2)/(I2*(m2*l1^2 + m1*lc1^2 + I1))];
C = [0 1 0 0];
E = [0 1 0 0];

% Calculamos K y L
K = place(A, B, pcon);
L = transpose(place(transpose(A), transpose(C), pobs));
H = -inv(E*inv(A-B*K)*B);

xhatdot= (A - B*K -L*C)*xhat + B*H*w +L*y;

end