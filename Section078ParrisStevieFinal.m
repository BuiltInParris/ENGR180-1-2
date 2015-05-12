%% Final Project
fid1 = fopen('finaldata.txt'); %Open file
% initialize variables/line
noTweets = 0; %Number of tweets counter
charCount = 0; %number of characters in entire file counter
iCount = 0; 
theCount = 0; 
hashtagCount = 0;
hashtagSum = 0;
myLine = fgetl(fid1);

%% Obtain necessary information from each line of line
while ischar(myLine)
    noTweets = noTweets + 1; %increase count of lines
    charCount = charCount + length(myLine); %sum characters in line and previous lines
    iCount = iCount + length(regexp(myLine,'I'));  %sum I's
    theCount = theCount + length(regexp(myLine,'the')); %sum the's
    hashtagCount = hashtagCount + length(regexp(myLine,'#')); %sum #'s

    myLine = fgetl(fid1); %get next line
end
averageChars = charCount/noTweets; %calc avg number of chars
%% Read entire file and apply information - Working With Hashtags
wordList = textread('finaldata.txt', '%s'); %read file, separating each string into an array
myCounter = 0; %reset counter

for i = 1:length(wordList)
    keep = regexp(wordList(i), '#'); %find hashtags in array
    if (keep{1} == 1) %if there is a value in the array
        myCounter = myCounter + 1; %increase counter
        hashtagArray(myCounter) = wordList(i); %create array of #'s
    end
end
listofhashtags = hashtagArray

for i = 1:length(hashtagArray)
    hashtagSum = length(hashtagArray{i}) + hashtagSum; %find sum of the length of #'s
end
averageHashtag = hashtagSum/length(hashtagArray); %find average hashtag length


%% Working With Handles
% Repeat process from above to create an array of the @ handles.
myCounter = 0;

for i = 1:length(wordList)
    keep = regexp(wordList(i), '@');
    if (keep{1} == 1)
        myCounter = myCounter + 1;
        handlerArray(myCounter) = wordList(i);
    end
end

listofhandles = handlerArray
noHandlers = length(handlerArray); %Number of handles used

%The following information is based on the Twitter account of Justin
%Timberlake. He is the tenth most popular twitter user according to twitter
%tracking site. He recently performed at the VMAs which have effected his
%twitter posts, and about his tour in general. His posts may not have the
%most substance, but they market to his music audience, so it is composed
%of mostly quotes, random references, and the things going on surrounding
%his music.
fprintf('The number of lines: %d\nThe average number of characters per post: %d\nNumber of times "I" is used: %d\nNumber of times "the" is used: %d\nNumber of times "#" is used: %d\nAverage length of hashtags: %d\nNumber of handlers used: %d\n', noTweets, averageChars, iCount, theCount, hashtagCount, averageHashtag, noHandlers)
