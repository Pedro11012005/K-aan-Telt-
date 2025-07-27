% Initializing
k = 2;
ME = lme(k);
MI = lmi(k);
MD = lmd(k);
MN = lmn(k);
MR = lmr(k);
MC = lmc(k);

% Boolean network
% A = MC B C
% B = MN A
% C = B

eqn = 'MC B C MN A B';

[expr,vars] = stdform(eqn);

L = eval(expr)

bn(L);