numberOfApprearence(_,[],0).
numberOfApprearence(X, [X | Tail],Count):-
    numberOfApprearence(X, Tail, TailCount),
    Count is TailCount+1.
numberOfApprearence(X, [ _ | Tail],Count):-numberOfApprearence(X, Tail, Count).

appeareMoreThanOnce(X,List):-
    numberOfApprearence(X,List,Count),
    Count > 1.

member(X,[X | _]).
member(X,[_ | Tail]):- member(X,Tail).

filter([],_,[]).
filter([H | Tail],L2,[H | NewTail]) :- appeareMoreThanOnce(H,L2), filter(Tail,L2,NewTail), \+ member( H,NewTail ).
filter([ _ | Tail],L2,NewTail):-
    filter(Tail,L2,NewTail).