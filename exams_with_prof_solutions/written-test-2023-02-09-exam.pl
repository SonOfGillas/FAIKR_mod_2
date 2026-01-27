filter([],[]).
filter([p(X)|Tail],[p(Y) | NewTail]):-
    number(X),
    Y is X+1,
    filter(Tail,NewTail).
filter([ H | Tail],[ H | NewTail]):-
    filter(Tail,NewTail).