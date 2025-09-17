cell(I, J) :- I=1..R, J=1..C, rows(R), cols(C).

{assign_(I, J, D): D=0..T} = 1:- cell(I, J), rd(I, T), cd(J, T1).

%:- assign(I, J, D), assign(I, J, D1), D!=D1.

:- #sum{D, I : assign_(I, J, D)} != T, cd(J, T).
:- #sum{D, J : assign_(I, J, D)} != T, rd(I, T).

assign(I, J, D) :- assign_(I, J, D), D != 0.

:- assign(I, J, _), assign(I, J1, _), J1 > J+1, not assign(I, J+1, _).
:- assign(I, J, _), assign(I1, J, _), I1 > I+1, not assign(I+1, J, _).

:- assign(I, J, _), assign(I1, J1, _), not assign(I1+1, J1+1, _), not assign(I1+1, J1, _), not assign(I1+1, J1-1, _), not assign(I1, J1+1, _), not assign(I1, J1, _), not assign(I1, J1-1, _), not assign(I1-1, J1+1, _), not assign(I1-1, J1, _), not assign(I1-1, J1-1, _).

#show assign/3.
#show rows/1.
#show cols/1.
