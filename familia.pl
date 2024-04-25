% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

hijo(juan, antonio).
hijo(rodrigo, antonio).
hijo(marta, antonio).
hijo(juan, ana).
hijo(rodrigo, ana).
hijo(marta, ana).
hijo(carmen, luis).
hijo(ricardo, juan).
hijo(alicia, rodrigo).

% Reglas
matrimonio_reflexivo(X, Y) :-
    matrimonio(X, Y);
    matrimonio(Y, X).

hijo_de(X, Y) :-
    hijo(X, Y).

nieto_de(X, Z) :-
    hijo_de(X, Y),
    hijo_de(Y, Z).

abuelo_de(X, Z) :-
    hijo_de(Z, Y),
    hijo_de(Y, X).

hermano_de(X, Y) :-
    hombre(X),
    hombre(Y),
    X \= Y,
    hijo_de(X, Z),
    hijo_de(Y, Z).

hermana_de(X, Y) :-
    mujer(X),
    mujer(Y),
    X \= Y,
    hijo_de(X, Z),
    hijo_de(Y, Z).

tio_de(X, Y) :-
    hombre(X),
    hermano_de(X, Z),
    hijo_de(Y, Z).

tia_de(X, Y) :-
    mujer(X),
    hermana_de(X, Z),
    hijo_de(Y, Z).

primo_de(X, Y) :-
    hombre(X),
    hermano_de(Z, W),
    hijo(Y, W),
    hijo(X, Z),
    X \= Y.

prima_de(X, Y) :-
    mujer(X),
    hermana_de(Z, W),
    hijo(Y, W),
    hijo(X, Z),
    X \= Y.

suegro_de(X, Y) :-
    matrimonio(X, Z),
    hijo(Y, Z).

suegra_de(X, Y) :-
    matrimonio(Z, X),
    hijo(Y, Z).