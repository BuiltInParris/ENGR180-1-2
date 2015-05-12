function [totalTime, range, v] = flight(v0, alpha, y0)

g = 32;
totalTime = ((v0*sind(alpha)) + sqrt((v0*sind(alpha))^2+(2*g*y0)))/g;
range = v0*cosd(alpha)*totalTime;
v = v0 + g*totalTime;
if(x == 1)
elseif
end

end