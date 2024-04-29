% Hechos sobre las plantas y sus usos
cura(manzanilla, problemas_digestivos, infusion).
cura(manzanilla, dolor_estomacal, infusion).
cura(valeriana, problemas_de_sueno, infusion).
cura(valeriana, ansiedad, infusion).
cura(ajo, infecciones_respiratorias, crudo).
cura(ajo, hipertension, crudo).
cura(albahaca, problemas_de_garganta, infusion).
cura(albahaca, dolor_de_cabeza, infusion).
cura(menta, problemas_digestivos, infusion).
cura(menta, dolor_de_cabeza, infusion).

% Consulta para encontrar la planta y método de preparación adecuados para un problema de salud
planta_para_problema(Problema, Planta, Metodo) :-
    cura(Planta, Problema, Metodo).

% Ejemplos de consultas:
% ¿Qué planta y método puedo usar para problemas digestivos?
% ?- planta_para_problema(problemas_digestivos, Planta, Metodo).

% ¿Qué planta y método puedo usar para la ansiedad?
% ?- planta_para_problema(ansiedad, Planta, Metodo).

% Reglas para sugerir plantas basadas en síntomas múltiples
planta_para_multiples_sintomas(Sintoma1, Sintoma2, Planta, Metodo) :-
    cura(Planta, Sintoma1, Metodo),
    cura(Planta, Sintoma2, Metodo).

% Ejemplo de consulta para múltiples síntomas:
% ¿Qué planta y método puedo usar para tratar tanto la ansiedad como el problema de sueño?
% ?- planta_para_multiples_sintomas(ansiedad, problemas_de_sueno, Planta, Metodo).

% Hechos adicionales sobre preparación
preparacion(manzanilla, infusion, 5, "caliente").
preparacion(valeriana, infusion, 7, "caliente").
preparacion(ajo, crudo, 0, "n/a").

% Relaciones de compatibilidad entre plantas
compatible(manzanilla, menta).
compatible(valeriana, ajo).
incompatible(ajo, menta).

% Reglas para recomendaciones completas basadas en múltiples síntomas
tratamiento_completo(Sintoma1, Sintoma2, Planta, Metodo, Tiempo, Temperatura) :-
    planta_para_problema(Sintoma1, Planta, Metodo),
    planta_para_problema(Sintoma2, Planta, Metodo),
    preparacion(Planta, Metodo, Tiempo, Temperatura).

% Advertencias de interacción con otros medicamentos
advertencia(Planta, Medicamento) :-
    incompatible(Planta, Medicamento),
    write('Advertencia: No usar '),
    write(Planta),
    write(' con medicamento '),
    write(Medicamento),
    write('.').

% Ejemplo de consulta de recomendación completa
% ?- tratamiento_completo(ansiedad, problemas_de_sueno, Planta, Metodo, Tiempo, Temperatura).


