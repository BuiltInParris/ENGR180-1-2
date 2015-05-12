% do not modify the function line below
function v = problem1

% coordinates of square under one variable
square = [2 2 -2 -2; 2 -2 -2 2];

% generate animation window
figure
xmin = -5;
xmax = 25;
ymin = -5;
ymax = 125;
axis equal
axis([xmin xmax ymin ymax])
hold on
%setting your trajectory
t = linspace(0, 20, 500);
trajectory = t.^2/4;
scale = linspace(1,0.25,500);

% all fill/drawing steps should occur in for loop
    for i = 1:500
         % fill in the appropriate inputs for fill
         h = fill(square(1,:)*scale(i) + t(i), square(2,:)*scale(i) + trajectory(i),'r'); 
         % do not change below 2 lines, should follow your fill command
         v.x(i,:) = get(h,'xdata')';
         v.y(i,:) = get(h,'ydata')';
         % add anything below
         pause(0.01);
         delete(h);
    end
    
end