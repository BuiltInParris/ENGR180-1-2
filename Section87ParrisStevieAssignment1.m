%% Biweekly	Assignment	1
% Stevie Parris - April 2, 2014 - Engineering 180 Section 87


%% Problem 1
% Find the circumference and the area of a swimming pool with radius 
% 12 ft. Use the variable ‘r’ to represent the radius. Save your ?nals results 
% into variables called ‘A’ for the area and ‘C’ for the circumference. Feel 
% free to define additonal variables.
r = 12;
C = 2*pi*r;
A = pi*r^2;
fprintf('Problem 1: \nArea is: %f \nCircumference is: %f \n\n', A, C);

%% Problem 2
% Create a row vector that stores the positive	odd	numbers	less 
% than 20. In addition, create a column vector that stores the even numbers 
% greater than 0 up to 20.		
% a. Determine the size of the two vectors (# of rows, # of columns). 
% b. Transpose the column vector to be a row vector. 
% c. Use Matlab functions to find the size of these vectors. 
% d. Add the two vectors and save the result in ‘result1’. 
% e. Find the product of these two vectors. Was this result expected? Give all 3 possible answers.

myRowVector = [1:2:19];
myColumnVector = [2; 4; 6; 8; 10; 12; 14; 16; 18; 20];

% a.
[heightRow, lengthRow] = size(myRowVector);

[heightColumn, lengthColumn] = size(myColumnVector);

fprintf('a.\nNumber of columns: %d\nNumber of rows: %d \nNumber of columns: %d \nNumber of rows: %d\n\n', lengthRow, heightRow, lengthColumn, heightColumn);

% b.
switchVector = myColumnVector';
fprintf('b.\nThe transposed vector');
disp(switchVector)

% c.

[heightColumn, lengthColumn] = size(switchVector);

fprintf('c.\nTransposed vector\nNumber of columns: %d \nNumber of rows: %d\n', lengthRow, heightRow, lengthColumn, heightColumn);

%d
fprintf('d. \nThe added vectors: \n');
result1 = myRowVector + switchVector;
disp(result1)
fprintf('\n\n');

%e
result_1 = myColumnVector*myRowVector;
result_2 = myRowVector*myColumnVector;
result_3 = switchVector*myColumnVector;
fprintf('e. \nThe various combinations by vector multiplication.\n');
disp(result_1);
disp(result_2);
disp(result_3);
fprintf('\n\n');


%% Problem 3
% Plot 100 random numbers that are uniformly distributed between 0 
% and 20. Make sure the plot includes a title, and proper labels. Re-plot 
% (on the same figure) the random numbers using a different color and insert 
% markers in the shape of ‘x’.
fprintf('\nProblem 3: (graph)\n');
random = 20*rand(100, 1);
figure;
grid on;

plot(random, 'r');
title('Random Number Graph');
xlabel('location in vector');
legend('Randomly Generated Data');
ylabel('Value of location in vector');
hold on;
plot(random, 'gx');







%% Problem 4 
% Generate 1000 random numbers that are normally distributed with mean 0 and 
% standard deviation 50. If we were to pick one of these numbers at random…
% a. Determine the probability the chosen number being greater than 50. This may 
% be achieved by counting the numbers that are greater than 50 and dividing 
% it by 1000. Hint: Formulate the appropriate if-conditions to check for a 
% number being greater than 50, and use a for-loop to apply the if-condition 
% for all 1000 numbers
% b. Determine the probability of the chosen number being greater than or equal to 50? 
% c. Determine the probability of the chosen number being greater than or equal to 20 and less than 50?
fprintf('Problem 4:\n');
random = 50*randn(1000, 1);

% a.
counter = 0;

for i = 1:length(random)
    if random(i) > 50       % Check the ith element of i for our condition
        counter = counter + 1;
    end
end

probability = counter/length(random);

fprintf('a. Probability of a number being greater than 50: %f\n', probability);

% b. 
counter1 = 0;

for i = 1:length(random)
    if random(i) >= 50       % Check the ith element of i for our condition
        counter1 = counter1 + 1;
    end
end

probability1 = counter1/length(random);

fprintf('b. Probability of a number being greater than or equal to 50: %f\n', probability1);

% c. 
counter2 = 0;

for i = 1:length(random)
    if (20 <= random(i) && random(i) < 50)       % Check the ith element of i for our condition
        counter2 = counter2 + 1;
    end
end

probability2 = counter2/length(random);

fprintf('c. Probability of a number being greater than or equal to 20 and less than 50: %f\n', probability2);


%% Problem 5
%Generate 1000 random numbers that are uniformly distributed between 0 and 
% 500. Again, if we were to pick one of these numbers at random…
% a. Determine the probability of the chosen number being greater than 150? 
% b. Determine the probability of the chosen number being greater than or equal to 150? 
% c. Determine the probability of the chosen number being greater than or equal to 120 and less than 150?

fprintf('Problem 4:\n');
random2 = 500*rand(1000,1);

% a.
counter_1 = 0;

for i = 1:length(random2)
    if random2(i) > 150       % Check the ith element of i for our condition
        counter_1 = counter_1 + 1;
    end
end

probability_1 = counter_1/length(random2);

fprintf('a. Probability of a number being greater than 150: %f\n', probability_1);

% b. 
counter_2 = 0;

for i = 1:length(random2)
    if random2(i) >= 150       % Check the ith element of i for our condition
        counter_2 = counter_2 + 1;
    end
end

probability_2 = counter_2/length(random2);

fprintf('b. Probability of a number being greater than or equal to 150: %f\n', probability_2);

% c. 
counter_3 = 0;

for i = 1:length(random2)
    if (120 <= random2(i) && random2(i) < 150)       % Check the ith element of i for our condition
        counter_3 = counter_3 + 1;
    end
end

probability_3= counter_3/length(random2);

fprintf('c. Probability of a number being greater than or equal to 120 and less than 150: %f\n\n', probability_3);


%% Problem 6
% Refer to the figure below for the equation to use and create a MATLAB function 
% named “findHypotenuse” that takes in two input numbers a and b and returns 
% the value of c. Once you have your function saved. Use it to answer the following:
% a. Find c when a = 6, b = 8. 
% b. Find c when a = 5, b = 12. 
% c. Find c when a = 7, b = 24. 
% d. Find c when a = 10, b = 10.
% Your function should be tested from a different script with the inputs 
% above. Note: the function should return the answer and the main script 
% should print it, not the function.
% c = sqrt(a^2+b^2)
fprintf('Problem 6:\n');

c1 = findHypotenuse(6,8);
fprintf('a.\nc = %d when a = 5, b = 12\n', c1);

c2 = findHypotenuse(5,12);
fprintf('b.\nc = %d when a = 5, b = 12\n', c2);

c3 = findHypotenuse(7,24);
fprintf('c.\nc = %d when a = 5, b = 12\n', c3);

c4 = findHypotenuse(10,10);
fprintf('d.\nc = %d when a = 5, b = 12\n\n', c4);


%% Problem 7
% Create a function called “matrixAdder” that generates a random matrix that 
% consists of “X” rows and “Y” columns that are normally distributed with mean 
% “M” and standard deviation “D”, where X, Y, M, and D are inputs to your function. 
% After generating the matrix defined above with the specific inputs, your function 
% should calculate the sum of all numbers in the matrix and return this result 
% back to the user. Test your function from a different script using the following 
% set of input values and provide a formatted printout of the results.
% X	    Y	  M	   D	
% 10    10	  0	   100	
% 100   1	  10   10	
% 1000  760	 -25   50	
fprintf('Problem 7:\n');

m_ans1 = matrixAdder(10,10,0,100);
fprintf('The summation of a random 10 by 10 matrix with a mean of 0 and standard deviation of 100 is %d.\n', m_ans1);

m_ans2 = matrixAdder(100,1,10,10);
fprintf('The summation of a random 100 by 1 matrix with a mean of 10 and standard deviation of 10 is %d.\n', m_ans2);

m_ans3 = matrixAdder(100,760,-25,50);
fprintf('The summation of a random 1000 by 760 matrix with a mean of -25 and standard deviation of 50 is %d.\n\n', m_ans3);


%% Problem 8
%Modify your function from the previous question or write a new one to expand 
%its functionality to also calculate the triangle’s perimeter, and its area. 
%Also, check if your triangle is an isosceles right triangle (check if two of 
%the sides are the same length). Note that your function must return 4 things 
%for this question: The value of c, the perimeter, the area, and 1 or 0 to 
%indicate isosceles triangle. 
%Hint: Just as we can return multiple outputs from certain functions (e.g.
%[nRows, nCols] = size(Matrix)), we can define and call our custom functions 
%to return multiple variables using the same syntax.

fprintf('Problem 8:\n')

[c1, area1, perimeter1, isosceles1] = triangleSolver(6,8);
fprintf('a.\nc = %d, area = %d, perimeter = %d ', c1, area1, perimeter1);
if(isosceles1 == 1)
   fprintf('and the triangle is isosceles when a = 6, b = 8.\n')
else
    fprintf('and the triangle is not isosceles when a = 6, b = 8.\n')
end

[c2, area2, perimeter2, isosceles2] = triangleSolver(5,12);
fprintf('b.\nc = %d, area = %d, perimeter = %d ', c2, area2, perimeter2);
if(isosceles2 == 1)
   fprintf('and the triangle is isosceles when a = 5, b = 12.\n')
else
    fprintf('and the triangle is not isosceles when a = 5, b = 12.\n')
end

[c3, area3, perimeter3, isosceles3] = triangleSolver(7,24);
fprintf('c.\nc = %d, area = %d, perimeter = %d ', c3, area3, perimeter3);
if(isosceles3 == 1)
   fprintf('and the triangle is isosceles when a = 7, b = 24.\n')
else
    fprintf('and the triangle is not isosceles when a = 7, b = 24.\n')
end

[c4, area4, perimeter4, isosceles4] = triangleSolver(10,10);
fprintf('d.\nc = %d, area = %d, perimeter = %d ', c4, area4, perimeter4);
if(isosceles4 == 1)
   fprintf('and the triangle is isosceles when a = 10, b = 10.\n\n')
else
    fprintf('and the triangle is not isosceles when a = 10, b = 10.\n\n')
end
