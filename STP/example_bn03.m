
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
% E(t+1) = MX*E(t)*I(t)
% H(t+1) = MX*F(t)*H(t)
% F(t+1) = MX*F(t)*J(t)
% I(t+1) = MX*G(t)*I(t)
% G(t+1) = MX*G(t)*MX*F(t)*H(t)
% J(t+1) = MX*MX*E(t)*I(t)*J(t)

% Set X(t)=E(t)H(t)F(t)I(t)G(t)J(t)

eqn = 'MX E I MX F H MX F J MX G I MX G MX F H MX MX E I J ';

options = [];
% set the variables' order, otherwise they will be sorted in the dictionary order
options = lmset('vars',{'E','H','F','I','G','J'});

[expr,vars] = stdform(eqn,options);

L = eval(expr)



bn(L);

toc;

