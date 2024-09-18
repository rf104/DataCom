clear;
clc;

fs = 1000;
t = linspace(0,1,1000);

fm = 10;
Am = 1;
message_signal = Am*sin(2*pi*fm.*t);

fc = 10*fm;
Ac = 2;
carrier_signal = Ac*sin(2*pi*fc.*t);

kf = 25;
modulated_signal = Ac*sin(2*pi*fc.*t + kf*message_signal);

%plotting
figure;
subplot(3,1,1);
plot(t,message_signal);
title('Message Signal');

subplot(3,1,2);
plot(t,carrier_signal);
title('Carrier Signal');

subplot(3,1,3);
plot(t,modulated_signal);
title('Modualted Signal');

%demodulation

demodulated = [diff(modulated_signal) 0]*fs;
rectification = abs(demodulated);

cuttoff = 20;
order = 4;
nyquist = fs/2;
normalized_freq = cuttoff/nyquist;
[b,a] = butter(order,normalized_freq,'low');
filtered_signal = filter(b,a,rectification);

%plotting
figure;
subplot(2,1,1);
plot(t,rectification);
title('Rectified');

subplot(2,1,2);
plot(t,filtered_signal);
title('Filtered')
