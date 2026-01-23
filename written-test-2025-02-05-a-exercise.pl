mix([],[],[]).
mix([],L2,L2).
mix(L1,[],L1).
mix([H1 | Tail1],[H2 | Tail2],[H | NewTail]):-
    H1 > H2,
    H is H2,
    mix([H1 | Tail1],Tail2,NewTail).
mix([H1 | Tail1],[H2 | Tail2],[H | NewTail]):-
    H1 =< H2,
    H is H1,
    mix(Tail1,[H2 | Tail2],NewTail).

% mix([1,3,5], [2,4,6],Result)
% Result = [1, 2, 3, 4, 5, 6]

% mix([], [2,4,6],Result)
% Result = [2, 4, 6]

% mix([1,3,5], [],Result)
% Result = [1, 3, 5]