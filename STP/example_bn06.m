% Initializing
k = 3;
ME = lme(k);
MI = lmi(k);
MD = lmd(k);
MN = lmn(k);
MR = lmr(k);
MC = lmc(k);
MU = lmu(k); % dummy matrix
MX = lm([2 1 1 2], 2); % xor

options = lmset('vars',{'A','B','C','D','E','F','G','H','I'});
eqn = {'MN MD C F', 'A', 'B', 'MC MC MN I MN C MN F', 'D', 'E', 'MN MD F I', 'G', 'H'};

% options = lmset('vars',{'E','H','F','I','G','J'});
% eqn = {'MX E I',' MX F H',' MX F J',' MX G I',' MX G MX F H',' MX MX E I J'};

% options = lmset('vars',{'E','H','F'});
% eqn = {'MX E H',' MX F H',' MX F E'};

% options = lmset('vars',{'E','F'});
% eqn = {'MX F E',' MX E F'};

% options = lmset('vars',{'A', 'B', 'C'});
% eqn = {'MI A B','ME B C','MC A C'};

% calculate the matrix
[expr,vars] = stdform(strjoin(eqn),options,k);
ML1 = eval(expr);

% use new method to calculate the matrix to avoid sometimes "out of memory", but it may be slower
eqn = completeeqn(eqn,options); % make each equation have all variables
expr = stdform(eqn,options,k);  % get the canonical form for each variable
for i=1:length(expr)            % calculate the structure matrix for each variable
    expr{i} = eval(expr{i});
end
ML2 = ctimes(expr{:});          % 

% check whether the two methods can get the same result
all(ML1==ML2)