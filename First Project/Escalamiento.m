clc; % Limpia la ventana de comandos.

% Se lee un archivo de audio y se almacenan las muestras de audio y la frecuencia de muestreo.
[x1, fs1] = audioread('SYSPPM1.wav'); % Se carga "Señales y sistemas. Primer proyecto de MATLAB".

% Se inicia un bucle para permitir múltiples cambios en la velocidad de reproducción.
continuar = true;
while continuar
    % Muestra el encabezado del proceso en la ventana de comandos.
    disp('=====================================================');
    disp('          Selección: Escalador de Audio');
    disp('=====================================================');
    % Se presentan al usuario las opciones para cambiar la velocidad de reproducción del audio.
    disp(' ');
    disp(' Seleccione la velocidad de reproducción:');
    disp('  1. 0.5 veces la velocidad normal');
    disp('  2. 0.8 veces la velocidad normal');
    disp('  3. Velocidad normal');
    disp('  4. 1.2 veces la velocidad normal');
    disp('  5. 1.5 veces la velocidad normal');
    disp('  6. 2 veces la velocidad normal');
    disp('  7. Salir');
    disp('-----------------------------------------------------');
    disp(' ');
    % El usuario introduce la opción deseada.
    opcion = input('Introduzca el número de su opción: ');
    disp(' ');
    
    % Se maneja la opción de salir del bucle.
    if opcion == 7
        disp('Volviendo al menú principal...');
        clc;
        break; % Termina el bucle
    elseif opcion >= 1 && opcion <= 6 % Asegura que la opción sea válida

        % Se define el array de factores de velocidad según la opción elegida.
        factores = [0.5, 0.8, 1, 1.2, 1.5, 2];
        factor = factores(opcion);
        
        % Se calcula la nueva frecuencia de muestreo ajustando por el factor de velocidad.
        fs_nueva = fs1 * factor; % Se ajusta la frecuencia de muestreo original por el factor seleccionado.

        fprintf('Reproduciendo audio a %.1f veces la velocidad normal...\n', factor);
        disp(' ');

        % Reproduce la señal de audio ajustada a la nueva frecuencia de muestreo.
        soundsc(x1, fs_nueva); 

        % Guarda la versión modificada del audio.
        archivo_salida = sprintf('SYSPPM1_%.1fx.wav', factor);
        audiowrite(archivo_salida, x1, fs_nueva);
        fprintf('Audio guardado a %.1f veces la velocidad normal: %s\n', factor, archivo_salida);
        disp(' ');
        clc;
    else
        disp('Opción no válida. Intente de nuevo.'); 
        clc;
    end
end
