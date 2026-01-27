% Prof solution
inOddPositions([],[]).
inOddPositions([X],[X]).
inOddPositions([X,_ | Tail], [X | NewTail]) :-
    inOddPositions(Tail,NewTail).



% My solution

odds([], [], _).

odds([H|Tail], [H|NewTail], LastIndex) :-
    1 is LastIndex mod 2,
    NextIndex is LastIndex + 1,
    odds(Tail, NewTail, NextIndex).

odds([_|Tail], NewTail, LastIndex) :-
    0 is LastIndex mod 2,
    NextIndex is LastIndex + 1,
    odds(Tail, NewTail, NextIndex).

inOddPositions([],[]).
inOddPositions(L1, L2) :-
    odds(L1, L2, 1).