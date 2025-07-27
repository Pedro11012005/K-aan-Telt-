tic;
% Initializing
k = 2;
ME = lme(k);
MI = lmi(k);
MD = lmd(k);
MN = lmn(k);
MR = lmr(k);
MC = lmc(k);

% Boolean network
% A = MN MD C F
% B = A
% C = B
% D = MC MC MN I MN C MN F
% E = D
% F = E
% G = MN MD F I
% H = G
% I = H

eqn = 'MN MD C F A B MC MC MN I MN C MN F D E MN MD F I G H';

[expr,vars] = stdform(eqn);

L = eval(expr)




bn(L);

toc;
