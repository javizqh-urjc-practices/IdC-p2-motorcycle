init;

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
     (g*l1*m2 + g*lc1*m1)/(m2*l1^2 + m1*lc1^2 + I1) , 0, 0, 0;
     -(I2*g*l1*m2 + I2*g*lc1*m1)/(I2*(m2*l1^2 + m1*lc1^2 + I1)), 0, 0, 0]
B = [0; 0; -1/(m2*l1^2 + m1*lc1^2 + I1);(m2*l1^2 + m1*lc1^2 + I1 + I2)/(I2*(m2*l1^2 + m1*lc1^2 + I1))];
C = [0 1 0 0];
E = [0 1 0 0];

% Calculamos K, L y H
K = place(A, B, pcon);
L = transpose(place(transpose(A), transpose(C), pobs));
H = -inv(E*inv(A-B*K)*B);

% Definimos los valores iniciales iguales, sino tarda mas en equilibrarse
x = [0.26179;0;0;0]; % Initial state
xhat = [0.26179;0;0;0];

eig(A -B*K)
w = 0;

dt = 0.005;
frame_counter=0;
t=0;
y = x(2);

u = -K*xhat + H*w;
prac2_draw(t,x,w); 

for t=0:dt:15
    w = 0;
    y = x(2);
    u = -K*xhat + H*w;
    
    x=x+prac2_f(x,u)*dt; % Euler
    %dt*(0.25*e_5p13_f(x,u)+0.75*(e_5p13_f(x+dt*(2/3)*e_5p13_f(x,u),u))); % Runge-Kutta
    xhat=xhat+prac2_obs_f(xhat,w,y)*dt; % Euler
    pause(dt);
    
    frame_counter =frame_counter+1;
    
    % Frame sampling
    if frame_counter == 15
       prac2_draw(t,x,w); 
       frame_counter =0;
    end
end;
