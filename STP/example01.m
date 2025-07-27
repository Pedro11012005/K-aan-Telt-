% This example is to show how to perform semi-tensor product
% Sp ya trabaja con sparse si sus entradas son sparse
% Sp1 fuerza a sacar sparse sin importar que sus entradas sean sparse
% Spn ya trabaja igual con sparse si sus entradas son sparse
% Este ejemplo ya corre con sparse Check

x = [1 2 3 -1];
y = [2 1]';
sx = sparse(x);
sy = sparse(y);
r1 = sp(sx,sy)
% r1 = [5, 3]

x = [2 1];
y = [1 2 3 -1]';
sx = sparse(x);
sy = sparse(y);
r2 = sp(sx,sy)
% r2 = [5; 3]

x = [1 2 1 1; 
     2 3 1 2;
     3 2 1 0];
y = [1 -2;
     2 -1];
sx = sparse(x);
sy = sparse(y);
r3 = sp(sx,sy) 
r4 = sp1(sx,sy) 
% r3 = r4 = [3,4,-3,-5;4,7,-5,-8;5,2,-7,-4]

r5 = sp(sp(sx,sy),sy)
r6 = spn(sx,sy,sy)
% r5 = r6 = [-3,-6,-3,-3;-6,-9,-3,-6;-9,-6,-3,0]