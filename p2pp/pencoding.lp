nr(8). % num righe
nc(8). % num col
p(1). % num prof
s(1). % num students
b(4). % num black circles
w(4). % num white circles
o(1). % nu.m outposts
a(14). % n.um administrative staff

p1(2,4).
s1(3,5).

b1(1,1).
b2(2,9).
b3(5,5).
b4(5,9).

w1(4,5).
w2(5,3).
w3(6,4).
w4(8,4).

o(3,2,10).

a1(2,2,1).
a2(4,7,1).
a3(6,8,1).
a4(7,5,1).
a5(4,6,2).
a6(7,6,2).
a7(8,4,2).
a8(8,5,2).
a9(1,5,3).
a10(1,6,3).
a11(3,1,3).
a12(5,1,3).
a13(8,1,3).
a14(8,8,3).

%% END INSTANCES
%% START OF ENCODING

up(-1, 0).
down(1, 0).
left(0, -1).
right(0, 1).

dir(DR,DC) :- up(DR,DC).
dir(DR,DC) :- down(DR,DC).
dir(DR,DC) :- left(DR,DC).
dir(DR,DC) :- right(DR,DC).
different_dir(DR1,DC1,DR2,DC2) :- dir(DR1,DC1), dir(DR2,DC2),  DR1!=DR2.
different_dir(DR1,DC1,DR2,DC2) :- dir(DR1,DC1), dir(DR2,DC2),  DC1!=DC2.

cell(R,C) :- Nr(NR), Nc(NC), R=1..NR, C=1..NC.

straight(R1,C1,R2,C2,R3,C3) :- cell(R1,C1), dir(DR,DC), R2=R1+DR, C2=C1+DC, R3=R2+DR, C3=C2+DC.
angled(R1,C1,R2,C2,R3,C3) :- cell(R1,C1), dir(DR1,DC1), dir(DR2,DC2), different_dir(DR1,DC1,DR2,DC2), R2=R1+DR1, C2=C1+DC1, R3=R2+DR2, C3=C2+DC2.


% RICHIESTA 1
%per ogni cerchio nero sceglie 2 fence che vanno dal buco nero ad una direzione intorno e
{f(R,C,R1,C1) : dir(Rdir,Cdir), R1=R+Rdir, C1=C+Cdir} = 2 :- b(R,C).
%elimina tutti gli AS in cui le fence che passano sul cerchio nero non fanno angolo retto
:- f(R,C,R1,C1), f(R,C,R2,C2), b(R,C), !angled(R1,C1,R,C,R2,C2).
% i due segmenti successivi devono continuare in linea retta
f(R1,C1,R2,C2) :- b(R,C), f(R,C,R1,C1), straight(R,C,R1,C1,R2,C2).


% RICHIESTA 2
%per ogni cerchio bianco sceglie 2 fence che vanno dal buco bianco ad una direzione intorno e
{f(R,C,R1,C1) : dir(Rdir,Cdir), R1=R+Rdir, C1=C+Cdir} = 2 :- w(R,C).
%elimina tutti gli AS in cui le fence intorno sul cerchio bianco fanno angolo retto
:- f(R,C,R1,C1), f(R,C,R2,C2), w(R1,C1), !straight(R1,C1,R,C,R2,C2).
% i due segmenti successivi devono continuare in linea retta
f(R1,C1,R2,C2) :- w(R,C), f(R,C,R1,C1), angled(R,C,R1,C1,R2,C2).

% VINCOLO 3
f(R,C) :- f(R,C,_,_)
f(R,C) :- f(_,_,R,C) 




%   0,0     0,1     0,2
%   1,0     1,1     1,2
%   2,0     2,1     2,2



