clc; % Limpia la ventana de comandos.

% Se carga el archivo de audio y se almacenan las muestras y la frecuencia de muestreo.
[x1, fs1] = audioread('PLRIDS.wav');  
audio_seleccionado = x1; 
fs_seleccionado = fs1; 

% Se inicializa una variable para controlar el bucle del menú principal.
continuar = true;
while continuar

    % Muestra información inicial sobre la funcionalidad del script.
    disp('=====================================================');
    disp('        Selección: Espacializador de Audio');
    disp('=====================================================');

    % Presenta las opciones de respuestas al impulso disponibles al usuario.
    disp(' ');
    disp('Seleccione la respuesta al impulso del SLIT a aplicar:');
    disp('  1. SLIT n°1');
    disp('  2. SLIT n°2');
    disp('  3. SLIT n°3');
    disp('  4. Salir');
    disp('=====================================================');
    disp(' ');
    opcion_impulso = input('Introduzca el número de su opción: ');

    % Manejo de la opción de salida del menú.
    if opcion_impulso == 4
        disp(' ');
        disp('Volviendo al menú principal...');
        break; % Finaliza el bucle
    elseif opcion_impulso < 1 || opcion_impulso > 4
        disp(' ');
        disp('Opción no válida. Intente de nuevo.');
        disp(' ');
        disp('=====================================================');
        continue; % Reinicia el bucle si la opción no es válida
    end
    
    % Se cargan y procesan las respuestas al impulso según la opción seleccionada.
    if opcion_impulso >= 1 && opcion_impulso <= 3
        nombresImpulso = {'MMR.wav', 'SLIT_MDA_E001_M2S.wav', 'SLIT_SC_E001_M2S.wav'};
        [impulso, fs_impulso] = audioread(nombresImpulso{opcion_impulso});

        % Aplica convolución entre el audio seleccionado y la respuesta al impulso.
        resultado = conv(audio_seleccionado(:,1), impulso(:,1)); % Utiliza el primer canal de ambos.
        
        % Normalización del audio.
        resultado_normalizado = resultado / max(abs(resultado));

        seguir = true;
        while seguir
        clc;
        % Ofrece al usuario la opción de escuchar la señal antes o después de la convolución.
        disp(' ');
        disp('=====================================================');
        disp(' ');
        disp('¿Desea escuchar la señal antes o después de la convolución?');
        disp('  1. Antes');
        disp('  2. Después');
        disp('  3. Seleccionar otra respuesta impulso');
        disp(' ');
        disp('=====================================================');
        disp(' ');
        opcion_escucha = input('Introduzca el número de su opción: ');
        disp(' ');

        % Control de las opciones de escucha.
        switch opcion_escucha
            case 1
                disp('Reproduciendo la señal original...');
                soundsc(audio_seleccionado, fs_seleccionado);
                pause(length(resultado_normalizado)/fs_seleccionado + 1); % Espera hasta que termine la reproducción.
                clc;
            case 2
                disp('Reproduciendo la señal resultante de la convolución...');
                soundsc(resultado_normalizado, fs_seleccionado);
                pause(length(resultado_normalizado)/fs_seleccionado + 1); % Espera hasta que termine la reproducción.
                % Guarda el audio resultante de la convolución.
                nombre_archivo_salida = sprintf('audio_convolucionado_%d.wav', opcion_impulso);
                audiowrite(nombre_archivo_salida, resultado_normalizado, fs_seleccionado);
                disp(['Audio resultante guardado como: ', nombre_archivo_salida]);
                clc;
            case 3
                disp(' ');
                disp('Volviendo al menú principal...');
                disp(' ');
                clc;
                break;
            otherwise
                disp(' ');
                disp('Opción no válida. Intente de nuevo.');
                clc;
                continue; % Reinicia el bucle de escucha si la opción no es válida.
        end
            if opcion_escucha == 3
                seguir = false; % Termina el bucle de escucha si se elige volver al menú principal.
                break;
            end
        end
    end
end
