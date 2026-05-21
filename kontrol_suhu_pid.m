% PID Controller Sistem Suhu Kabin Mobil
% TA Praktikum Teknik Kendali dan Otomasi

clc;
clear;
close all;

% Plant orde pertama
s = tf('s');
G = 1 / (100*s + 1);

% Parameter PID hasil tuning
Kp = 4;
Ki = 0.2;
Kd = 4;

% PID Controller
C = pid(Kp, Ki, Kd);

% Sistem Closed-Loop
T = feedback(C*G, 1);

% Tampilkan informasi sistem
disp('Transfer Function Closed Loop:');
T

% Simulasi step response
figure;
step(24*T);
title('Respons Sistem Kontrol Suhu Kabin Mobil');
xlabel('Waktu (detik)');
ylabel('Suhu');
grid on;