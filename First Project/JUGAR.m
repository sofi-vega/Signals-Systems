clc; % Limpia la ventana de comandos.

% Inicio del bucle principal del juego que se repite mientras la variable gameon sea verdadera.
gameon = true;
while gameon

    clc; % Limpia la ventana de comandos al inicio de cada iteración del bucle

    % Visualización del menú principal del juego
    disp('=====================================================');
    disp('                  OPCIONES DE JUEGO                  ');
    disp('=====================================================');
    disp('  Seleccione un audio:');
    disp(' ');
    disp('  1. Canción 1: People you Know || Selena Gómez');
    disp('  2. Canción 2: Antihero || Taylor Swift');
    disp('  3. Frase Palíndroma 1: God Lived as an Evil Dog');  
    disp('  4. Frase Palíndroma 2: Eva usaba rímel y le miraba suave');
    disp('  5. Frase Palíndroma 3: A man a plan a canal Panama');
    disp('  6. Volver al menú principal');
    disp('=====================================================');
    disp(' ');

    % Captura de la selección del usuario
    opcion = input('Introduzca el número de su opción: ');
    disp('-----------------------------------------------------');

    % Manejo de la opción seleccionada por el usuario
    switch opcion
        case 1
            manejarAudio('CancionSelena.wav');
        case 2
            manejarAudio('CancionTaylor.wav');
        case 3
            manejarAudio('Frase_1.wav');
        case 4
            manejarAudio('Frase_2.wav');
        case 5
            manejarAudio('Frase_3.wav');
        case 6 
            disp('¡Gracias por jugar!');
            gameon = false; % Sale del bucle
        otherwise
            disp('Opción no válida. Intenta de nuevo.');
    end   
end

% Definición de la función manejarAudio que encapsula la lógica para tratar con opciones de audio.
function manejarAudio(nombreArchivo)
    % Definición de las opciones de audio que el usuario puede seleccionar.
    opcionesAudio = {'Escalar', 'Invertir', 'Espacializar con un SLIT', 'Regresar al menú de juegos'};
    continuar = true;
    while continuar
        mostrarMenu('Opciones para el audio seleccionado:', opcionesAudio);
        opcion = input('Introduzca el número de su opción: ');
        switch opcion
            case 1
                continuar = EscalamientoJUGAR(nombreArchivo);
            case 2
                continuar = InversionJUGAR(nombreArchivo);
            case 3
                continuar = EspacializarJUGAR(nombreArchivo);
            case 4
                continuar = false; % Sale del bucle de manejarAudio
            otherwise
                disp('Opción no válida. Intenta de nuevo.');
        end
    end
end

% Función para mostrar menús
function mostrarMenu(titulo, opciones)
    clc;
    disp('=====================================================');
    disp(titulo);
    disp('=====================================================');
    for i = 1:length(opciones)
        fprintf('  %d. %s\n', i, opciones{i});
    end
    disp('=====================================================');
end

function Escalamiento_audio = EscalamientoJUGAR(Audio)

clc; % Limpia la ventana de comandos para un inicio claro y ordenado.

% Carga el archivo de audio especificado.
[x1, fs1] = audioread(Audio); 

continuar = true;
while continuar

    clc; % Limpia la ventana de comandos al inicio de cada iteración para mantener la claridad de la interfaz.

    % Muestra un menú con opciones de velocidad de reproducción.
    disp('=====================================================');
    disp('          Selección: Escalador de Audio');
    disp('=====================================================');
    disp(' ');
    disp(' Seleccione la velocidad de reproducción:');
    disp('  1. 0.5 veces la velocidad normal');
    disp('  2. 0.8 veces la velocidad normal');
    disp('  3. Velocidad normal');
    disp('  4. 1.2 veces la velocidad normal');
    disp('  5. 1.5 veces la velocidad normal');
    disp('  6. 2 veces la velocidad normal');
    disp('  7. Escoger otra opción para el audio');
    disp('-----------------------------------------------------');
    disp(' ');
    
    % Captura la elección del usuario desde el teclado.
    opcion = input('Introduzca el número de su opción: ');
    disp(' ');
    
    % Evalúa la elección del usuario y actúa en consecuencia.
    if opcion == 7
        disp('Volviendo al menú de opciones...');
        continuar = false; % Sale del bucle y termina la función.
        Escalamiento_audio = true; % Retorna true para indicar una salida exitosa.

    elseif opcion >= 1 && opcion <= 6 
        % Asigna los factores de velocidad según la elección del usuario.
        factores = [0.5, 0.8, 1, 1.2, 1.5, 2];
        factor = factores(opcion); % Obtiene el factor correspondiente a la elección.
        
        % Ajusta la frecuencia de muestreo según el factor elegido para cambiar la velocidad de reproducción.
        fs_nueva = fs1 * factor; % Calcula la nueva frecuencia de muestreo.

        fprintf('Reproduciendo audio a %.1f veces la velocidad normal...\n', factor);
        disp(' ');

        % Reproduce la señal ajustada utilizando la nueva frecuencia de muestreo.
        soundsc(x1, fs_nueva); 

    else
        disp('Opción no válida. Intente de nuevo.'); 
    end
    disp('=====================================================');
end
end


function Espacializacion_JUGAR = EspacializarJUGAR(Audio)

clc; % Limpia la ventana de comandos para empezar con una interfaz limpia.

