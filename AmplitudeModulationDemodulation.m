clear;
clc;

fs = 1000;
t = linspace(0,1,1000);

%message signal
fm = 10;
Am = 1;
message_signal = Am*sin(2*pi*fm.*t);
%carrier signal
fc = 100;
Ac = 2;
carrier_signal = Ac*sin(2*pi*fc.*t);
%modulated signal
modulated_signal = (1+message_signal).* carrier_signal;

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
title('Modulated Signal');

%Demodulated

%rectified Signal

rectified_signal = abs(modulated_signal);

%plotting
figure;
subplot(2,1,1);
plot(t,modulated_signal);
title('Modulated Signal');

subplot(2,1,2);
plot(t,rectified_signal);
title('Rectified Signal');

%lowpass filter parameter
cuttoff_frq = 20;
order = 4;
nyquist_frq = fs/2;
normalized_cuttoff_frq = cuttoff_frq/nyquist_frq;
[b,a]=butter(order,normalized_cuttoff_frq,'low');

filtered_signal = filter(b,a,rectified_signal);

%plotting
figure;
subplot(2,1,1);
plot(t,rectified_signal);
title('Rectified Signal');

subplot(2,1,2);
plot(t,filtered_signal);
title('Filtered Signal');
