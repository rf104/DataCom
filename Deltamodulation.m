clear;
clc;

fs = 10000;
t = 0 : 1/fs : 1000/fs;

fm = 100;
Am = 5;
x = Am*sin(2*pi*fm*t);

y=[0];
xr = 0;
level = 0.4;

for i = 1 : length(x)-1
    if xr(i) <= x(i)
        d = 1;
        xr(i+1) =  xr(i) + level;
    else
        d = 0;
        xr(i+1) = xr(i) - level;
    end
    y = [y d];
end

stairs(t,xr);
title('Staircase Approximation');

figure;
subplot(3,1,1);
plot(t,y);
title('Demodulated Signal');

%delta
y_demod = 0;
xr_demod = 0;

for i = 2: length(y)
    if y(i) == 1
        xr_demod = xr_demod + level;
    else
        xr_demod = xr_demod - level;
    end
    y_demod = [y_demod xr_demod];
end

subplot(3,1,2);
plot(t,y_demod);
title('Deltamode Before Filtering');

%filtering
filter_order = 20;
lowpass_filter = fir1(filter_order,fm/(fs/2),'low');
filtered_signal = filter(lowpass_filter,1,y_demod);

subplot(3,1,3);
plot(t,filtered_signal);
title('Filtered Signal');
