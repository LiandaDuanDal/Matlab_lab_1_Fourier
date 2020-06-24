% **********************************************************
% Laboratory Assignment #1a
% 
% **********************************************************
clear;

% ***** Define signal parameters ***************************
Fs = 1000;						% Sampling Frequency
t = 0:1/Fs:1-1/Fs;				% time sequence
P = 1024;						% FFT points

% ***** Create first sinusoidal ****************************
A1 = 3;							% Signal Amplitude (Volt)
F1 = 10;						% Signal Frequency (Hz)

x1 = A1*sin(2*pi*F1*t);

% ***** Create first sinusoidal ****************************
A2 = 5;							% Signal Amplitude (Volt) 
F2 = 20;						% Signal Frequency (Hz)

x2 = A2*sin(2*pi*F2*t);

% ***** Combine both signals ********************************
y = x1 + x2;

% ***** Plot Combined Signal ********************************
figure(3);
plot(t, y);
title('Sinusoidal signal');
xlabel('time (seconds)');
ylabel('Amplitude');
axis([0 1 -max(A1, A2) max(A1, A2)]);

% ***** Fourier Transform ***********************************
fx = fft(y, P);
fx= fftshift(abs(fx));

% ***** Plot Spectrum ***************************************
f = -Fs/2:Fs/P:Fs/2-Fs/P;		% Frequency scale in Hz
figure(4);
plot(f, fx);    % use also stem(f, fx);
title('Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
axis([-50 50 0 max(fx)]);
