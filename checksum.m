clear;
clc;

data = [1 2 3 4 5 6 7 8 9 10];

datasum = sum(data);
sumbin = dec2bin(datasum);

mainbin = sumbin(length(sumbin)-4+1:length(sumbin));
wrapbin = sumbin(1:length(sumbin)-4);

mainbin = bin2dec(mainbin);
wrapbin = bin2dec(wrapbin);

wrapbin = mainbin + wrapbin;
wrapbin = dec2bin(wrapbin);

for i=1:1:length(wrapbin)
    if wrapbin(i)=='0'
        wrapbin(i)='1';
    else
        wrapbin(i)='0';
    end
end

wrapbin = bin2dec(wrapbin);
disp(wrapbin);
