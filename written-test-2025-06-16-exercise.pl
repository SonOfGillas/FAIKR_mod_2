% Exercise 1
% split([1,2,3,4,5,6,7,8,9,0],Odd,Even)
% Even = [1, 3, 5, 7, 9]
% Odd = [1, 3, 5, 7, 9]

split([],[],[]).
split([ H | T ],[OddH | OddT], Even):-
    Rest is H mod 2,
    Rest = 1,
    OddH is H,
    split(T,OddT,Even).
split([ H | T ], Odd, [EvenH | EvenT]):-
    Rest is H mod 2,
    Rest = 0,
    EvenH is H,
    split(T,Odd,EvenT).


% Exercise 2
% solve(p(X), Depth)
% X = 1, Depth = 4

% solve(s(1), Depth)
% Depth = 1

max(A,B, A):- A > B, !.
max(_,B, B).

solve(true, 0).
solve((A,B), Depth):-!,
    solve(A, DepthA),
    solve(B, DepthB),
    max(DepthA,DepthB,Depth).
solve(A, Depth):-
    clause(A,B),
    solve(B,SubDepth),
	Depth is SubDepth + 1.

p(X):-q(X),r(X).
q(X):-t(X).
t(X):-s(X).
s(1).
r(1).