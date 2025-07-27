
tic;
% Example for Boolean network

% Consider the following Boolean network
% A(t+1) = MC B(t) C(t)
% B(t+1) = MN A(t)
% C(t+1) = MD B(t) C(t)

% Initializing
k = 2;

% Please note that in this toolbox any variable intialized with capital M is defined as a logical matrix, otherwise it will be considered as logical vector.
% The followings are some commonly used logical matrices
ME = lme(k); % equivalence
MI = lmi(k); % implicaiton
MD = lmd(k); % disjunction
MN = lmn(k); % negation
MR = lmr(k); % power-reducing matrix
MC = lmc(k); % conjunction

% Write the equations in a cell array as follows, here A, B, and C will be considered as logical vectors defaultly
eqn = {'MC B C', 'MN A', 'MD B C'};

% Convert the equation to a canonical form
[expr,vars] = stdform(strjoin(eqn));

% Calculate the network transition matrix
L = eval(expr)



% Analyze the dynamics of the Boolean network
bn(L);

toc;

