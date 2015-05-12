%% Part 1 of Biweekly Assignment
fid1 = fopen('dataFile.txt'); %Open file
myLength = 0; % initialize variables/line
myLine = fgetl(fid1);
sumString = '';
threshhold = 30.7;
threshholdCount = 0;
sumarray = 0;
valueVector = [];
aCounter = 0;
while ischar(myLine)
    myLength = myLength + 1; %increase length of line
    aCellArray = char(regexp(myLine, '\d+\.\d+', 'match')); %return a cell array of numbers in line
    valueVector = str2num(aCellArray); %return the cell array in the form of a vector
    if (~isempty(regexp(myLine, 'valid'))) %test emptiness
        plot(valueVector)
        hold on
    end
    sumString = strcat(sumString, ' ', myLine, ' '); %put all strings in one
    myLine = fgetl(fid1); %get next line
end
fclose(fid1); %close file


myarray = regexp(sumString, '\d+\.\d+', 'match'); %find points in the string that are numbers
for i = 1:length(myarray) %for the length of the array
    if (str2num(myarray{i}) > threshhold) % if the value at the increment is greater than the threshhold's value
        threshholdCount = threshholdCount + 1; %increase the count of the the numbers greater than the threshhold
    end
    sumvector(i) = str2num(myarray{i}); %Put values in the cell array into a vector as numbers instead of strings.
end
validCount = length(regexp(sumString, 'valid')); % find number of valid's in the file
corruptedCount = length(regexp(sumString, 'corrupted')); % find number of corrupted's in the file
meanmyarray = sum(sumvector)/length(sumvector); %Divide the sum of the number vector by the length of the vector, or number of numbers
deviatemystandard = std(sumvector); %calculate standard deviation of the number vector
fprintf('Total number of lines: %d \nValid data points: %d \nCorrupted data points: %d\nAmount of numbers greater than threshhold: %d \nThe mean of the numbers is equal to: %f \nStandard Deviation is equal to: %f\n', myLength, validCount, corruptedCount, threshholdCount, meanmyarray, deviatemystandard)
%% Part 2 of Biweekly Assignment
fid2 = fopen('keyData.txt'); %open file
myLine = fgetl(fid2); %get first line
i = 1; %set increment

while(ischar(myLine))
    pArray = regexp(myLine, ' '); %create an array of the words starting positions (whitespace position)
    wordSpace = pArray(end); %Find the last whitespace before the last word
    wordSpace = wordSpace + 1; %move 1 character forward to the actual word
    if ~isempty(regexp(myLine, 'midi'))
        miditimestamp = myLine(wordSpace:end); %return midi timestamp by returning the characters of the last word
    elseif (~isempty(regexp(myLine, 'oscp')))
        wordSpace2 = pArray(end - 1); % find the second to last whitespace
        wordSpace2 = wordSpace2 + 1; %move 1 character forward to the second to last word
        position = myLine(wordSpace2:end-9); %return oscp position by returning the characters of the second to last word
        positionarray(i) = str2num(position); %create array of oscp positions
        
        oscptimestamp = myLine(wordSpace:end); %return oscp timestamp
        oscptimestamparray(i) = str2num(oscptimestamp); %create array of oscp timestamps
        
        if (str2num(position) == 0.750000) % if positon equals 0.75
            specialtime = str2num(oscptimestamp); % store the time for graph
            velocity = str2num(position)/str2num(oscptimestamp); %determine velocity
        end
        i = i + 1; %increment storage arrays
    else
        pathSpace = pArray(1); %find the first whitespace
        pathSpace = pathSpace - 1; %move back to end of word
        path = myLine(1:pathSpace); %find the path from first character to last
        fprintf('WARNING (line #%d): unhandled OSC path %s\n', i, path) %print information
    end
    myLine = fgetl(fid2); %get next line
end

%plotting
figure
plot(oscptimestamparray, positionarray) %plot position vs. time
hold on %next
plot([1,1],[0,1], '-g') %plot line at x = 1, beginning of line
plot([specialtime, specialtime],[0,1], '--r') % plot line at 0.75
lastTime = oscptimestamparray(end);  %find the last time in the time array
plot([lastTime, lastTime], [0, 1], '-black') %plot y= lastTime at end of the line 
axis([0 3 0 1]) %reset axis to nicer grid
title('Key Position vs. Time')
xlabel('Time (seconds)')
ylabel('Position')
legend('Position','Start Time', 'Position == 0.75', 'End Time')

fclose(fid2);