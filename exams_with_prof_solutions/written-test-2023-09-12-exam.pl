parent(francesco, federico). 
parent(chiara, federico). 
parent(francesco, elena). 

member(X,[X | _]).
member(X, [_ | Tail]) :- member(X,Tail).

joinCouples([],[]).
joinCouples([(X,Y) | Tail],[X,Y | NewTail]) :-
    joinCouples(Tail,NewTail),
    \+ member(X,NewTail),
    \+ member(Y,NewTail).
joinCouples([(X,_) | Tail],[ X | NewTail]) :-
    joinCouples(Tail,NewTail),
    \+ member(X,NewTail).
joinCouples([(_,Y) | Tail],[ Y | NewTail]) :-
    joinCouples(Tail,NewTail),
    \+ member(Y,NewTail).
joinCouples([ _ | Tail], NewTail) :- joinCouples(Tail,NewTail).

people(Set) :-
    findall((X,Y),parent(X,Y),Couples),
    joinCouples(Couples,Set).