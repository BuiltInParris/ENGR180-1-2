%% Assignment 2
% Stevie Parris
% April 16, 2014
% ENGR 180 - 087

function drawShape()
%Create plot
figure;
hold on
axis equal;

%Output options
fprintf('Choose one of the following numbers:\n1.   Right angle Triangle\n2.   Circle\n3.   Square\n4.   Pentagon\n5.   Hexagon\n6.   Octagon\n7.   Star\n8.   Rhombus\n9.   Trapezoid\n');
prompt = 'What shape would you like draw?\n';
prompt2 = 'What color would you like the shape to be? (r is red, g is green, b is blue, m is magenta, w is white)\n';
%Get input
shape = input(prompt, 's');
color = input(prompt2, 's');

%Test what user entered, then draw and fill accordingly.
if shape == '1' % Right Angle Triangle
xCoordinates = [0, 0, 2]; 
yCoordinates = [0, 2, 2];
fill(xCoordinates, yCoordinates, color);
end
if shape == '2' % Circle
    t = (0:0.01:1)*2*pi;
    x = cos(t);
    y = sin(t);
    fill(x, y, color);
end
if shape == '3' % Square
    xCoordinates = [0, 0, 2, 2];
    yCoordinates = [2, 0, 0, 2];
    fill(xCoordinates, yCoordinates, color);
end
if shape == '4' % Pentagon
    sides = 5;
    t0 = 1/4;
    t = (t0:1/sides:1+t0)*2*pi;
    xCoordinates = cos(t);
    yCoordinates = sin(t);
    fill(xCoordinates, yCoordinates, color);
end
if shape == '5' % Hexagon
    sides = 6;
    t0 = 1/4;
    t = (t0:1/sides:1+t0)*2*pi;
    xCoordinates = cos(t);
    yCoordinates = sin(t);
    fill(xCoordinates, yCoordinates, color);
end
if shape == '6' % Octagon
    sides = 8;
    t0 = 1/4;
    t = (t0:1/sides:1+t0)*2*pi;
    xCoordinates = cos(t);
    yCoordinates = sin(t);
    fill(xCoordinates, yCoordinates, color);end
if shape == '7' % Star
xCoordinates = [6.5, 12, 10.5, 14, 9, 6.5, 5, 0, 3.5, 2];
yCoordinates = [11.5, 14, 9, 5.5, 5, 0, 5, 5.5, 9, 14];
fill(xCoordinates, yCoordinates, color);
end
if shape == '8' % Rhombus
xCoordinates = [1, 0, -1, 0];
yCoordinates = [0, 1, 0, -1];
fill(xCoordinates, yCoordinates, color);
end
if shape == '9' %Trapezoid
xCoordinates = [-4, -2, 2, 4];
yCoordinates = [2, 4, 4, 2];
fill(xCoordinates, yCoordinates, color);
end
end