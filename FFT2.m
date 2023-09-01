close all
clear all

% Señal de entrada
x = [0, 1, 2, 1]
N = length(x);

% Cálculo de la FFT
X_fft = fft(x)

% Frecuencias correspondientes
frequencies = linspace(0, 1, N);

% Gráfico de la señal original
subplot(3,1,1);
stem(0:N-1, x, 'r', 'LineWidth', 2);
title('Señal Original');
xlabel('n');
ylabel('x[n]');
grid on;

% Gráfico del espectro de amplitud
subplot(3,1,2);
stem(frequencies, abs(X_fft), 'r', 'LineWidth', 2);
title('Espectro de Amplitud (FFT)');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

% Gráfico del espectro de fase
subplot(3,1,3);
stem(frequencies, angle(X_fft), 'r', 'LineWidth', 2);
title('Espectro de Fase (FFT)');
xlabel('Frecuencia (Hz)');
ylabel('Ángulo (radianes)');
set(gca, 'YTick', [-pi, -pi/2, 0, pi/2, pi]);
set(gca, 'YTickLabel', {'-π', '-π/2', '0', 'π/2', 'π'});
grid on;

% Ajustar espacio entre subplots
subplot_adjust = get(gcf, 'Position');
subplot_adjust(4) = subplot_adjust(4) - 0.05;
set(gcf, 'Position', subplot_adjust);
