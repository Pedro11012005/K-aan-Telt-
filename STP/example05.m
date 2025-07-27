% Examples for Boolean network

% Initializing
k = 2;
options = [];

% Please note that in this toolbox any variable intialized with capital M is defined as a logical matrix, otherwise it will be considered as logical vector.
% The followings are some commonly used logical matrices
ME = lme(k); % equivalence
MI = lmi(k); % implicaiton
MD = lmd(k); % disjunction
MN = lmn(k); % negation
MR = lmr(k); % power-reducing matrix
MC = lmc(k); % conjunction
MX = lm([2 1 1 2], 2); % xor

% choose a number from 1-5 to select a Boolean network
n = 3; 

switch n
	case 1
		% Dynamics of Boolean network
			% A(t+1) = MC*B(t)*C(t)
			% B(t+1) = MN*A(t)
			% C(t+1) = MD*B(t)*C(t)
		% Set X(t)=A(t)B(t)C(t), then
		eqn = 'MC B C MN A MD B C';
	case 2
		% Dynamics of Boolean network
		% A(t+1) = MC*B(t)*C(t)
		% B(t+1) = MN*A(t)
		% C(t+1) = B(t)
		eqn = 'MC B C MN A B';
	case 3
		% Dynamics of Boolean network
			% E(t+1) = MX*E(t)*I(t)
			% H(t+1) = MX*F(t)*H(t)
			% F(t+1) = MX*F(t)*J(t)
			% I(t+1) = MX*G(t)*I(t)
			% G(t+1) = MX*G(t)*MX*F(t)*H(t)
			% J(t+1) = MX*MX*E(t)*I(t)*J(t)
		% Set X(t)=E(t)H(t)F(t)I(t)G(t)J(t), then
        if k ~= 2 
            error('This example is only for the case k=2.');
        end
		eqn = 'MX E I MX F H MX F J MX G I MX G MX F H MX MX E I J ';
		% set the variables' order, otherwise they will be sorted in the dictionary order
		options = lmset('vars',{'E','H','F','I','G','J'});
	case 4
		% Dynamics of Boolean network
			% A(t+1) = MN*MI*K(t)*H(t)
			% B(t+1) = MN*MI*A(t)*C(t) 
			% C(t+1) = MI*D(t)*I(t) 
			% D(t+1) = MC*J(t)*K(t) 
			% E(t+1) = MI*C(t)*F(t) 
			% F(t+1) = MN*MI*E(t)*G(t) 
			% G(t+1) = MN*MC*B(t)*E(t) 
			% H(t+1) = MN*MI*F(t)*G(t) 
			% I(t+1) = MN*MI*H(t)*I(t)
			% J(t+1) = J(t) 
			% K(t+1) = K(t)
		% Set X(t)=A(t)B(t)C(t)D(t)E(t)F(t)G(t)H(t)I(t)J(t)K(t), then
		eqn = 'MN MI K H MN MI A C MI D I MC J K MI C F MN MI E G MN MC B E MN MI F G MN MI H I J K';
	case 5
		% Dynamics of Boolean network
			% A(t+1) = MN*MD*C(t)*F(t)
			% B(t+1) = A(t)
			% C(t+1) = B(t)
			% D(t+1) = MC*MC*MN*I(t)*MN*C(t)*MN*F(t)
			% E(t+1) = D(t)
			% F(t+1) = E(t)
			% G(t+1) = MN*MD*F(t)*I(t)
			% H(t+1) = G(t)
			% I(t+1) = H(t)
		% Set X(t)=A(t)B(t)C(t)D(t)E(t)F(t)G(t)H(t)I(t), then
		eqn = 'MN MD C F A B MC MC MN I MN C MN F D E MN MD F I G H';
	otherwise
		return
end

% Convert the equation to a canonical form
[expr,vars] = stdform(eqn,options,k);

% Calculate the network transition matrix
L = eval(expr)

% Analyze the dynamics of the Boolean network
[n,l,c,r0,T] = bn(L,k);

fprintf('Number of attractors: %d\n\n',n);
fprintf('Lengths of attractors:\n');
disp(l);
fprintf('\nAll attractors are displayed as follows:\n\n');
for i=1:length(c)
	fprintf('No. %d (length %d)\n\n',i,l(i));
	disp(c{i});
end
fprintf('Transient time: [r0, T] = [%d %d]\n\n',r0,T);