fid = fopen('keyData.txt'); %open file
myLine = fgetl(fid); %get first line
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
        position = myLine(wordSpace2:end-9); %return oscp position by returning the characters of the last word
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
    myLine = fgetl(fid); %get next line
end

%plotting
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

fclose(fid);