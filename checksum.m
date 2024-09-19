clear;
clc;

data = [1 2 3 4 5 6 7 8 9 10];

datasum = sum(data);
sumbin = dec2bin(datasum);

mainbin = sumbin(max(length(sumbin)-3,1) :length(sumbin));
wrapbin = sumbin(1:max(length(sumbin)-4,0));

mainbin = bin2dec(mainbin);
wrapbin = bin2dec(['0', wrapbin]);

wrapbin = mainbin + wrapbin;
wrapbin = dec2bin(wrapbin,4);
disp(wrapbin);

checksum='';
for i=1:4
    if wrapbin(i)=='0'
        checksum=[checksum '1'];
    else
        checksum = [checksum '0'];
    end
end

disp(checksum);
wrapbin = bin2dec(checksum);
disp(wrapbin);
