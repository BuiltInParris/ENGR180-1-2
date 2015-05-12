function [c, perimeter, area, isosceles] = triangleSolver(a, b)
c = sqrt(a^2+b^2);
perimeter = c + a + b;
area = a*b/2;
isosceles = 0;
if (a == b || b == c || c == a)
    isosceles = 1;
end
end

