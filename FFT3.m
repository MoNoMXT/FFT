% clear all
% close all

% Parámetros de la señal
frecuencia_muestreo = 1024; % Hz (1024 muestras por segundo)
tiempo_final = 1; % segundos
cantidad_muestras = tiempo_final * frecuencia_muestreo;

% Crear la señal con múltiples armónicos y una componente exponencial
t = linspace(0, tiempo_final, cantidad_muestras);
senal = 2*sin(2*pi*5*t) + 1.5*sin(2*pi*20*t) + 0.5*sin(2*pi*50*t) + 0.8*exp(-t*10);

% Calcular la DFT de la señal por definición
DFT_definicion = zeros(1, cantidad_muestras);
contador_calculos = 0; % Inicializar contador de cálculos
for k = 1:cantidad_muestras
    for n = 1:cantidad_muestras
        DFT_definicion(k) = DFT_definicion(k) + senal(n) * exp(-1i*2*pi*(k-1)*(n-1)/cantidad_muestras);
        contador_calculos = contador_calculos + 1; % Incrementar contador de cálculos
    end
end

% Calcular la DFT de la señal mediante el algoritmo FFT
DFT_FFT = fft(senal, cantidad_muestras);

% Graficar la señal original y la señal muestreada
subplot(2,2,1);
plot(t, senal);
title('Señal Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2,2,2);
stem(t, senal);
title('Señal Muestreada');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Graficar el módulo de la DFT por definición
frequencies = linspace(0, frecuencia_muestreo, cantidad_muestras);
subplot(2,2,3);
stem(frequencies, abs(DFT_definicion));
title('DFT por Definición - Módulo');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');

% Graficar el módulo de la FFT
subplot(2,2,4);
stem(frequencies, abs(DFT_FFT));
title('FFT - Módulo');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');

% Mostrar resultados
disp(['Operaciones FFT: ' num2str(cantidad_muestras * log2(cantidad_muestras))]);
disp(['Cálculos DFT por Definición: ' num2str(contador_calculos)]);
