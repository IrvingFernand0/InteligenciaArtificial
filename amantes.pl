% Hechos
ama(juan, ana).
ama(ana, miguel).
ama(luis, isabel).
ama(miguel, ana).
ama(laura, juan).
ama(isabel, luis).

% Preguntas
pregunta1 :- ama(juan, X), write('Juan ama a '), write(X), nl.
pregunta2 :- ama(X, ana), write(X), write(' ama a Ana'), nl.
pregunta3 :- ama(X, _), write(X), write(' ama a alguien'), nl.
pregunta4 :- ama(_, Y), write('Alguien es amado por '), write(Y), nl.
pregunta5 :- ama(X, Y), ama(Y, X), write(X), write(' y '), write(Y), write(' se aman mutuamente'), nl.
pregunta6 :- ama(X, Y), \+ ama(Y, X), write(X), write(' ama a '), write(Y), write(' sin ser correspondido'), nl.

% Regla para describir a los amantes
amantes(X, Y) :- ama(X, Y), ama(Y, X).