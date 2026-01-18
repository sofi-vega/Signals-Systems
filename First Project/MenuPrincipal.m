clc; % Se limpia la ventana de comandos.
clear all; % Se eliminan los valores de las variables almacenados en memoria.

% Se muestran mensajes de inicio del proyecto en la ventana de comandos.
disp('=====================================================');
disp(' '); 
disp('           Proyecto de Señales y Sistemas');
disp(' '); 
disp('              Integrantes del Grupo:');
disp(' '); 
disp('                    Sofía Vega');
disp('                  Mariana Castillo');
disp('              Juan Sebastian Salamanca');
disp(' '); 

% Se inicializa una variable booleana para controlar el ciclo del menú principal.
continuar = true;

% Bucle principal que muestra el menú y procesa la entrada del usuario.
while continuar

    clc; % Se vuelve a limpiar la ventana de comandos cada vez que se reinicia el menú.
   
    % Se muestra el menú principal con las opciones disponibles.
    disp('=====================================================');
    disp('                  Menú Principal');
    disp('=====================================================');
    
    % Se enlistan las opciones disponibles en el menú.
    disp('Seleccione una opción:');
    disp('  1. Escalar una señal de audio');
    disp('  2. Invertir una señal de audio');
    disp('  3. Espacializar una señal mediante un SLIT');
    disp('  4. Utilizar la respuesta impulso de un SLIT');
    disp('  5. Jugar con nuevas frases palíndromas y canciones');
    disp('  6. Salir');
    disp('-----------------------------------------------------');
    
    % Se solicita al usuario que elija una opción y se captura la elección.
    opcion = input('Introduzca el número de su opción: ');
    disp('-----------------------------------------------------');
    
    % Se evalúa la elección del usuario usando una estructura switch.
    switch opcion
        case 1
            disp('Cargando Escalamiento...');
            run('Escalamiento.m'); % Se ejecuta el script para escalar señales.
        case 2
            disp('Cargando Inversión...');
            run('Inversion.m'); % Se ejecuta el script para invertir señales.
        case 3
            disp('Cargando Espacialización...');
            run('Espacializar.m'); % Se ejecuta el script para espacializar señales.
        case 4
            disp('Cargando Respuesta Impulso...');
            run('RespuestaImpulse.m'); % Se ejecuta el script de respuesta impulso.
        case 5
            disp('Cargando la opción de jugar...')
            run('JUGAR.m') % Se ejecuta el script para explorar juegos con señales.
        case 6
            disp('Saliendo del menú...');
            continuar = false; % Se termina el bucle y se sale del menú.
        otherwise
            disp('Opción no válida. Intente de nuevo.'); % Se maneja la entrada incorrecta.
    end
    disp(' '); 
end
