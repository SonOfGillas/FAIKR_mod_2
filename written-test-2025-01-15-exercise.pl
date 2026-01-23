len([], 0).
len([_ | Tail], N) :- len(Tail, NT), N is NT+1.

append([],L2,L2).
append([H | Rest], L2, [H | NewTail]) :- append(Rest,L2,NewTail).

slice(List,1,1, []) :- 
    % this are just boundary conditions
    len(List, N), 
    N >= 1.
slice(List, Start, Start, []) :- 
    % this are just boundary conditions
    Start > 0, 
    len(List, N), 
    Start =< N.
slice([H | Tail], 1, End, Result):-
    % this are just boundary conditions
    End > 0,
    len(Tail,TN),
    N is TN+1,
    End =< N,
    % take the head and continue slicing the tail
    End1 is End-1,
    slice(Tail,1,End1,Result1),
    append([H],Result1, Result). 
slice([_ | Tail], Start,End, Result):- 
    % this are just boundary conditions
    Start > 0, 
    End > 0, 
    Start =< End, 
    len(Tail,TN),
    N is TN+1,
    End =< N,
    % skip the head and continue slicing the tail
    Start > 1,
    Start1 is Start -1,
    End1 is End-1,
    slice(Tail,Start1,End1,Result).


% slice([1,2,3,4,5,6,7,8,9],3,6,Result)
% Result = [3, 4, 5].