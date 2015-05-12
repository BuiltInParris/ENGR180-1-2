% do not modify the function line below
function [v, square] = problem2

% coordinates of square under one variable
square = [2.5 1.5 -1.5 -1.5; 1.5 -1.5 -1.5 1.5];
% generate animation window
figure
xmin = -pi;
xmax = 7*pi;
ymin = -8;
ymax = 8;
axis equal
axis([xmin xmax ymin ymax])
grid on
hold on

%setting your trajectory
t = linspace(0, 6*pi, 500); % independent variable of your function
trajectory = cos(t); % represents y in y = cos(t)




plot(t,trajectory,':')
    for i = 1:length(t)
        rotationFactorX = [cosd(36/5*i), -sind(36/5*i)];
        rotationFactorY = [sind(36/5*i), cosd(36/5*i)];
        size(rotationFactorX)
        size(square(1,:))
        h = fill(rotationFactorX*square(1,:) + t(i), rotationFactorY*square(2,:) + trajectory(i),'r');
        % do not change below 2 lines, should follow your fill command
        v.x(i,:)=get(h,'xdata')';
        v.y(i,:)=get(h,'ydata')';
        
        % add anything below
        pause(0.005);
        delete(h);
    end
end