%% Assignment 2
% Stevie Parris
% April 16, 2014
% ENGR 180 - 087

%% Part 1
%assign variables
x = 0;
y = 0;
scale = 1;
beta = 30*pi/180; %Rotational factor
rotationFactorX = [cos(beta), -sin(beta)];
rotationFactorY = [sin(beta), cos(beta)];



%Create plot
figure
hold on
axis ([0 80 0 80]);

%Draw first box
xCoordinates = [0, 0, 2, 2]; 
yCoordinates = [2, 0, 0, 2];
mybox = fill(xCoordinates, yCoordinates, 'b');

%Draw next 10 boxes
for i=1:10
pause(0.05) %pause for animation style
delete(mybox);
x = x + 4; %change location of x
y = y + 4; %change location of y
scale = scale * 0.9; %change amount scaled
%set coordinates
xCoordinates = [(0 + x)*scale + x, (0 + x)*scale + x, (2 + x)*scale + x, (2 + x)*scale + x];
yCoordinates = [(2 + y)*scale + y, (0 + y)*scale + y, (0 + y)*scale + y, (2 + y)*scale + y];
triStore = [xCoordinates; yCoordinates];
%(*rotationFactorX *rotationFactorY);
triCoordinates = [rotationFactorX*triStore; rotationFactorY*triStore];
mybox = fill(triCoordinates(1,:), triCoordinates(2, :), 'b');
%mybox = fill(xCoordinates, yCoordinates, 'b');
%change color opacity
fade = 1 - (i/10);
set(mybox,'facealpha', fade);
end

%% Part 2
%drawShape();