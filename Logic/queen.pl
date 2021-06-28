% Fatos
diagonal([4,0,0,0]).
diagonal([3,4,0,0]).
diagonal([2,3,4,0]).
diagonal([1,2,3,4]).
diagonal([0,1,2,3]).
diagonal([0,0,1,2]).
diagonal([0,0,0,1]).

diagonal([1,0,0,0]).
diagonal([2,1,0,0]).
diagonal([3,2,1,0]).
diagonal([4,3,2,1]).
diagonal([0,4,3,2]).
diagonal([0,0,4,3]).
diagonal([0,0,0,4]).

%Regras

mesmaLinha(Lista):-
    sort(Lista, S),
    length(Lista, X),
    length(S, Y),
    X > Y.

diferenca([], [], N, N).

diferenca([X|ListaA], [X|ListaB], N, Count) :-
    diferenca(ListaA, ListaB, N, Count).

diferenca([X|ListaA], [Y|ListaB], N, Count) :-
    X \= Y,
    Count1 is Count + 1,
    diferenca(ListaA, ListaB, N, Count1).


mesmaDiagonal(ListaA):-
    diagonal(Diagonal),
    diferenca(ListaA,Diagonal,N,0),
    N =< 2.

verificaSolucao(Lista):-
    \+ mesmaDiagonal(Lista),
    \+ mesmaLinha(Lista).

queen(Lista):-
    between(1, 4, W),
    between(1, 4, X),
    between(1, 4, Y),
    between(1, 4, Z),
    Lista = [W,X,Y,Z],
    verificaSolucao(Lista).










