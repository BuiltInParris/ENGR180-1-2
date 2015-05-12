%ENGR 180-122: Biweekly Assignment 3
%Stevie Parris - 5/14/2014
%This animates a box kicked under the effects of gravity and icecream
%falling off an icecream cone, then melting under the heat of the sun.

%Initiate, reset matlab windows
figure
close all
clear all
clc
clf

%Establish variables
translationX = 0;
translationY = 0;
beta = 0;

%t is time, incremented over 100 frames
t = linspace(0, 5.84, 100);

%coordinates of a square centered at the origin with a side length of 5.
square = [2.5, 2.5, -2.5, -2.5; 2.5, -2.5, -2.5, 2.5]; 

for i = 1:length(t)

%rotation factors as used by Newtonian Dynamics
rotationFactorX = [cos(beta), -sin(beta)]; 
rotationFactorY = [sin(beta), cos(beta)];

%Rotates the matrix the angle specified (beta)
triCartRot = [rotationFactorX * square; 
              rotationFactorY * square];

%Translate square
r = fill(triCartRot(1,:) + translationX, triCartRot(2,:) + translationY, 'y');

%Acquire the x and y terms according the physics equations.
translationX = 50*t(i)*cosd(35);
translationY = 50*t(i)*sind(35) - ((9.81*t(i)^2)/2);
beta = 15*pi/180*i; %turns 15 degrees each frame

hold off
axis([-5 300 0 50])
axis equal
axis manual
grid on
pause(0.01)

end

%Initiate, reset matlab windows
figure
close all
clear all
clc
clf