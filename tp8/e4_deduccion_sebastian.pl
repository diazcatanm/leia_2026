
% ================================================================
% HECHOS:
% ================================================================

% clasificación de acciones
bueno(ayudar).
malo(mentir).

% acciones por persona
hace(sebastian, ayudar).
hace(sebastian, mentir).

% ================================================================
% REGLAS
% ================================================================

% Persona buena
es_buena(P) :- hace(P,A) , bueno(A).

% Persona mala
es_mala(P) :- hace(P,A) , malo(A).
