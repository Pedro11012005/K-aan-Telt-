before = memory;
tic;
% This example is to show the usage of lm class.
% Many methods are overloaded for lm class.

% Consider classical (2-valued) logic here
k = 2;

T = lm(1,k); % True
F = lm(k,k); % False

ST = double(T)
SF = double(F)

% Given a logical matrix, and convert it to lm class
A = sparse([1 0 0 0;
            0 1 1 1])
M = lm(A)
% or we can use
% M = lm([1 2 2 2], 2)

% Use m-function to perform semi-tensor product for logical matrices
% Se puede usar sparse sin que sus entradas sean sparse
r1 = lspn(M,T,F)

% Use overloaded mtimes method for lm class to perform semi-tensor product
% No se puede con sparse
r2 = M*T*F

% Create an 4-by-4 logical matrix randomly
M1 = lmrand(4)
% M1 = randlm(4)

% Convert an lm object to double (Double ahora saca Sparse)
double(M1)

% size method for lm class
size(M1)

% diag method for lm class
diag(M1)

% Identity matrix is a special type of logical matrix
I3 = leye(3)


% plus method is overloaded by Kronecher product for lm class
r3 = M1 + I3
% Alternative way to perform Kronecher product of two logical matrices
r4 = kron(M1,I3)

r4s = double(r4)

% Create an lm object by assignment
M2 = lm;
M2.n = 2;
M2.v = [1 1 2 2];
M2
M2s = double(M2)
toc;
after = memory;
fprintf('\n Memoria usada: %.5f MB\n', (after.MemUsedMATLAB - before.MemUsedMATLAB)/1e6);
