% ***********************************************************
% Laboratory Assignment #1b
% 
% ***********************************************************
clear;

% ***** Define signal parameters
Fs = 100;						% Sampling Frequency
t = 0:1/Fs:1-1/Fs;				% time sequence

% ***** Create a sinusoidal signal **************************
F=1;
x1 = sin(2*pi*t*F);

% ***** Create a pulse **************************
x2 = [ones(1, 100)];  % a square pulse
%x2 = [ones(1, 20) zeros(1, 80)]; % a pulse of 1/5 sec width

% ***** Convolution *****************************************
y = conv(x1, x2);

% ***** Plot Signal *****************************************
subplot(2,1,1), plot(t, x1,'r', t, x2, 'g');
title('Convolution of two waveforms');
subplot(2,1,2), plot(y);

% ***** Create a low-pass filter ****************************
Fc=40; % cutoff freq.
B = firpm(21,[0 0.9*Fc/Fs 1.1*Fc/Fs 1], [1 1 0 0]);

% ***** Filter a pulse **************************************
y = conv(B,x2);