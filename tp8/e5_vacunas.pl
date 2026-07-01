
% --------------------------------
% VACUNAS
% a. SPIKEVAX (Moderna) bivariante (spikevaxBi)
% b. SPIKEVAX (Moderna) monovariante (spikevaxMono)
% c. COMIRNATY (Pfizer-BioNTech) bivariante (comirnaty)
% --------------------------------


% ================================================================
% HECHOS
% ================================================================

%edad minima
edad_minima(spikevaxBi, 0.5).
edad_minima(spikevaxMono, 0.5).
edad_minima(comirnaty, 12).


%contraindicaciones
contraindicacion(spikevaxBi, anafilaxia_primerDosis).
contraindicacion(spikevaxBi, alergia_primerDosis).
contraindicacion(spikevaxMono, anafilaxia_primerDosis).
contraindicacion(spikevaxMono, alergia_primerDosis).
contraindicacion(comirnaty, anafilaxia_primerDosis).
contraindicacion(comirnaty, alergia_primerDosis).


%edad de persona
edad(marianela, 5).
edad(tomas, 35).
edad(valentina, 55).
edad(abril, 27).
edad(carla, 14).
edad(mateo, 0.4).


%comorbilidades de persona
comorbilidad(marianela, alergia_primerDosis).
comorbilidad(valentina, trombocitopenia).
comorbilidad(abril, anafilaxia_primerDosis).


% ================================================================
% REGLAS
% ================================================================

existe_contraindicacion(Persona, Vacuna) :-
    comorbilidad(Persona, Comorbilidad),
    contraindicacion(Vacuna, Comorbilidad).

vacuna_apta_para_persona(Vacuna, Persona) :-
    edad(Persona, Edad),
    edad_minima(Vacuna, Minima),
    Edad >= Minima,
    \+ existe_contraindicacion(Persona, Vacuna).

% Determinar cual vacuna puede aplicarse a cada persona.
vacunas_para_persona(Persona, Vacunas) :-
    findall( X, vacuna_apta_para_persona(X, Persona), L) , sort(L, Vacunas).

