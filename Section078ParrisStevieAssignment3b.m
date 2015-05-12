%Code for case sensitive word search. The only real difference is this one
%uses regexp and the other uses regexpi.

fileID = fopen('suspiciousFile.txt'); %open file
sum = 0; %set sum to 0
i = 1; %set index to 0
myLine = fgetl(fileID); %get the first line of doc
while ischar(myLine) %while there are characters in the line, repeat to end
    k = regexp(myLine,'Drexel'); %create an array of the starting locations of 'Drexel'
    sum = sum + length(k); %Calculate number of instances of 'Drexel' by counting number of cells.
    if regexp(myLine,'Drexel', 'once') ~= '' %if the cell array isn't empty
    fprintf('Line #%d (starting at column %d): %s\n', i, k, myLine) %print the line number, column number, and the line
    end
    myLine = fgetl(fileID); %get next line of doc
    i = i + 1; %increase iteration
end
fprintf('Suspicious word: %s (%d instances found)\n\n', 'Drexel', sum) %print number of instances.
fclose(fileID); %close document

%Code for case insensitive search. Uses regexpi. Essentially runs the same
%as previous code, but substituting a word with each iteration in place of
%the original 'Drexel'
for word = {'Public Safety' 'hazing'}
    fileID = fopen('suspiciousFile.txt');
sum = 0;
i = 1;
myLine = fgetl(fileID);
while ischar(myLine)
    k = regexpi(myLine,word{1});
    sum = sum + length(k);
    if ~isempty(regexpi(myLine,word{1}))
    fprintf('Line #%d (starting at column %d): %s\n', i, k, myLine)
    end
    myLine = fgetl(fileID);
    i = i + 1;
end
fprintf('Suspicious word: %s (%d instances found)\n\n', word{1}, sum)
fclose(fileID);
end