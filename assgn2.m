% **********************************************************
% Laboratory Assignment #2
% 
% **********************************************************
clear;

% ***** Define signal parameters ***************************
Fs = 1000;						% Sampling Frequency
t = 0:1/Fs:1-1/Fs;				% time sequence
P = 1024;						% FFT points

%***** carrier Signal **************************************
Fc = 100;
x = sin(2*pi*Fc*t);

%***** Message Signal **************************************
Fm = 5;
%m = square(2*pi*Fm*t);
m = [-ones(1, 100) ones(1, 100) -ones(1, 100) ones(1, 300) -ones(1, 200) ones(1, 200)];

%***** Modulated Signal ************************************
y= x.*m;

%***** Demodulation ****************************************
z = y .* 2 .* x;

% ***** Create a low-pass filter ***************************
%B = remez(12,[0 0.1 0.25 1], [1 1 0 0]);
B = firpm(12,[0 0.1 0.25 1], [1 1 0 0]);

w = filter(B, 1, z);

%***** Plot Signal *****************************************
figure(1);
subplot(3,1,1), plot(t, m, t, y);
title('Modulated Signal');
axis([0 1 -1.2 1.2]);
subplot(3,1,2), plot(t, z);
title('Signal at the receiver');
subplot(3,1,3), plot(t, w);
title('Signal after Low-Pass Filter');

figure(2)
subplot(2,1,1), plot(fftshift(abs(fft(m,P))));
title('spectrum of input signal');
subplot(2,1,2), plot(fftshift(abs(fft(w,P))));
title('spectrum of output signal');
