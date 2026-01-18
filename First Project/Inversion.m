clc; % Limpia la ventana de comandos.

% Carga de archivos de audio y almacenamiento de muestras y tasas de muestreo.
[x2, fs2] = audioread('LUZ_OIDO.wav'); % Audio "Odio la luz azul al oído".
[x3, fs3] = audioread('ANITA.wav'); % Audio "Anita lava la tina".
[x4, fs4] = audioread('MERCEDES.wav'); % Audio "A Mercedes ese de crema".



% Bucle principal para gestionar las selecciones de audio y las opciones de reproducción.
continuar = true;
while continuar
    % Muestra información inicial sobre la funcionalidad del script.
    disp('=====================================================');
    disp('          Selección: Inversor de Audio');
    disp('=====================================================');
    disp(' '); 
    disp(' Seleccione el audio a reproducir:'); 
    disp('  1. Odio la luz azul al oído');
    disp('  2. Anita lava la tina');
    disp('  3. A Mercedes ese de crema');
    disp('  4. Salir'); 
    disp('-----------------------------------------------------');
    disp(' ');
    eleccion_audio = input('Introduzca el número del audio: '); % Captura la selección del usuario.
    nombre_archivo = ''; % Inicializa la variable para almacenar el nombre del archivo de salida.

    % Carga el audio seleccionado según la opción ingresada.
    switch eleccion_audio
        case 1
            audio_seleccionado = x2;
            fs_seleccionado = fs2;
            nombre_archivo = 'LUZ_OIDO_INVERTIDO.wav';
        case 2
            audio_seleccionado = x3;
            fs_seleccionado = fs3;
            nombre_archivo = 'ANITA_INVERTIDO.wav';
        case 3
            audio_seleccionado = x4;
            fs_seleccionado = fs4;
            nombre_archivo = 'MERCEDES_INVERTIDO.wav';
        case 4
            disp('Volviendo al menú principal...');
            break; % Termina el bucle principal si se selecciona la opción de salida.
        otherwise
            disp('Opción no válida. Intente de nuevo.');
            continue; % Reinicia el bucle si la elección no es válida.
    end

    if eleccion_audio == 4
        continuar = false; % Termina el bucle principal.
        break;
    end

    seguir = true; % Bucle secundario para manejar la reproducción del audio seleccionado.
    while seguir
        clc;
        disp('=====================================================');
        disp(' ¿Cómo desea escuchar el audio seleccionado?'); % Ofrece opciones para escuchar el audio original o invertido.
        disp('  1. Escuchar señal original');
        disp('  2. Escuchar señal invertida');
        disp('  3. Seleccionar otro audio');
        disp('-----------------------------------------------------');
        opcion = input('Introduzca el número de su opción: ');

        switch opcion
            case 1
                disp('Reproduciendo la señal original...');
                soundsc(audio_seleccionado, fs_seleccionado); % Reproduce el audio original.
                pause(length(audio_seleccionado)/fs_seleccionado + 1); % Pausa hasta que termine la reproducción.
            case 2
                disp('Reproduciendo la señal invertida...');
                audio_modificado = audio_seleccionado;
                audio_invertido = flipud(audio_modificado); % Invierte el audio.
                soundsc(audio_invertido, fs_seleccionado); % Reproduce el audio invertido.
                pause(length(audio_invertido)/fs_seleccionado + 1); % Pausa hasta que termine la reproducción.
                audiowrite(nombre_archivo, audio_invertido, fs_seleccionado); % Guarda el audio invertido.
                fprintf('Audio invertido guardado como: %s\n', nombre_archivo);
            case 3
                disp('Volviendo al menú principal...');
                clc;
                break; % Termina el bucle secundario y permite seleccionar otro audio.
            otherwise
                disp('Opción no válida. Intente de nuevo.');
                clc;
                continue; % Reinicia el bucle secundario si la opción no es válida.
        end

        if opcion == 3
            seguir = false; % Termina el bucle secundario si se elige seleccionar otro audio.
            break;
        end

    end
end
