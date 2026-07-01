% ================================================================
% HECHOS
% ================================================================

tiene_skill(juan, gestion_rrhh).
tiene_skill(juan, buena_comunicacion).
tiene_skill(juan, empatia_cliente).
tiene_skill(juan, uml).
tiene_skill(juan, arquitecturas).
tiene_skill(juan, java).
tiene_skill(juan, javascript).
tiene_skill(juan, php).
tiene_skill(juan, 'c/c++').
tiene_skill(juan, python).
tiene_skill(maria, gestion_rrhh).
tiene_skill(maria, buena_comunicacion).
tiene_skill(maria, uml).
tiene_skill(maria, java).

quiere_rol(juan, lider).
quiere_rol(juan, analista).
quiere_rol(juan, diseniador).
quiere_rol(juan, programador).
quiere_rol(maria, lider).
quiere_rol(maria, diseniador).

skill_para_rol(gestion_rrhh, lider).
skill_para_rol(buena_comunicacion, lider).
skill_para_rol(uml, diseniador).
skill_para_rol(arquitecturas, diseniador).
skill_para_rol(java, programador).
skill_para_rol(javascript, programador).
skill_para_rol(php, programador).
skill_para_rol('c/c++', programador).
skill_para_rol(python, programador).
skill_para_rol(gestion_rrhh, analista).
skill_para_rol(buena_comunicacion, analista).

posibilidad_traslado(juan, capital).
posibilidad_traslado(juan, cordoba).
posibilidad_traslado(juan, mendoza).
posibilidad_traslado(juan, exterior).
posibilidad_traslado(maria, cordoba).
posibilidad_traslado(maria, exterior).

% ================================================================
% REGLAS
% ================================================================


% Si una persona en particular es apta para un cierto rol.
apta_rol(P,R) :- quiere_rol(P,R) , skill_para_rol(S,R) , tiene_skill(P,S).

% personas disponibles para ocupar un cierto rol en una determinada localidad.
disponible_rol_en_ciudad(P,R,C) :- findall(X , (posibilidad_traslado(X,C) , apta_rol(X,R)), L) , sort(L,P).

% personas disponibles para un cierto rol.
disponible_rol(P,R) :- findall(X , (apta_rol(X,R)), L) , sort(L,P).

% Listar los roles que puede ocupar una persona dada.
roles_persona(P,R) :- findall(X , apta_rol(P,X), L) , sort(L,R).

