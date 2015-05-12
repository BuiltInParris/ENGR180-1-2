%% ENGR 180-122: Biweekly Assignment 3
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

%% PART 2
% There was once a young boy by the name of Gerald. Gerald was seven years
% old and had spent the day at the zoo with his mother. You see, Gerald had
% a deep love for icecream, and so begged his mother to buy him a cone. His
% mother was not fond of letting her son get sweets, so she refused for
% some time until his begging became simply unbearable. Gerald grinned as
% they approached the brightly colored icecream vendor and stared in wonder
% at the variety of flavors the vendor had to offer. Deep in thought, with
% his tongue sticking out of the side of his mouth, Gerald ran his finger
% across the options until he reached cotton candy and pointed. "This one!"
% he said to his mother, and she paid the icecream man accordingly.
% Unfortunately, Gerald only made it a few steps. As he took his fourth
% step, he felt the icecream slip sideways in his hand, and he cried aloud.
% The ball of delicious cotton candy icecream fell through the air, rolling
% for what seemed an eternity to poor Gerald, only to hit the pavement with
% a disappointing "squish." Gerald mourned as the icecream melted on the
% pavement as he watched.
% THE END



%Initiate, reset matlab windows
close all
clear all
clc
clf

% generate the figure window and axes
figure
myAxes = axes('xlim',[-5 5],'ylim',[-5 5],'zlim',[-5 5]);
view(3)
grid on;
axis equal
hold on
xlabel('x')
ylabel('y')
zlabel('z')


% generate sphere
[xSphere,ySphere,zSphere] = sphere(200);
% generate cone
[xCone, yCone, zCone] = cylinder([0.1, 0], 200); 

%Draw sphere
shape(1) = surface(xSphere,ySphere,zSphere);
set(shape(1), 'FaceColor', [0 1 1], 'EdgeColor', 'none'); %Set color cyan
camlight left; lighting phong %adjust lighting

%Draw cone
shape(2) = surface(xCone*10,yCone*10,zCone*4+0.2);
rotate(shape(2), [1 0 0], 180); %Rotate it 180 degrees
set(shape(2), 'FaceColor', [0.64, 0.16, 0.16], 'EdgeColor', 'none'); %Set color brown
camlight left; lighting phong

%Combine the icecream cone and the icecream into one object
combinedObject = hgtransform('parent',myAxes);
set(shape,'parent',combinedObject) 
drawnow 

%Run loop for the tilting of the icecream cone
for i = 1:50
    rotation1 = makehgtform('xrotate',(pi/180)*i*0.7); %create rotation matrix
    set(combinedObject,'matrix',rotation1); %rotate the object
    pause(0.01);
end

%delete hgt icecream cone
delete(combinedObject);

%recreate icecream ball
shape(1) = surface(xSphere,ySphere,zSphere);
set(shape(1), 'FaceColor', [0 1 1], 'EdgeColor', 'none');
camlight left; lighting phong

%make into an hgt object
combinedObject2 = hgtransform('parent',myAxes);
set(shape(1),'parent',combinedObject2) 
drawnow 

%create cone separately with new position
shape(2) = surface(xCone*10,yCone*10,zCone*4+0.2);
rotate(shape(2), [1 0 0], 180);
rotate(shape(2), [1 0 0], 35);
set(shape(2), 'FaceColor', [0.64, 0.16, 0.16], 'EdgeColor', 'none');
camlight left; lighting phong

%Icecream falling and rotating animation
for i = 1:50
    translation = makehgtform('translate',[0 0 (-i*0.1)]); %create translation matrix 
    rotation1 = makehgtform('xrotate',(-pi/180)*i*0.7); %create rotation matrix
    set(combinedObject2, 'matrix', rotation1*translation); %apply matrices
    pause(0.01);
end

%Scale the icecream to flatten it
for i = 1:0.05:5
    translation = makehgtform('translate',[0 -5 -5]);  
    scale1 = makehgtform('scale', [1 1 1/i]);
    set(combinedObject2, 'matrix', translation*scale1);
    pause(0.1);
end

%delete object
delete(combinedObject2);
