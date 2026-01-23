len([], 0).
len([_ | Tail], N) :- len(Tail, NT), N is NT+1.

append([],L2,L2).
append([H | Rest], L2, [H | NewTail]) :- append(Rest,L2,NewTail).

slice(List,1,1, []) :- 
    len(List, N), 
    N >= 1.
slice(List, Start, Start, []) :- 
    Start > 0, 
    len(List, N), 
    Start =< N.
slice([H | Tail], 1, End, Result):-
    len(Tail,TN),
    N is TN+1,
    End =< N,
    End1 is End-1,
    slice(Tail,1,End1,Result1),
    append([H],Result1, Result). 
slice([_ | Tail], Start,End, Result):- 
    Start > 0, 
    End > 0, 
    Start =< End, 
    len(Tail,TN),
    N is TN+1,
    End =< N,
    Start > 1,
    Start1 is Start -1,
    End1 is End-1,
    slice(Tail,Start1,End1,Result).


% slice([1,2,3,4,5,6,7,8,9],3,6,Result)
% Result = [3, 4, 5].