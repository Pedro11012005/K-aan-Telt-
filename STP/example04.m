before = memory;
% This example is to show how to use vector form of logic to solve the following question:
% A said B is a liar, B said C is a liar, and C said A and B are both liars. Who is the liar?

% Set A: A is honest, B: B is honest, C: C is honest

k = 2;       % Two-valued logic
MC = lmc(k); % structure matrix for conjunction
ME = lme(k); % structure matrix for equivalance
MN = lmn(k); % structure matrix for negation
MR = lmr(k); % power-reducing matrix

% The logical expression can be written as
logic_expr = '(A=!B)&(B=!C)&(C=(!A&!B))';
% where = is equivalance, & is conjunction, and ! is negation

% convert the logic expresson to its matrix form
matrix_expr = lmparser(logic_expr);

% then obtain its canonical matrix form
expr = stdform(matrix_expr);

% calculate the structure matrix
L = eval(expr)

% The uniqe solution for L*x=[1 0]^T is x=[0 0 0 0 0 1 0 0]^T:=8[6]
sol = v2s(lm(6,8))

% One can see sol=[0 1 0], which means only B is honest, A and C are liars.
after = memory;
fprintf('Memoria usada: %.3f MB\n', (after.MemUsedMATLAB - before.MemUsedMATLAB)/1e6);
