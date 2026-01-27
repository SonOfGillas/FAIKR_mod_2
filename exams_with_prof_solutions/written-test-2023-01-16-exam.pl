member(X, [X|_]).
member(X,[_ | Tail]):-member(X,Tail).

filter([],_,[]).
filter([H1 | Tail],L2,[H1 | NewTail]):-
    member(H1, L2),
    filter(Tail,L2,NewTail),
    \+ member(H1,NewTail).
filter([ _ | Tail],L2, NewTail):-
    filter(Tail,L2,NewTail).
