%Stevie Parris - Written Assignment Lab 6/7
%Creating the 5 sentences
text1 = 'Trick and/or treat.';
text2 = '75 is only three quarters.';
text3 = '@nim@l, say goodbye to my heart tonight.';
text4 = 'Forgive, sounds good, forget, I dont think I could.';
text5 = 'Example of the l33t: r@nd0m.';
%Storing the sentences in a single cell array
sentar = {text1; text2; text3; text4; text5};

%Finding the length of each sentence
length1 = length(sentar{1});
length2 = length(sentar{2});
length3 = length(sentar{3});
length4 = length(sentar{4});
length5 = length(sentar{5});

%Printing the length of each sentence
fprintf('length of sentence 1: %d \n', length1)
fprintf('length of sentence 2: %d \n', length2)
fprintf('length of sentence 3: %d \n', length3)
fprintf('length of sentence 4: %d \n', length4)
fprintf('length of sentence 5: %d \n', length5)


%Finding special characters, in this case special is any non-alphanumerical
%characters, aka. not A-Z or 0-9.
holdlengths = [length1 length2 length3 length4 length5];
holdsent = {sentar{1} sentar{2} sentar{3} sentar{4} sentar{5}};

for x = 1:5 %from sentence 1 to 5
    counter = 0; %reset/set counter
    temp = holdsent{x}; % extract sentence from cell
    for i=1:holdlengths(x) % from first char to the length of sentence
        if isstrprop(temp(i), 'alphanum') == 0
            counter = counter + 1; %add one to the letter count
        end
    end
    fprintf('Number of special characters in sentence %d: %d \n', x, counter) %print number of special characters
end
%The code is designed to be extremely shortened. Rather than repeat each
%one with individual lengths and sentence numbers, and sentences, I just
%automated it into a nested for loop with an if statement.


%Finding number of vowels
for x = 1:5 %from sentence 1 to 5
    counter = 0; %reset/set counter
    temp = holdsent{x}; % extract sentence from cell
    for i=1:holdlengths(x) % from first char to the length of sentence
        if temp(i) == 'a' || temp(i) == 'e' || temp(i) == 'i' ||  temp(i) == 'o' ||  temp(i) == 'u' %if char is vowel
            counter = counter + 1; %add one to the letter count
        end
    end
    fprintf('Number of vowels in sentence %d: %d \n', x, counter) %print number of special characters
end


%Finding number of spaces
for x = 1:5 %from sentence 1 to 5
    counter = 0; %reset/set counter
    temp = holdsent{x}; % extract sentence from cell
    for i=1:holdlengths(x) % from first char to the length of sentence
        if temp(i) == ' ' %if char is a space
            counter = counter + 1; %add one to the letter count
        end
    end
    fprintf('Number of spaces in sentence %d: %d \n', x, counter) %print number of special characters
end


%Finding number of "the"s
for x = 1:5 %from sentence 1 to 5
    counter = 0; %reset/set counter
    temp = holdsent{x}; % extract sentence from cell
    counter = seqwordcount(temp, 'the');
    fprintf('Number of "the"s in sentence %d: %d \n', x, counter) %print number of special characters
end

%Finding number of "and"s
for x = 1:5 %from sentence 1 to 5
    counter = 0; %reset/set counter
    temp = holdsent{x}; % extract sentence from cell
    counter = seqwordcount(temp, 'and');
    fprintf('Number of "and"s in sentence %d: %d \n', x, counter) %print number of special characters
end

%Finding the most frquent word in an array

%Combine all strings in the array
str1 = ''; %Setting variable value
for x = 1:5 %travel through number of strings
    str1 = [str1, ' ', holdsent{x}]; %add each sentence together with a space in between
end
newlength = length(str1); %establish length of new string

y = ' '; %Creating initial variable
storagematrix = cell(20,1); %create a matrix to store words
storageindex = 1; %the index for the storage
    for i=1:newlength %travel from 1st cell to last of string
        if strcmp(str1(i), ' ') == 0 && isstrprop(str1(i), 'punct') == 0 % if the character is not a space or punctation.
            y = [y, str1(i)]; %add that character to the string
        elseif isstrprop(str1(i), 'wspace') == 1
            storagematrix{storageindex} = y; %if it is a space, store the word in the matrix
            y = ''; %reset the y variable
            storageindex= storageindex + 1; %increment index
        end
    end
    
%storagematrix %reveal matrix for testing
uniquemtrx = unique(storagematrix); %Create a unique version of the matrix
storeme = zeros(length(uniquemtrx), 1); %Create a matrix of zeros for storage
for i = 1:length(uniquemtrx) %iterate through the unique matrix
    storeme(i) = length(find(strcmp(uniquemtrx{i}, storagematrix)));
    %compare the matrices and find the number of times it appears, store each 
    %then find the length of the vector, or the number of times it appears
    %and store that value, in logical order by first occurence.
end
[~, atemp] = max(storeme); %find the entry with the most occurences
uniquemtrx(atemp) %value at this the first occurence.

%Source drawn on for help with the last section of the code: http://www.mathworks.com/matlabcentral/answers/7973




%Second problem

%Code for case sensitive word search. The only real difference is this one
%uses regexp and the other uses regexpi.

fileID = fopen('suspiciousFile.txt'); %open file
sum = 0; %set sum to 0
i = 1; %set index to 0
myLine = fgetl(fileID); %get the first line of doc
while ischar(myLine) %while there are characters in the line, repeat to end
    k = regexp(myLine,'Drexel'); %create an array of the starting locations of 'Drexel'
    sum = sum + length(k); %Calculate number of instances of 'Drexel' by counting number of cells.
    if ~isempty(regexp(myLine,'Drexel', 'once')) %if the cell array isn't empty
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