clc; % Limpia la ventana de comandos.

[RespuestaImpulso, fsRespuestaImpulso] = audioread('Botella.wav'); % Audio para la respuesta al impulso.
[EHLSDSADLRIDUS, fsEHLSDSADLRIDUS] = audioread('EHLSDSADLRIDUS.wav'); % Audio para la señal de entrada.

% Realiza la convolución utilizando solo el primer canal de ambos audios.
resultado_c = conv(RespuestaImpulso(:,1), EHLSDSADLRIDUS(:,1));

% Normaliza el resultado de la convolución para evitar la saturación, asegurando que los valores estén entre -1 y 1.
resultado_conv = resultado_c / max(abs(resultado_c));


% Bucle principal que permite reproducir los audios o salir.
continuar = true;
while continuar

    % Presenta un menú de usuario para interactuar con los audios.
    disp('=====================================================');
    disp('        Selección: Convolucionador de Audio');
    disp('=====================================================');
    disp(' ');
    disp('Seleccione una opción:');
    disp('  1. Reproducir la Respuesta Impulso');
    disp('  2. Reproducir la señal de entrada');
    disp('  3. Reproducir audio convolucionado');
    disp('  4. Guardar los audios');
    disp('  5. Salir');
    disp('=====================================================');
    disp(' ');
    opcion = input('Introduzca el número de su opción: ');

    switch opcion
        case 1
            disp('Reproduciendo la respuesta impulso...');
            soundsc(RespuestaImpulso, fsRespuestaImpulso); % Reproduce el audio de la respuesta al impulso.
            pause(length(RespuestaImpulso)/fsRespuestaImpulso + 1); % Espera hasta que termine la reproducción.
            clc;
        case 2
            disp('Reproduciendo la señal de entrada...');
            soundsc(EHLSDSADLRIDUS, fsEHLSDSADLRIDUS); % Reproduce el audio de la señal de entrada.
            pause(length(EHLSDSADLRIDUS)/fsEHLSDSADLRIDUS + 1); % Espera hasta que termine la reproducción.
            clc;
        case 3
            disp('Reproduciendo el audio resultante de la convolución...');
            soundsc(resultado_conv, fsRespuestaImpulso); % Reproduce el audio resultante de la convolución.
            pause(length(resultado_conv)/fsRespuestaImpulso + 1); % Espera hasta que termine la reproducción.
            clc;
        case 4
            % Guarda los audios procesados y originales en archivos separados.
            audiowrite('RespuestaImpulso_guardado.wav', RespuestaImpulso, fsRespuestaImpulso);
            audiowrite('EHLSDSADLRIDUS_guardado.wav', EHLSDSADLRIDUS, fsEHLSDSADLRIDUS);
            audiowrite('Resultado_Convolucion.wav', resultado_conv, fsRespuestaImpulso);
            disp('Audios guardados correctamente.');
            clc;
        case 5
            disp('Volviendo al menú principal...');
            clc;
            break; % Sale del bucle.
        otherwise
            disp('Opción no válida, intente de nuevo.');
            disp('=====================================================');
            clc;
    end
end
