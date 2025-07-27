
tic;
% Initializing
k = 2;
ME = lme(k);
MI = lmi(k);
MD = lmd(k);
MN = lmn(k);
MR = lmr(k);
MC = lmc(k);
MX = lm([2 1 1 2],2); % xor

% Boolean network
% A = MN MI K H 
% B = MN MI A C 
% C = MI D I 
% D = MC J K 
% E = MI C F 
% F = MN MI E G 
% G = MN MC B E 
% H = MN MI F G 
% I = MN MI H I 
% J = J 
% K = K

eqn = 'MN MI K H MN MI A C MI D I MC J K MI C F MN MI E G MN MC B E MN MI F G MN MI H I J K';

options = lmset('vars', {'A','B','C','D','E','F','G','H','I','J','K'});
expr = stdform(eqn, options);


L = eval(expr);


bn(L);

toc;