% Carga del archivo de audio especificado.
[x1, fs1] = audioread(Audio);  
audio_seleccionado = x1; 
fs_seleccionado = fs1;   

% Bucle principal que mantiene el menú activo hasta que el usuario decida salir.
continuar = true;
while continuar

    clc; % Limpia la ventana de comandos en cada iteración para mantener la interfaz limpia.

    % Presenta el menú de opciones de respuesta al impulso para la espacialización.
    disp('=====================================================');
    disp('        Selección: Espacializador de Audio');
    disp('=====================================================');
    disp(' ');
    disp('Seleccione la respuesta al impulso del SLIT a aplicar:');
    disp('  1. SLIT n°1');
    disp('  2. SLIT n°2');
    disp('  3. SLIT n°3');
    disp('  4. Escoger otra opción para el audio');
    disp('=====================================================');
    disp(' ');
    opcion_impulso = input('Introduzca el número de su opción: ');

    % Manejo de la opción de salida o entrada inválida.
    if opcion_impulso == 4
        disp('Volviendo al menú de opciones...');
        Espacializacion_JUGAR = true; % Retorna verdadero para indicar que se puede continuar.
        continuar = false; % Finaliza el bucle principal.
    elseif opcion_impulso < 1 || opcion_impulso > 4
        disp('Opción no válida. Intente de nuevo.');
        continue; % Retorna al inicio del bucle si la elección no es válida.
    end
    
    % Procesamiento de la opción seleccionada para aplicar la respuesta al impulso.
    if opcion_impulso >= 1 && opcion_impulso <= 3
        nombresImpulso = {'MMR.wav', 'SLIT_MDA_E001_M2S.wav', 'SLIT_SC_E001_M2S.wav'};
        [impulso, fs_impulso] = audioread(nombresImpulso{opcion_impulso});

        % Aplicación de la convolución utilizando el primer canal.
        resultado = conv(audio_seleccionado(:,1), impulso(:,1)); 

        seguir = true; % Bucle secundario para opciones de escucha.
        while seguir

            disp('¿Desea escuchar la señal antes o después de la convolución?');
            disp('=====================================================');
            disp('  1. Antes');
            disp('  2. Después');
            disp('  3. Seleccionar otra respuesta impulso');
            disp('=====================================================');
            opcion_escucha = input('Introduzca el número de su opción: ');

            switch opcion_escucha
                case 1
                    disp('Reproduciendo la señal original...');
                    soundsc(audio_seleccionado, fs_seleccionado); % Reproduce el audio original.
                    pause(length(resultado)/fs_seleccionado + 1); % Espera hasta que el audio termine de reproducirse.
                case 2
                    disp('Reproduciendo la señal resultante de la convolución...');
                    soundsc(resultado, fs_seleccionado); % Reproduce el audio resultante de la convolución.
                    pause(length(resultado)/fs_seleccionado + 1);
                case 3
                    disp('Volviendo al menú principal...');
                    break; % Sale del bucle secundario.
                otherwise
                    disp('Opción no válida. Intente de nuevo.');
                    continue; % Continúa el bucle si la elección no es válida.
            end
            if opcion_escucha == 3
                seguir = false; % Finaliza el bucle secundario si el usuario elige seleccionar otro audio.
            end
        end
    end
    disp('=====================================================');
end
end

function Inversion_audio = InversionJUGAR(Audio)

clc; % Limpia la ventana de comandos.

% Carga el archivo de audio especificado por el usuario.
[x2, fs2] = audioread(Audio);

% Asignación de las variables.
audio_seleccionado = x2;
fs_seleccionado = fs2;

% Variable de control para el bucle de la interfaz de usuario.
seguir = true;
while seguir

    clc; % Limpia la ventana de comandos.

    % Presenta el menú de opciones para el audio.
    disp('=====================================================');
    disp('        Selección: Inversor de Audio');
    disp('=====================================================');
    disp(' ');
    disp(' ¿Cómo desea escuchar el audio seleccionado?');
    disp('  1. Escuchar señal original');
    disp('  2. Escuchar señal invertida');
    disp('  3. Escoger otra opción para el audio');
    disp(' ');
    disp('-----------------------------------------------------');
    disp(' ');
    opcion = input('Introduzca el número de su opción: ');

    switch opcion
        case 1
            disp('Reproduciendo la señal original...');
            soundsc(audio_seleccionado, fs_seleccionado); % Reproduce la señal original.
            pause(length(audio_seleccionado)/fs_seleccionado + 1); % Pausa la ejecución hasta que el audio termine de reproducirse.
        case 2
            disp('Reproduciendo la señal invertida...');
            audio_modificado = audio_seleccionado; 
            audio_invertido = flipud(audio_modificado); % Invierte la señal de audio.
            soundsc(audio_invertido, fs_seleccionado); % Reproduce la señal invertida.
            pause(length(audio_invertido)/fs_seleccionado + 1); % Pausa la ejecución hasta que el audio termine de reproducirse.
        case 3
            disp('Volviendo al menú de juegos...'); 
            Inversion_audio = true;
            seguir = false; % Sale del bucle mientras.
        otherwise
            disp('Opción no válida. Intenta de nuevo.');
            continue; % Continúa el bucle mientras si la opción no es válida.
    end

    disp('====================================================='); 
end 
end
