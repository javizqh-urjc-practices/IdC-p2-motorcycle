% Adapted from https://www.ensta-bretagne.fr/jaulin/

% State x = (x(1),x(2))

function prac2_draw(t,x,w)
    l1 = 1;
    lc1 = 0.5;
    % Dibujar segmento desde 0,0 a su posicion con long 1
    % Dibujar segmento desde extremo del anterior a su otra pos con long
    clf()
    hold on;
    axis square;
    axis([-1,1, 0,2]);
    plot([0, -sin(x(1))*l1],[0, cos(x(1))*l1], 'black','LineWidth',3) % Segmento de tamaño 1, radio pendulo
    plot([0-sin(x(1))*l1, -sin(x(1))*l1-sin(x(2))*lc1],[cos(x(1))*l1, cos(x(1))*l1+cos(x(2))*lc1], 'red','LineWidth',3) % Segmento de tamaño 0.5, radio rueda
    viscircles([-sin(x(1))*l1 cos(x(1))*l1],lc1); % Dibujo circulo
end