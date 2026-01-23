isList([]).
isList([ _ | Tail]):-isList(Tail)

member(E, [E | _]).
member(E, [_ | Tail]):- member(E, Tail).
    
length([], 0).
length([H,Tail], N):-
    length(Tail,NT),
    N is NT +1.
    
append([],L2,L2).
append([H | Rest1], L2, [H | NewTail]):-
    append(Rest1,L2,NewTail).
    
deleteFirstOccurence(E1,[],[]).
deleteFirstOccurence(E1,[E1 | T], T).
deleteFirstOccurence(E1, [H | T], [H | NewTail]):- 
    deleteFirstOccurence(E1, T, NewTail).
    
deleteAllOccurence(E1,[],[])
deleteAllOccurence(E1,[E1 | T], NewList) :- 
    deleteAllOccurence(E1, T, NewList).
deleteAllOccurence(E1,[H | T], [H | NewTail]) :-
    deleteAllOccurence(E1,T,NewTail)
    
reverse([],[]).
reverse([H | Tail], Result) :-
    reverse(Tail, ResultT),
    append(ResultT,H,Result).


%vanilla meta interpreter
solve(true).
solve((A,B)):-!,solve(A),solve(B).
solve(A):-clause(A,B),solve(B).