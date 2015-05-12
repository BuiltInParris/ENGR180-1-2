currentPrice = 325;
stockPrice = 325;
for i = 1:30
    if abs(randn(1)) < .34
        currentPrice = currentPrice - 15;
    elseif abs(randn(1)) > .34
        currentPrice = currentPrice * 1.03;
    end
end
if stockPrice > currentPrice
fprintf('You should sell (%f)\n', currentPrice)
end
if stockPrice < currentPrice
fprintf('You should keep it (%f)\n', currentPrice)
end



%Problem 2
fid = fopen('review1.txt');
myLine = fgetl(fid);
myVector(1) = str2num(myLine);
vectorlength = length(myVector)
threshold = 0:.1:2;
counter = 0;
for f=1:length(threshold)
    for i=1:vectorlength
        if myVector(i) < threshold(f)
            counter = counter + 1;
        end
    end
probabilities(f) = counter/vectorlength
counter = 0;
end
plot(threshold, probabilities, 'b-')
