% Mínimo de dos números
minimo(A, B, A) :- A =< B.
minimo(A, B, B) :- B < A.

% Área de un círculo
area_circulo(Radio, Area) :-
    Area is pi * Radio * Radio.

% Área de un trapecio
area_trapecio(BaseMayor, BaseMenor, Altura, Area) :-
    Area is ((BaseMayor + BaseMenor) * Altura) / 2.

% Producto de los números comprendidos entre dos dados
producto_entre(A, B, Producto) :-
    A =< B,
    producto_entre_aux(A, B, Producto).
producto_entre_aux(A, B, A) :- A =:= B.
producto_entre_aux(A, B, Producto) :-
    A < B,
    A1 is A + 1,
    producto_entre_aux(A1, B, ProductoAnt),
    Producto is A * ProductoAnt.