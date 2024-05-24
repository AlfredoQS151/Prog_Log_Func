:- use_module(library(pce)).
:- consult('plantas_medicinales').

% Ruta a la carpeta de imágenes
imagenes_path('C:/Users/supra/Documents/Prolog/imagenes').

% Creación de la interfaz gráfica
crear_interfaz :-
    % Obtener dimensiones de la pantalla
    get(@display, size, size(Width, Height)),
    % Crear ventana con dimensiones ajustadas
    new(Ventana, dialog('Interfaz de Plantas Medicinales')),
    send(Ventana, size, size(Width, Height)),  % Ajustar tamaño de la ventana al tamaño de la pantalla
    
    % Crear menú desplegable
    new(MenuBar, menu_bar),
    new(MenuArchivo, popup('Opciones')),
    send(MenuArchivo, append, menu_item(mini_botiquin, message(@prolog, mostrar_mini_botiquin))),
    send(MenuBar, append, MenuArchivo),
    send(Ventana, append, MenuBar),

    % Crear menú de plantas
    send(Ventana, append, new(Planta, menu(planta, cycle))),
    send_list(Planta, append, [ajo, borraja, bugambilia, brionia_blanca, ahuehuete, ajenjo, pasiflora, palo_de_flor, oregano, ortiga]),

    % Botón para mostrar información al lado del menú de selección de plantas
    send(Ventana, append, button(mostrar_informacion, message(@prolog, mostrar_informacion_gui, Planta?selection)), right),

    % Botón del Mini Botiquín al lado del botón "Mostrar información"
    send(Ventana, append, button(mini_botiquin, message(@prolog, mostrar_mini_botiquin)), right),

    % Añadir campo de búsqueda y botón de búsqueda
    send(Ventana, append, new(Search, text_item(buscar_planta))),
    send(Ventana, append, button(buscar, message(@prolog, buscar_planta, Search?selection))),

    % Añadir menú de selección de enfermedades
    send(Ventana, append, new(Enfermedad, menu(enfermedad, cycle))),
    send_list(Enfermedad, append, [hipertension, resfriado_comun, infecciones_bacterianas, colesterol_alto, artritis, problemas_respiratorios, fiebre, infecciones_del_tracto_urinario, tos, bronquitis, resfriados, infecciones_respiratorias, estrenimiento, problemas_digestivos, parasitos_intestinales, inflamaciones, ansiedad, insomnio, espasmos_musculares, dolor, dolores_musculares, heridas, infecciones_cutaneas, infecciones_fungicas, alergias, anemia, flatulencia, colicos, nauseas, golpes, retencion_de_liquidos, varices, hemorroides, enfermedades_de_la_piel, enfermedades_del_higado, irritaciones_gastricas, problemas_hepaticos, infecciones, eczema, quemaduras, estres]),
    send(Ventana, append, button(mostrar_plantas, message(@prolog, mostrar_plantas_para_enfermedad, Enfermedad?selection))),

    send(Ventana, open).

% Mostrar toda la información en una sola ventana
mostrar_informacion_gui(Planta) :-
    new(V, dialog('Información de la Planta')),
    
    (Planta \== @nil ->
        mostrar_elementos(Planta, ElementosTexto),
        mostrar_medicamentos(Planta, MedicamentosTexto),
        mostrar_efectos(Planta, EfectosTexto),
        mostrar_enfermedades(Planta, EnfermedadesTexto),
        mostrar_preparaciones(Planta, PreparacionesTexto),
        mostrar_origen(Planta, OrigenTexto),
        replace_atom('_', ' ', ElementosTexto, ElementosTextoEspacios),
        replace_atom('_', ' ', MedicamentosTexto, MedicamentosTextoEspacios),
        replace_atom('_', ' ', EfectosTexto, EfectosTextoEspacios),
        replace_atom('_', ' ', EnfermedadesTexto, EnfermedadesTextoEspacios),
        replace_atom('_', ' ', PreparacionesTexto, PreparacionesTextoEspacios),
        replace_atom('_', ' ', OrigenTexto, OrigenTextoEspacios),
        send(V, append, new(_, label(texto, string('Elementos: %s', ElementosTextoEspacios)))),
        send(V, append, new(_, label(texto, string('Medicamentos: %s', MedicamentosTextoEspacios)))),
        send(V, append, new(_, label(texto, string('Efectos: %s', EfectosTextoEspacios)))),
        send(V, append, new(_, label(texto, string('Enfermedades: %s', EnfermedadesTextoEspacios)))),
        send(V, append, new(_, label(texto, string('Preparaciones: %s', PreparacionesTextoEspacios)))),
        send(V, append, new(_, label(texto, string('Origen: %s', OrigenTextoEspacios)))),
        
        % Mostrar la imagen correspondiente
        (mostrar_imagen(V, Planta) ->
            true
        ;   send(V, append, new(_, label(texto, 'Imagen no disponible')))),
        
        send(V, open)
    ;   send(@display, inform, 'Por favor, seleccione una planta.')).

