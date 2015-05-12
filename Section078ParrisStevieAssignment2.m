%Stevie Parris
%15 October 2013
%Engineering 180 Lab Midweek Assignment 2

Vector1 = 50.*randn(10, 1);
Vector2 = 50.*randn(100, 1);
Vector3 = 50.*randn(1000, 1);
Vector4 = 50.*randn(10000, 1);

hist(Vector1);
B = randi(10,1);
A = Vector1(B);

hist(Vector2);
D = randi(100,1);
C = Vector2(B);

hist(Vector3);
F = randi(1000,1);
E = Vector3(B);

hist(Vector4);
H = randi(10000,1);
G = Vector4(B);

NumberHolder = 0;



%Greater than 50 probability
for i = 1:10
    if Vector1(i) > 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector1Probability = NumberHolder/length(Vector1)

NumberHolder = 0;
for i = 1:100
    if Vector2(i) > 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector2Probability = NumberHolder/length(Vector2)

NumberHolder = 0;
for i = 1:1000
    if Vector3(i) > 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector3Probability = NumberHolder/length(Vector3)

NumberHolder = 0;
for i = 1:10000
    if Vector4(i) > 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector4Probability = NumberHolder/length(Vector4)





%Greater than or equal to 50 probability
NumberHolder = 0;

for i = 1:10
    if Vector1(i) >= 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector1Probability = NumberHolder/length(Vector1)


NumberHolder = 0;
D = randi(100,1);
C = Vector2(B);
for i = 1:100
    if Vector2(i) >= 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector2Probability = NumberHolder/length(Vector2)

NumberHolder = 0;
F = randi(1000,1);
E = Vector3(B);
for i = 1:1000
    if Vector3(i) >= 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector3Probability = NumberHolder/length(Vector3)

NumberHolder = 0;
H = randi(10000,1);
G = Vector4(B);
for i = 1:10000
    if Vector4(i) >= 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector4Probability = NumberHolder/length(Vector4)



%Greater than or equal to 20, greater than 50 probability
NumberHolder = 0;
for i = 1:10
    if Vector1(i) >= 20 && Vector1(i) < 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector1Probability = NumberHolder/length(Vector1)


NumberHolder = 0;
D = randi(100,1);
C = Vector2(B);
for i = 1:100
    if Vector2(i) >= 20 && Vector2(i) < 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector2Probability = NumberHolder/length(Vector2)

NumberHolder = 0;
F = randi(1000,1);
E = Vector3(B);
for i = 1:1000
    if Vector3(i) >= 20 && Vector3(i) < 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector3Probability = NumberHolder/length(Vector3)

NumberHolder = 0;
H = randi(10000,1);
G = Vector4(B);
for i = 1:10000
    if Vector4(i) >= 20 && Vector4(i) < 50
        NumberHolder = NumberHolder + 1;
    end
end
Vector4Probability = NumberHolder/length(Vector4)

%The probabilities are simply the number of times the numbers appear within
%the criteria of the loop. Then we divide this number by the total number
%of values to find the probability. This is how the length effects the
%probability value.

%SECOND HALF

unifDistrVect = 15 + 17*rand(600, 1);
sum=0;
for i=1:length(unifDistrVect)
        sum = sum + unifDistrVect(i);
end
mymean = sum/length(unifDistrVect)
checkmean = mean(unifDistrVect)

stDvSum=0;
N = length(unifDistrVect);
for i = 1:N
    stDvSum = stDvSum + (unifDistrVect(i) - mymean)^2;
end
stdv = sqrt(stDvSum / N)
checkstd = std(unifDistrVect)
hist(unifDistrVect)
% The histogram's data is generated randomly. It lies uniform in the bar
% graph, providing a relatively equal, or uniform distribution.

% The computations seem to be really accurate for the most part. It is
% slightly off from the computation of Matlab's automatic standard
% deviation feature, but it's accurate down to the hundreth's place.
