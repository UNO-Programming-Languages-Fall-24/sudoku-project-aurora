% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const n=9.

{ sudoku(R, C, V) : V = 1..n } =1 :- R = 1..n, C = 1..n.
% Each cell in the grid should have exactly one value in range 1 through n

:- R = 1..n, C = 1..n, V1 = 1..n, V2 = 1..n, V1 != V2, sudoku(R, C, V1), initial(R, C, V2). 
% At R, C in the solution, the value must be the same as R, C in the initial set.

:- R = 1..n, V = 1..n, C1 = 1..n, C2 = 1..n, C1 != C2, sudoku(R, C1, V), sudoku(R, C2, V).
% A value must not appear in the same row more than once.

:- R1 = 1..n, R2 = 1..n, V = 1..n, C = 1..n, R1 != R2, sudoku(R1, C, V), sudoku(R2, C, V).
% A value must not appear in the same column more than once.

subgrid(R, C, S) :- R = 1..n, C = 1..n, GSIZE = 1..n, GSIZE * GSIZE = n, S = 1 + (((R - 1) / GSIZE) * GSIZE + (C - 1) / GSIZE).
% A subgrid is a sqrt(n) x sqrt(n) grid that divides the main grid into n subgrids. 

:- R1 = 1..n, R2 = 1..n, C1 = 1..n, C2 = 1..n, R1 != R2, C1 != C2, S = 1..n, subgrid(R1, C1, S), subgrid(R2, C2, S), sudoku(R1, C1, V), sudoku(R2, C2, V).
% A number must not appear more than once within a subgrid

#show sudoku/3.