% Función para mostrar la imagen de la planta
mostrar_imagen(Ventana, Planta) :-
    imagenes_path(Dir),
    atomic_list_concat([Dir, '/', Planta, '.jpg'], Path),
    writeln('Cargando imagen desde: '), writeln(Path),  % Depuración: mostrar la ruta de la imagen
    (exists_file(Path) ->
        (catch(new(Image, image(file(Path))),
               Exception,
               (writeln('Error cargando imagen: '), writeln(Exception), fail)),
         send(Ventana, append, new(Bitmap, bitmap(Image))),
         send(Bitmap, alignment, center),
         writeln('Imagen cargada exitosamente desde: '), writeln(Path))
    ;   writeln('Archivo no encontrado: '), writeln(Path), fail).

% Buscar planta por nombre
buscar_planta(Nombre) :-
    (Nombre \== '' ->
        downcase_atom(Nombre, NombreMinuscula),  % Convertir el nombre a minúsculas
        writeln('Buscando planta: '), writeln(NombreMinuscula),  % Imprimir para depuración
        (planta(NombreMinuscula, NombreCientifico) ->
            (writeln('Planta encontrada: '), writeln(NombreCientifico),  % Imprimir para depuración
             mostrar_informacion_gui(NombreMinuscula))
        ;   send(@display, inform, 'Planta no encontrada'))
    ;   send(@display, inform, 'Por favor, introduzca un nombre de planta.')).

% Función para mostrar el Mini Botiquín de Hierbas en forma de lista vertical
mostrar_mini_botiquin :-
    new(V, dialog('Mini Botiquín de Hierbas')),
    Plantas = [anis_estrella, menta, arnica, salvia, tila, eucalipto, yerbabuena, manzanilla, cola_de_caballo, romero, toronjil, sanguinaria, linaza, hamamelis, zarzaparrilla],
    send(V, append, new(Lista, dialog_group(botiquin, group))),
    forall(member(Planta, Plantas), (
        replace_atom('_', ' ', Planta, PlantaConEspacios),
        send(Lista, append, button(PlantaConEspacios, message(@prolog, mostrar_informacion_gui, Planta)))
    )),
    send(V, open).

% Reemplazar todos los guiones bajos por espacios en el nombre de la planta
replace_atom(Old, New, Input, Output) :-
    atomic_list_concat(Atoms, Old, Input),
    atomic_list_concat(Atoms, New, Output).

% Mostrar plantas que curan una enfermedad seleccionada
mostrar_plantas_para_enfermedad(Enfermedad) :-
    new(V, dialog('Plantas para la Enfermedad')),
    findall(Planta, cura(Planta, Enfermedad), Plantas),
    atomic_list_concat(Plantas, ', ', PlantasTexto),
    send(V, append, new(_, label(texto, string('Plantas que curan %s: %s', Enfermedad, PlantasTexto)))),
    send(V, open).

% Reglas para obtener y formatear la información
mostrar_elementos(Planta, Texto) :-
    findall(Elemento, elemento(Planta, Elemento), Elementos),
    atomic_list_concat(Elementos, ', ', Texto).

mostrar_medicamentos(Planta, Texto) :-
    findall(Medicamento, medicamento(Planta, Medicamento), Medicamentos),
    atomic_list_concat(Medicamentos, ', ', Texto).

mostrar_efectos(Planta, Texto) :-
    findall(Efecto, efecto(Planta, Efecto), Efectos),
    atomic_list_concat(Efectos, ', ', Texto).

mostrar_enfermedades(Planta, Texto) :-
    findall(Enfermedad, cura(Planta, Enfermedad), Enfermedades),
    atomic_list_concat(Enfermedades, ', ', Texto).

mostrar_preparaciones(Planta, Texto) :-
    findall(Preparacion, preparacion(Planta, Preparacion), Preparaciones),
    atomic_list_concat(Preparaciones, ', ', Texto).

mostrar_origen(Planta, Texto) :-
    origen(Planta, Origen),
    atomic_list_concat([Origen], ', ', Texto).

:- crear_interfaz.
