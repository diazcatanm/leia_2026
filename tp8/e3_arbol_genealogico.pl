
% ================================================================
% HECHOS
% ================================================================


% Padres
padre(juan,   pedro).
padre(juan,   lucia).
padre(carlos, juan).
padre(carlos, ana).
padre(pedro,  sofia).


% Madres
madre(maria,  pedro).
madre(maria,  lucia).
madre(elena,  juan).
madre(elena,  ana).
madre(laura,  sofia).


% Género (para quienes no se infieren por padre/madre)
mujer(lucia).
mujer(sofia).
mujer(ana).
mujer(elena).


% ================================================================
% REGLAS
% ================================================================


% Género (para quienes se infieren por ser padre/madre)
hombre(A) :- padre(A, _).
mujer(A) :- madre(A, _).


% Progenitor (A es progenitor de B si A es su padre/madre)
progenitor(A, B) :- padre(A, B).
progenitor(A, B) :- madre(A, B).


% hijo/a (A es hijo/hija de B si B es progenitor de A) 

hijo(A, B) :- progenitor(B, A), hombre(A).
hija(A, B) :- progenitor(B, A), mujer(A).


% Antepasado (caso base)
antepasado(A, B) :- progenitor(A, B).

% Antepasado (caso recursivo: A es antepasado de B si A es progenitor de algún C que, a su vez, es antepasado de B)
antepasado(A, B) :- progenitor(A, C), antepasado(C, B).


% hermano/a
hermanos(A, B) :- progenitor(P, A), progenitor(P, B), A \= B.
hermano(A, B) :- progenitor(P, A), progenitor(P, B), A \= B, hombre(A).
hermana(A, B) :- progenitor(P, A), progenitor(P, B), A \= B, mujer(A).


% abuelo/a (A es abuelo/a de B si A es progenitor de algún C que a su vez es progenitor de B)
abuelo(A, B) :- progenitor(A, C), progenitor(C, B), hombre(A).
abuela(A, B) :- progenitor(A, C), progenitor(C, B), mujer(A).


% tio/a
tio(A, B)  :- progenitor(P, B), hermano(A, P).
tia(A, B)  :- progenitor(P, B), hermana(A, P).


% primo/a
primo(A, B) :- progenitor(PA, A), progenitor(PB, B), hermanos(PA, PB), hombre(A).
prima(A, B) :- progenitor(PA, A), progenitor(PB, B), hermanos(PA, PB), mujer(A).

