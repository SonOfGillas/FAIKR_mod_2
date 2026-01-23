% exercise 1
% filter([[1,2,aaa],[],[donald,duck],[a,b,c,4]],Result)
% Result = [[1,2,aaa],[a,b,c,4]]

listWithOneInt([]):- fail.
listWithOneInt([H|_]):- number(H).
listWithOneInt([_|Tail]):- listWithOneInt(Tail).

filter([],[]).
filter([H | Tail],[H | NewTail]):-
    listWithOneInt(H),
    filter(Tail,NewTail).
filter([_ | Tail],NewTail):-
    filter(Tail,NewTail).



% exercise 2
solve(true):-!.
solve((A,B)):-!,solve(A),solve(B).
solve(A):-clause(A,B),solve(B),write("Success: "),write(A), nl.

p:- q,r.
p:- t.
q.
t.




% solve(p)
% Success: q
% Success: t
% Success: p