
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


addElement(X, [], [X]).
addElement(X, [Y | Rest], [X,Y | Rest]) :- X @< Y, !.
addElement(X, [Y | Rest1], [Y | Rest2]) :- addElement(X, Rest1, Rest2).

inserirFim(X, [], [X]).
inserirFim(X, [Y], [Y,X]):- !.
inserirFim(X, [Y | Rest1], [Y | Rest2]) :- inserirFim(X, Rest1, Rest2).

mesmaLinha(L):-
    sort(L, S),
    length(L, X),
    length(S, Y),
    X > Y.

matchingHelper([X|Xs], [Y|Ys], Index, ListofIndex) :-
    X \= Y,
    Index2 is Index + 1,
    matchingHelper(Xs, Ys, Index2, ListofIndex).


hamming_([], [], N, N).

hamming_([X|ListA], [X|ListB], N, Acc) :-
    hamming_(ListA, ListB, N, Acc).

hamming_([X|ListA], [Y|ListB], N, Acc) :-
    X \= Y,
    Acc1 is Acc + 1,
    hamming_(ListA, ListB, N, Acc1).

hamming(ListA, ListB, N) :-
    hamming_(ListA, ListB, N, 0).

mesmaDiagonal(ListaA):-
    diagonal(X),
    hamming(ListaA,X,N),
    N =< 2.

verificaSol(Lista):-
    \+ mesmaDiagonal(Lista),
    \+ mesmaLinha(Lista).


queen(Lista):-
    between(1, 4, W),
    between(1, 4, X),
    between(1, 4, Y),
    between(1, 4, Z),
    Lista = [W,X,Y,Z],
    verificaSol(Lista).










