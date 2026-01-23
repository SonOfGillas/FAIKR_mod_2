mult_list(_,[],[]).
mult_list(N,[H | Tail], [H2 | NewTail]):-
    H2 is H * N,
    mult_list(N, Tail, NewTail).

remove_empty_lists([],[]).
remove_empty_lists([H | Tail],NewTail):-
    H = [],
    remove_empty_lists(Tail,NewTail).
remove_empty_lists([H | Tail],[H | NewTail]):- 
    remove_empty_lists(Tail,NewTail).

multiply_lists(_,[],[]).
multiply_lists(N,[List | Tail],[ListN | NewTail]):-
    mult_list(N,List,ListN),
    multiply_lists(N,Tail,NewTail).

mult(N,TheList,Result):-
    multiply_lists(N,TheList,ResultN),
    remove_empty_lists(ResultN,Result).


% mult(3,[[1,2,3],[],[4,5,6]],Result)
% Result = [[3, 6, 9], [12, 15, 18]]