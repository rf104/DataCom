clear;
clc;
%time_parameter
fs = 10;
t = linspace(0,1,100);
%msg_signal
fm = 10;
Am = 1;
msg_signal = Am*sin(2*pi*fm.*t);
%carrier_signal
fc = 100;
Ac = 2;
carrier_signal = Ac*sin(2*pi*fc.*t);
%modulated_signal
modulated_signal = (1+msg_signal).* carrier_signal;

%ploting
figure;
subplot(3,1,1);
plot(t,msg_signal);
title('MessageSignal');
xlabel('Time(s)');
ylabel('Amp');
grid on;

subplot(3,1,2);
plot(t,carrier_signal);
title('Carrier Signal');
xlabel('Time(s)');
ylabel('Amp');
grid on;

subplot(3,1,3);
plot(t,modulated_signal);
title('Modulated Signal');
xlabel('Time');
ylabel('Amp');
grid on;

%demodulation
rectified_signal = abs(modulated_signal);

%ploting
figure;
subplot(2,1,1);
plot(t,modulated_signal);
title('ModulatedSignal');
xlabel('Time(s)');
ylabel('Amp');
grid on;

subplot(2,1,2);
plot(t,rectified_signal);
title('Rectified Signal');
xlabel('Time(s)');
ylabel('Amp');
grid on;

%lowpass filter parameter
cuttoff_freq = 20;
%design lowpassfilter
order = 4;
nyquist_freq = fs/2;
normalized_cuttoff_freq = cuttoff_freq/nyquist_freq;
[b,a] = butter(order,normalized_cuttoff_freq,'low');

%Apply the low pass  filter to rectified signal
filtered_signal = filter(b,a,rectified_signal);

%plotting
figure;
subplot(2,1,1);
plot(t,rectified_signal);
title('Rectified Signal');
xlabel('Time');
ylabel('Amp');
grid on;

subplot(2,1,2);
plot(t,filtered_signal);
title('Filterd Signal');
xlabel('Time(s)');
ylabel('Amp');
grid on;
