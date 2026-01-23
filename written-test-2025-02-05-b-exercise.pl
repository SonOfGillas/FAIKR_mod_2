merge([],[],[]).
merge([],L2,L2).
merge(L1,[],L1).
merge([H1 | Tail1],[H2 | Tail2],[H | NewTail]):-
    H1 > H2,
    H is H1,
    merge(Tail1, [H2 | Tail2], NewTail).
merge([H1 | Tail1],[H2 | Tail2],[H | NewTail]):-
    H1 =< H2,
    H is H2,
    merge([H1 | Tail1], Tail2, NewTail).


% merge([5,3,1], [6,4,2],Result)
% Result = [6, 5, 4, 3, 2, 1]

% merge([5,3,1], [],Result)
% Result = [5, 3, 1]

% merge([], [6,4,2],Result)
% Result = [6, 4, 2]