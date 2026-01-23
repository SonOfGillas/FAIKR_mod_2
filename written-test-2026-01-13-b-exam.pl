% exercise 1
% filter([[1,2.14,aaa],[],[donald,duck, 3],[a,b,c,4.0]],Result)
% Result = [[1,2.14,aaa],[a,b,c,4.0]]

listWithOneFloat([]):- fail.
listWithOneFloat([H|_]):- float(H).
listWithOneFloat([_|Tail]):- listWithOneFloat(Tail).

filter([],[]).
filter([H | Tail],[H | NewTail]):-
    listWithOneFloat(H),
    filter(Tail,NewTail).
filter([_ | Tail],NewTail):-
    filter(Tail,NewTail).



% exercise 2
solve(true):-!.
solve((A,B)):-!,solve(A),solve(B).
solve(A):-clause(A,B),solve(B),write("Done: "),write(A), nl.

p:- q,r.
p:- t.
q.
t.
