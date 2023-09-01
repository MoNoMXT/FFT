close all
clear all

% Señal de entrada
x = [0, 1, 2, 1];
N = length(x);

% Cálculo de la FFT
X_fft = fft(x);

% Frecuencias correspondientes
frequencias = linspace(0, 1, N);
% Fracciones del 1 al 10 para el eje x
fraction_ticks = 1:10;
fraction_labels = arrayfun(@(x) sprintf('%d/10', x), fraction_ticks, 'UniformOutput', false);

% Gráfico de la señal original
subplot(3,1,1);
stem(0:N-1, x, 'r', 'LineWidth', 2);
title('Señal Original');
xlabel('n');
ylabel('x[n]');
grid on;

% Gráfico del espectro de amplitud
subplot(3,1,2);
stem(frequencias, abs(X_fft), 'r', 'LineWidth', 2);
title('Espectro de Amplitud (FFT)');
xlabel('Frecuencia');
ylabel('|X(f)|');
set(gca, 'XTick', fraction_ticks / 10);
set(gca, 'XTickLabel', fraction_labels);
grid on;

% Gráfico del espectro de fase
subplot(3,1,3);
stem(frequencias, angle(X_fft), 'r', 'LineWidth', 2);
title('Espectro de Fase (FFT)');
xlabel('Frecuencia');
ylabel('Ángulo (radianes)');
set(gca, 'XTick', fraction_ticks / 10);
set(gca, 'XTickLabel', fraction_labels);
set(gca, 'YTick', [-pi, -pi/2, 0, pi/2, pi]);
set(gca, 'YTickLabel', {'-π', '-π/2', '0', 'π/2', 'π'});
grid on;
