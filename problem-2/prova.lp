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

#show different_dir/4.